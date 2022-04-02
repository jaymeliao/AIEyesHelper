//
//  ViewController.swift
//  EyesHelper
//
//  Created by Jayme on 2022-03-11.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var photoImage: UIImageView!
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var loadTextIndicator: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        stopAnimate()
    }

    private func startAnimate(){
        self.loadTextIndicator.startAnimating()
    }
    
    
    
    private func stopAnimate(){
        self.loadTextIndicator.stopAnimating()
    }
    
    @IBAction func takePicture(_ sender: UIButton) {
        setupGallery();
    }
    
    
    private func setupGallery() {
        //todo: to be change to camera
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            
            let imagePhotoLibaryPicker = UIImagePickerController()
            imagePhotoLibaryPicker.delegate = self
            imagePhotoLibaryPicker.allowsEditing=true
            imagePhotoLibaryPicker.sourceType = .photoLibrary
            self.present(imagePhotoLibaryPicker, animated:true, completion: nil)
            
        }
    }
}



extension ViewController:UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        let image=info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        //print(image!)
        self.photoImage.image=image
    }
    
    
}

