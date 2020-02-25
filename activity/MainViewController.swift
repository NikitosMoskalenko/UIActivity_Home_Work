//
//  ViewController.swift
//  activity
//
//  Created by Nikita Moskalenko on 2/23/20.
//  Copyright © 2020 Nikita Moskalenko. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: - Private properties
    
    private var textField = UITextField()
    private let shareButton = UIButton()
    private var activityViewController: UIActivityViewController? = nil
    
    // MARK: - Constants
    
    enum textForMainViewController {
        case textForPlaceholder
        case shareButtonText
        case alertAction
        case nilValue
        
        var text: String {
            switch self {
            case .textForPlaceholder:
                return "Pleas enter text"
            case .shareButtonText:
                return "Share"
            case .alertAction:
                return "OK"
            case .nilValue:
                return "nil"
            }
        }
        
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createTextField()
        createshareButton()
    }
    
    // MARK: - Private methods
    
    private func createTextField() {
        textField.frame = CGRect(x: 0, y: 0, width: 380, height: 30)
        textField.placeholder = textForMainViewController.textForPlaceholder.text
        textField.delegate = self
        textField.center = view.center
        
        view.addSubview(textField)
    }
    
    private func createshareButton() {
        shareButton.frame = CGRect(x: 50, y: 480, width: 280, height: 30)
        shareButton.setTitle(textForMainViewController.shareButtonText.text, for: .normal)
        shareButton.setTitleColor(.green, for: .normal)
        shareButton.tintColor = .darkGray
        shareButton.addTarget(self, action: #selector(shareMethods(sender:)), for: .touchUpInside)
        
        view.addSubview(shareButton)
    }
    
    @objc
    private func shareMethods(sender: Any) {
        if let text = textField.text, text.isEmpty {
            let alertController = UIAlertController(title: nil, message: textForMainViewController.textForPlaceholder.text, preferredStyle: .alert)
            let alertAction = UIAlertAction(title: textForMainViewController.alertAction.text, style: .cancel) { (_) in
                if let textByAlertController = alertController.textFields?.first?.text {
                self.textField.text = textByAlertController
                }
            }

            alertController.addAction(alertAction)
//           present(alertController, animated: true)
                        
            alertController.addTextField()

            
        }
        
        if let text = textField.text {
            activityViewController = UIActivityViewController(activityItems: [text], applicationActivities: nil)
            present(activityViewController!, animated: true)
        }
    }
    
}

