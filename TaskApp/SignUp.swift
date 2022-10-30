//
//  SignUp.swift
//  TaskApp
//
//  Created by 卓馬純之介 on 2022/10/30.
//

import Foundation


class makeUserViewController: UIViewController {

    @IBOutlet weak var userProfileButton: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    let storageRef = Storage.storage().reference(forURL: "Storageのurl")


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func tappedProfileButton(_ sender: Any) {
        //中のコードはコピペする
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = true

        self.present(imagePickerController, animated: true, completion: nil)
    }


    @IBAction func tappedSignUpButton(_ sender: Any) {
    }

//コピペとx codeのrefactor機能をうまく活用すべし！
extension makeUserViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        //サイズなどを変えた際に受け取るイメージ
        if let image = info[.editedImage] as? UIImage{
            userProfileButton.setImage(image.withRenderingMode(.alwaysOriginal), for: .normal)
            //大きさが何も変わっていない
        }else if let originalImage = info[.originalImage] as? UIImage{
            userProfileButton.setImage(originalImage.withRenderingMode(.alwaysOriginal), for: .normal)
        }

        userProfileButton.setTitle("", for: .normal)
        userProfileButton.imageView?.contentMode = .scaleAspectFill
        userProfileButton.contentHorizontalAlignment = .fill
        userProfileButton.contentVerticalAlignment = .fill
        userProfileButton.clipsToBounds = true
        dismiss(animated: true, completion: nil)
    }
}
