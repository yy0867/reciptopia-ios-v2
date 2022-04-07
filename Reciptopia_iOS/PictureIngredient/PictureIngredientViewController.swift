//
//  PictureIngredientViewController.swift
//  Reciptopia_iOS
//
//  Created by 김세영 on 2022/03/29.
//

import ReciptopiaUIKit
import RxSwift
import RxRelay

public final class PictureIngredientViewController: BaseViewController {
    
    // MARK: - Properties
    let viewModel: PictureIngredientViewModelProtocol
    let disposeBag = DisposeBag()
    
    lazy var searchButton: UIButton = {
        let button = UIButton()
        button.setTitle("이름으로 검색", for: .normal)
        button.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        button.tintColor = .black
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15)
        return button
    }()
    
    lazy var notificationButton: UIBarButtonItem = {
        let item = UIBarButtonItem(
            image: UIImage(systemName: "bell.fill"),
            style: .plain,
            target: viewModel,
            action: #selector(PictureIngredientViewModel.presentNotification)
        )
        item.tintColor = .black
        return item
    }()
    
    // MARK: - Methods
    init(viewModel: PictureIngredientViewModelProtocol) {
        self.viewModel = viewModel
        super.init()
        observeViewModel()
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        view = PictureIngredientRootView(viewModel: viewModel)
        configureNavigationBar()
    }
    
    private func configureNavigationBar() {
        navigationItem.titleView = searchButton
        navigationItem.setRightBarButton(notificationButton, animated: false)
        addTargets()
    }
    
    private func addTargets() {
        searchButton.addTarget(
            viewModel,
            action: #selector(PictureIngredientViewModel.searchByName),
            for: .touchUpInside
        )
    }
}

// MARK: - Bind ViewModel
extension PictureIngredientViewController {
    func observeViewModel() {
        viewModel.action
            .bind(onNext: { [weak self] action in
                switch action {
                    case .search: self?.presentSearch()
                    case .notification: self?.presentNotification()
                    case .managePicture: self?.presentManagePicture()
                    case .analyze: self?.presentAnalyze()
                    case .album: self?.presentAlbum()
                }
            })
            .disposed(by: disposeBag)
    }
    
    private func presentSearch() {
        
    }
    
    private func presentNotification() {
        
    }
    
    private func presentManagePicture() {
        
    }
    
    private func presentAnalyze() {
        
    }
    
    private func presentAlbum() {
        let albumVC = ImagePickerController()
        albumVC.settings.selection.max = viewModel.remainPictureCount
        presentImagePicker(albumVC, select: nil, deselect: nil, cancel: nil, finish: { assets in
            self.appendImageByAssets(assets)
        })
    }
    
    private func appendImageByAssets(_ assets: [PHAsset]) {
        let manager = PHImageManager.default()
        let option = PHImageRequestOptions()
        option.deliveryMode = .opportunistic
        option.resizeMode = .exact
        option.isSynchronous = true
        
        assets.forEach { asset in
            DispatchQueue.global(qos: .background).async {
                let size = CGSize(width: asset.pixelWidth, height: asset.pixelHeight)
                manager.requestImage(for: asset, targetSize: size, contentMode: .aspectFit, options: option) {
                    [weak self] image, _ in
                    guard let imageData = image?.jpegData(compressionQuality: 1) else { return }
                    self?.viewModel.addPicture(data: imageData)
                }
            }
        }
    }
}
