//
//  LoginViewController.swift
//  TaskApp
//
//  Created by 卓馬純之介 on 2022/10/30.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseFirestore
import FirebaseStorage




class LoginViewController: UIViewController {
    
    @IBOutlet weak var EmailTextField:UITextField!
    @IBOutlet weak var PassWordTextField:UITextField!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func tappedLoginButton(_sender:Any){
        signInUser(emailText:EmailTextField.text!,passwordText:PassWordTextField.text!)
    }
    func signInUser(emailText:String,passwordText:String){
        auth.signIn(withEmail:emailText,password:passwordText){AuthDataResult,Error in
            if let err = Error{
                print("error:")
            }
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
