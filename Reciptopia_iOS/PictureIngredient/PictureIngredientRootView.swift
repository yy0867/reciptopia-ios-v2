//
//  PictureIngredientRootView.swift
//  Reciptopia_iOS
//
//  Created by 김세영 on 2022/03/29.
//

import UIKit
import SnapKit
import ReciptopiaUIKit
import RxSwift
import RxCocoa
import AVFoundation

final class PictureIngredientRootView: BaseView {
    
    // MARK: - Properties
    let viewModel: PictureIngredientViewModelProtocol
    let disposeBag = DisposeBag()
    
    lazy var backCameraView: BackCameraView = {
        let backCameraView = BackCameraView()
        backCameraView.delegate = self
        return backCameraView
    }()
    
    lazy var maskingView: UIView = {
        let view = UIView()
        view.backgroundColor = .black.withAlphaComponent(0.7)
        view.addSubview(maskingStack)
        maskingStack.snp.makeConstraints { $0.centerX.centerY.equalToSuperview() }
        return view
    }()
    
    lazy var maskingStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [managePictureButton, analyzePictureButton])
        stack.axis = .vertical
        stack.distribution = .fill
        stack.alignment = .center
        stack.spacing = 15
        return stack
    }()
    
    lazy var managePictureButton: UIButton = {
        let button = UIButton()
        button.setTitle("0 / 10", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16)
        button.setImage(UIImage(systemName: "photo"), for: .normal)
        button.tintColor = .white
        return button
    }()
    
    lazy var analyzePictureButton: UIButton = {
        let button = UIButton(title: "0개의 재료 분석하기", font: .systemFont(ofSize: 12))
        button.layer.cornerRadius = 10
        button.contentEdgeInsets = .init(top: 8, left: 10, bottom: 8, right: 10)
        return button
    }()
    
    
    lazy var photoUtilStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [
            presentPhotoAlbumButton,
            takePhotoButton,
            torchButton,
        ])
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.spacing = 60
        return stack
    }()
    
    lazy var presentPhotoAlbumButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "photo.circle"), for: .normal)
        button.setPreferredSymbolConfiguration(.init(pointSize: 40), forImageIn: .normal)
        button.tintColor = .black
        return button
    }()
    
    lazy var takePhotoButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "camera.circle"), for: .normal)
        button.setPreferredSymbolConfiguration(.init(pointSize: 50), forImageIn: .normal)
        button.tintColor = .black
        return button
    }()
    
    lazy var torchButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "flashlight.on.fill"), for: .normal)
        button.setPreferredSymbolConfiguration(.init(pointSize: 40), forImageIn: .normal)
        button.tintColor = .black
        return button
    }()
    
    // MARK: - Methods
    init(frame: CGRect = .zero, viewModel: PictureIngredientViewModelProtocol) {
        self.viewModel = viewModel
        super.init(frame: frame)
        bindViewModel()
    }
    
    // MARK: Configure UI
    override func buildHierarchy() {
        addSubview(backCameraView)
        addSubview(maskingView)
        addSubview(photoUtilStack)
    }
    
    override func activateConstraints() {
        backCameraView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(photoUtilStack.snp.top).offset(-15)
        }
        maskingView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalTo(backCameraView)
            make.height.equalTo(100)
        }
        photoUtilStack.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalTo(safeAreaLayoutGuide).inset(15)
        }
    }
    
    override func addTargets() {
        managePictureButton.addTarget(
            viewModel,
            action: #selector(PictureIngredientViewModel.managePictures),
            for: .touchUpInside
        )
        analyzePictureButton.addTarget(
            viewModel,
            action: #selector(PictureIngredientViewModel.analyzePictures),
            for: .touchUpInside
        )
        presentPhotoAlbumButton.addTarget(
            viewModel,
            action: #selector(PictureIngredientViewModel.presentAlbum),
            for: .touchUpInside
        )
        takePhotoButton.addTarget(
            self,
            action: #selector(takePhoto),
            for: .touchUpInside
        )
    }
    
    func stopCameraRunning() {
        backCameraView.stopRunning()
    }
    
    func startCameraRunning() {
        backCameraView.startRunning()
    }
    
    // MARK: - @objc methods
    @objc
    func takePhoto() {
        #if targetEnvironment(simulator)
        guard let image = UIImage(named: "FakeFoodImage"),
              let imageData = image.jpegData(compressionQuality: 1) else { return }
        viewModel.addPicture(data: imageData)
        #else
        backCameraView.takePhoto()
        #endif
    }
}

// MARK: - Bind ViewModel
extension PictureIngredientRootView {
    func bindViewModel() {
        bindIngredientCountToView()
    }
    
    func bindIngredientCountToView() {
        viewModel.ingredientPictures
            .observe(on: MainScheduler.asyncInstance)
            .map { "\($0.count) / \(self.viewModel.maxPictureCount)" }
            .bind(to: managePictureButton.rx.title())
            .disposed(by: disposeBag)
        
        viewModel.ingredientPictures
            .observe(on: MainScheduler.asyncInstance)
            .map { "\($0.count)개의 재료 분석하기" }
            .bind(to: analyzePictureButton.rx.title())
            .disposed(by: disposeBag)
        
        viewModel.ingredientPictures
            .observe(on: MainScheduler.asyncInstance)
            .map { !$0.isEmpty }
            .bind(to: managePictureButton.rx.isEnabled,
                  analyzePictureButton.rx.isEnabled)
            .disposed(by: disposeBag)
        
        viewModel.ingredientPictures
            .observe(on: MainScheduler.asyncInstance)
            .map { $0.count < self.viewModel.maxPictureCount }
            .bind(to: presentPhotoAlbumButton.rx.isEnabled,
                  takePhotoButton.rx.isEnabled)
            .disposed(by: disposeBag)
    }
}

// MARK: - Camera Delegate
extension PictureIngredientRootView: AVCapturePhotoCaptureDelegate {
    public func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        guard let imageData = photo.fileDataRepresentation() else { return }
        viewModel.addPicture(data: imageData)
    }
}
