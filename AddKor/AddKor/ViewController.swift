//
//  ViewController.swift
//  AddKor
//
//  Created by DA Mac M1 113 on 2023/09/12.
//

import UIKit

class ViewController: UIViewController {

    private let imageView: UIImageView = {
        let imageview = UIImageView()
        imageview.contentMode = .scaleToFill
        imageview.backgroundColor = .white
        return imageview
    }()
    
    
    private let button: UIButton  = {
        
        let button = UIButton()
        button.backgroundColor = .brown
        button.setTitle("Change", for: .normal )
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        
        
        
        view.backgroundColor = .orange
        view.addSubview(imageView)
        imageView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        imageView.center = view.center
        
        view.addSubview(button)
        
        getRandomPhoto()
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
        
        @objc func didTapButton(){
            getRandomPhoto()
        }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        button.frame = CGRect(x: 30, y: view.frame.size.height-150-view.safeAreaInsets.bottom, width: view.frame.size.width-60, height: 55
        )
    }
    
    func getRandomPhoto(){
        let urlString = "https://source.unsplash.com/random"
        let url = URL(string: urlString)!
        guard let data = try? Data(contentsOf: url) else{
            return
        }
        imageView.image = UIImage(data: data)
        
    }
}

