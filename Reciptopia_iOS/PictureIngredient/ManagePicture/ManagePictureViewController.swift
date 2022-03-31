//
//  ManagePictureViewController.swift
//  Reciptopia_iOS
//
//  Created by 김세영 on 2022/03/31.
//

import ReciptopiaUIKit

public final class ManagePictureViewController: BaseViewController {
    
    // MARK: - Properties
    let viewModel: PictureIngredientViewModel
    
    // MARK: - Methods
    public init(viewModel: PictureIngredientViewModel) {
        self.viewModel = viewModel
        super.init()
        
        // MARK: SHOULD REMOVE HERE
        let imageData = UIImage(named: "FakeFoodImage")!.jpegData(compressionQuality: 1)!
        for _ in 0...9 {
            viewModel.addPicture(data: imageData)
        }
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        view = ManagePictureRootView(viewModel: viewModel)
    }
}
