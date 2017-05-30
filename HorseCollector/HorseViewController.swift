//
//  HorseViewController.swift
//  HorseCollector
//
//  Created by Jordan Stephenson on 5/30/17.
//  Copyright © 2017 JordansHorseCollector. All rights reserved.
//

import UIKit

class HorseViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

  
    @IBOutlet weak var horseImageView: UIImageView!
    
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var horseTextField: UITextField!
    
    var imagePicker = UIImagePickerController()
    var horse : Horse? = nil
    
    @IBOutlet weak var addUpdateButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        
        if horse != nil {
            horseImageView.image = UIImage(data: horse!.image! as Data)
            horseTextField.text = horse!.title
            addUpdateButton.setTitle("Update", for: .normal)
        }
            
        else {
            deleteButton.isHidden = true
        }
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        horseImageView.image = image
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cameraTapped(_ sender: Any) {
    }
    @IBAction func photosTapped(_ sender: Any) {
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }

    @IBAction func addTapped(_ sender: Any) {
        
        if horse != nil {
            horse!.title = horseTextField.text
            horse!.image = UIImagePNGRepresentation(horseImageView.image!) as! NSData
        }
            
        else {
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            navigationController!.popViewController(animated: true)
            let horse = Horse(context: context)
            horse.title = horseTextField.text
            horse.image = UIImagePNGRepresentation(horseImageView.image!) as! NSData
            deleteButton.isHidden = true
        }
    }


}
