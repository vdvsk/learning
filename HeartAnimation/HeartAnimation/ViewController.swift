//
//  ViewController.swift
//  HeartAnimation
//
//  Created by Anduser on 25.03.2022.
//

import UIKit

class ViewController: UIViewController {
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.isUserInteractionEnabled = true
        imageView.image = UIImage(named: "tile00")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(imageView)
        setup()
    }
}

private extension ViewController {
    enum Constants {
        static let size: CGSize = .init(width: 75, height: 75)
    }

    func setup() {
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(animate)))
        imageView.heightAnchor.constraint(equalToConstant:  Constants.size.height).isActive = true
        imageView.widthAnchor.constraint(equalToConstant:  Constants.size.width).isActive = true
        imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    @objc func animate() {
        imageView.animationImages = Array(0...28).compactMap { .init(named: "tile0\($0)") }
        imageView.animationDuration = 1.0
        imageView.animationRepeatCount = 1
        imageView.startAnimating()
    }
}

