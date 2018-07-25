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
        
       // toast("my test")
        
        //chking for internet connection
        let internetConnection = chickInternetConnection(myView: self.view)
        internetConnection.buttonAction(sender)
        
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
                    // show the user message there is no internet
                    internetConnection.toast("there is no internet")
                    
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
    
    
    
    
    ////////////
    
    //toast
    let toast = UIView()
    
    //toast leable
    let  toastLable = UILabel()
    
    //toast button
    let toastButton = UIButton()
    
    
    
    func toast(_ myToast : String )
    {
        
        //get the super view width
        let superViewWidth = self.view.frame.width
        
        
        toast.frame = CGRect(x: 2, y: 64, width:superViewWidth - 5 , height: 450)
        
        toast.backgroundColor = UIColor.lightGray
        
        //make rounded corners to the view
        toast.layer.cornerRadius = 25
        
        //adding leable
        let stringLength = myToast.count
        
        toastLable.frame = CGRect(x: 50, y: 150 , width: stringLength * 10 + 5, height: 50)
        
        toastLable.textAlignment = .center
        
        toastLable.text = myToast
        
        toastLable.clipsToBounds = true
        toast.addSubview(toastLable)
        
        //adding button
        toastButton.frame = CGRect(x: 10, y: 10, width: 70, height: 70)
        toastButton.addTarget(self, action:#selector(buttonAction) , for: .touchUpInside)
        //transfer the toast as paramter thrw the sender of the button
        toastButton.setTitle("✕", for: .normal)
        
        toast.addSubview(toastButton)
        
        //adding UIview as subView
        self.view.addSubview(toast)
        
        
        
    }
    
    
    
    @objc func buttonAction(_ sender : UIButton!)
    {
        self.toast.removeFromSuperview()
    }
    
    
    
    
    
    
    
    
    

   
    
   

    

}
