//
//  ViewController.swift
//  IOSAppDevelopment
//
//  Created by Ramesh kumar penta on 02/09/20.
//  Copyright © 2020 Ramesh kumar penta. All rights reserved.
//

import UIKit
import os.log

class ViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
   
    @IBAction func selectPhotFromPhotLibrarary(_ sender: UITapGestureRecognizer) {
        MealName.resignFirstResponder()
               let imagePickerController = UIImagePickerController()
               imagePickerController.sourceType = .photoLibrary
               imagePickerController.delegate = self
               present(imagePickerController, animated: true, completion: nil)
    }
    
    
    @IBOutlet weak var MealNameLabel: UILabel!
    
    @IBOutlet weak var MealName: UITextField!
    @IBAction func setDefaultMealName(_ sender: UIButton) {
        sender.setTitleColor(.blue, for: .normal)
        MealNameLabel.text = "Default meal name label"
                   }
    
    @IBAction func Cancel(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var imageView: UIImageView!
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func SaveMeal(_ sender: UIBarButtonItem) {
    }
    
    
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else
        {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        imageView.image = selectedImage
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.MealName.delegate = self
       
        
            }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        MealNameLabel.text = textField.text
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
    }
}

