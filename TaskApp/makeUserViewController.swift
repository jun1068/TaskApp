//
//  makeUserViewController.swift
//  TaskApp
//
//  Created by 卓馬純之介 on 2022/10/30.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore


func createUser(emailText: String, passwordText: String){
       //ユーザ作成
       Auth.auth().createUser(withEmail: emailText, password: passwordText) { FIRAuthDataResult, Error in
           //nilチェック
           guard let authResult = FIRAuthDataResult else {
               print("error: SignUp")
               return
           }
           //画像が格納されるフォルダ作成
           let reference = self.storageRef.child("userProfile").child("\(authResult.user.uid).jpg")

           //nilチェック
           guard let image = self.userProfileButton.imageView?.image else{
               return
           }
           guard let uploadImage = image.jpegData(compressionQuality: 0.2) else {
               return
           }

           //画像保存を実行
           reference.putData(uploadImage, metadata: nil){(metadata, err) in
               if let error = err{
                   print("error: \(error)")
               }
           }
           //firestoreに保存するデータ
           let addData = [
               "userName": self.userNameTextField.text!
           ]

           //firestoreにユーザ情報を保存する
           let db = Firebase.Firestore.firestore()
           db.collection("users")
               .document(authResult.user.uid)
               .setData(addData)

       }
    func transition(){
            //Main.storyBoardを取得
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            ////tabBarControllerに遷移
            let tabView = storyboard.instantiateViewController(withIdentifier: "tab") as! UITabBarController
            tabView.modalPresentationStyle = .fullScreen
            //タブを指定する。
            tabView.selectedIndex = 0
            self.present(tabView, animated: true, completion: nil)
        }
    
    func createUser(emailText: String, passwordText: String){
        Auth.auth().createUser(withEmail: emailText, password: passwordText) { FIRAuthDataResult, Error in
           ,,,
            //追加
            self.transition()

        }

    }
}

