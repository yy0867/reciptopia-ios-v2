//
//  CheckIngredientRootView.swift
//  Reciptopia_iOS
//
//  Created by 김세영 on 2022/04/01.
//

import ReciptopiaUIKit
import RxSwift
import RxRelay
import RxCocoa

final class CheckIngredientRootView: BaseView {
    
    // MARK: - Properties
    let viewModel: CheckIngredientViewModelProtocol
    let disposeBag = DisposeBag()
    
    lazy var titleStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [analyzeLabel, dismissButton])
        stack.axis = .horizontal
        stack.distribution = .fillProportionally
        return stack
    }()
    
    lazy var analyzeLabel: UILabel = {
        let label = UILabel()
        label.text = "재료를 분석했어요."
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 27)
        return label
    }()
    
    lazy var dismissButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    lazy var hintLabelStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [checkIngredientLabel, hintLabel])
        stack.axis = .vertical
        stack.spacing = 15
        return stack
    }()
    
    lazy var checkIngredientLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 16)
        label.text = "재료가 맞는지 확인해주세요."
        return label
    }()
    
    lazy var hintLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 16)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        let hintString = "핵심 재료를 체크하면 해당 재료는 검색에 반드시 포함됩니다."
        let mainIngredientString = "핵심 재료"
        let range = (hintString as NSString).range(of: mainIngredientString)
        let attributedString = NSMutableAttributedString(string: hintString)
        attributedString.addAttributes([.foregroundColor: UIColor.mainIngredient], range: range)
        label.attributedText = attributedString
        
        return label
    }()
    
    lazy var addIngredientField: CapsuleField = {
        let field = CapsuleField(height: 45)
        field.placeholder = "재료를 추가합니다."
        field.returnKeyType = .done
        field.enablesReturnKeyAutomatically = true
        field.delegate = self
        field.addDoneButton()
        return field
    }()
    
    lazy var ingredientCollectionView: IngredientCollectionView = {
        let collectionView = IngredientCollectionView(
            direction: .vertical,
            cellSize: CGSize(width: UIScreen.main.bounds.width - 80, height: 45)
        )
        collectionView.ingredientDelegate = viewModel
        return collectionView
    }()
    
    lazy var analyzeButton: BottomButton = {
        let button = BottomButton(title: "레시피 찾기")
        return button
    }()
    
    // MARK: - Methods
    init(frame: CGRect = .zero, viewModel: CheckIngredientViewModelProtocol) {
        self.viewModel = viewModel
        super.init(frame: frame)
        bindViewModel()
    }
    
    // MARK: Configure UI
    override func buildHierarchy() {
        addSubview(titleStack)
        addSubview(hintLabelStack)
        addSubview(addIngredientField)
        addSubview(ingredientCollectionView)
        addSubview(analyzeButton)
    }
    
    override func activateConstraints() {
        titleStack.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).inset(30)
            make.leading.trailing.equalToSuperview().inset(30)
        }
        hintLabelStack.snp.makeConstraints { make in
            make.top.equalTo(titleStack.snp.bottom).offset(50)
            make.leading.trailing.equalToSuperview().inset(30)
        }
        addIngredientField.snp.makeConstraints { make in
            make.top.equalTo(hintLabel.snp.bottom).offset(30)
            make.leading.trailing.equalToSuperview().inset(40)
        }
        ingredientCollectionView.snp.makeConstraints { make in
            make.top.equalTo(addIngredientField.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(20)
            make.bottom.equalToSuperview()
        }
    }
    
    override func addTargets() {
        
    }
}

// MARK: - Bind ViewModel
extension CheckIngredientRootView {
    func bindViewModel() {
        viewModel.ingredients
            .bind(onNext: { [weak self] _ in
                self?.ingredientCollectionView.reloadData()
            })
            .disposed(by: disposeBag)
        
        viewModel.ingredients
            .map { $0.count < 10 }
            .bind(to: addIngredientField.rx.isEnabled)
            .disposed(by: disposeBag)
        
        viewModel.ingredients
            .map { $0.count < 10 ? "추가할 재료를 입력해주세요." : "재료는 최대 10개까지 추가할 수 있습니다." }
            .bind(to: addIngredientField.rx.placeholder)
            .disposed(by: disposeBag)
        
        viewModel.ingredients
            .map { !$0.isEmpty }
            .bind(to: analyzeButton.rx.isEnabled)
            .disposed(by: disposeBag)
    }
}

extension CheckIngredientRootView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let ingredientName = textField.text else { return false }
        viewModel.addIngredient(name: ingredientName)
        textField.text = ""
        textField.endEditing(true)
        return true
    }
}
