//
//  LoadableImageView.swift
//  ReciptopiaUIKit
//
//  Created by 김세영 on 2022/04/27.
//

import Foundation
import SnapKit

public final class LoadableImageView: UIImageView {
    
    // MARK: - Properties
    private lazy var indicatorView: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        indicator.backgroundColor = .gray.withAlphaComponent(0.7)
        return indicator
    }()
    
    // MARK: - Methods
    init() {
        super.init(frame: .zero)
        
        addSubview(indicatorView)
        indicatorView.snp.makeConstraints { make in
            make.top.leading.bottom.trailing.equalToSuperview()
        }
        self.contentMode = .scaleAspectFill
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func fetchImage(at url: URL) {
        startIndicator()
        ImageCache.shared.fetchImage(at: url) { [weak self] image in
            guard let image = image else {
                self?.stopIndicator()
                return
            }
            
            self?.stopIndicator(with: image)
        }
    }
    
    private func startIndicator() {
        indicatorView.isHidden = false
        self.bringSubviewToFront(indicatorView)
        indicatorView.startAnimating()
    }
    
    private func stopIndicator(with image: UIImage? = nil) {
        DispatchQueue.main.async {
            if let image = image {
                self.image = image
            }
            self.indicatorView.stopAnimating()
            self.indicatorView.isHidden = true
        }
    }
}
