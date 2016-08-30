//
//  PhotoViewController.swift
//  Shoplist
//
//  Created by Olesia Kalashnik on 7/1/16.
//  Copyright © 2016 Olesia Kalashnik. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController  {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var cameraButton: UIBarButtonItem!
    
    let imagePicker = UIImagePickerController()
    var image : UIImage?
    
    //MARK: - Controller Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
            }
    
    @IBAction func takePhoto(sender: UIBarButtonItem) {
        self.imagePicker.sourceType = UIImagePickerControllerSourceType.camera
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func chooseFromAlbum(sender: UIBarButtonItem) {
        self.imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func cancelImagePicker(sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
}

// UIImagePickerControllerDelegate Methods
extension PhotoViewController : UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    private func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            guard let data = UIImageJPEGRepresentation(image, 0.1) else {
                self.dismiss(animated: true, completion: nil)
                return }
            self.image = UIImage(data: data)
            //self.image = image
            self.imageView.image = self.image
            if let navController = presentingViewController as? UINavigationController {
                if let addVC = navController.viewControllers.first as? AddItemTableViewController {
                    
                    addVC.image = self.image
                    addVC.imageView.image = self.image
                }
            }
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
}
