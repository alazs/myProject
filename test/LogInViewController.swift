//
//  LogInViewController.swift
//  test
//
//  Created by Hackeru_Student on 7/7/18.
//  Copyright © 2018 Hackeru_Student. All rights reserved.
//

import UIKit


class LogInViewController: UIViewController {
    
  
    
    //chek if the email valid class
    let isEmailValidClass = CheckValidEmail()
   //user name
    @IBOutlet var userName: UITextField!
  //user password
    @IBOutlet var passWord: UITextField!
    
    //chking for internet connection
    let internetConnection = chickInternetConnection()
    
    let favoSave = favoritesCoreData()
    
    override func viewDidLoad() {
        super.viewDidLoad()

      //hide keyBoard
        self.hideKeyBoardWhenTabAround()
        
     //defin the keyboard type of email input
        self.userName.keyboardType = UIKeyboardType.emailAddress
        favoSave.saveFavorites(busiFavName: "f", busiFavLink: "f")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
   // button that login
    
    @IBAction func btnLogin(_ sender: UIButton) {
        //get the user name
        let userName = self.userName.text
        //get password
        let passWord = self.passWord.text
        
        //chick if the pass or the username is empty
        if((userName?.isEmpty)!||(passWord?.isEmpty)!)
        {
            showAlert(message: "אחד השדות ריק או סיסמה או דואר אלקטרוני", title: "")
            
//            toast("my name is all", toast: myToast, toastButton: toastButton, toastLable: toastleabale)
            
            // dont contenue
            return
        }
            
    
        else
        {
            if isEmailValidClass.isValidEmail(email: userName!)
            {
                print("email is valid")
                
                //TODO :
                //if the userName or the passWord not match show message
                
                
                //cheik if there is internet or not
                if internetConnection.isConnectedToNetwork()
                {
                    //TODO :
                    //if the userName or the passWord not match show message
                    print("connected")
                    
                    
                    
                }
                else
                {
                    print("disConnected")
                }
            
            }
            
            else
            {
                print("email no valid")
                showAlert(message: " תבדוק את כתובת המייל שלך אם היא תקינה!" , title: "מייל לא תקין")
               
                return
            }
            
        }
    }
    
    
    // show adjustable message (not valid email,no internet Conection)
    private func showAlert(message: String?,title: String?)
    {
      
        let alert = UIAlertController(title: title!, message: message!, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "ok", style: UIAlertActionStyle.default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    
    
    
    
    
    

   
    
   

    

}
