//
//  hideKeyBoard.swift
//  test
//
//  Created by Hackeru_Student on 7/22/18.
//  Copyright © 2018 Hackeru_Student. All rights reserved.
//

import UIKit

extension UIViewController

{
  

    //hide key board
    func hideKeyBoardWhenTabAround()
    {
        //action = waht hppen when click out side the key board
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.self.dissmissKeyBoard))
        
        tap.cancelsTouchesInView = false
        
        view.addGestureRecognizer(tap)
    }
    
    // adding (Done) button to the keyBoard  in perpes to close it
    
    func DoneButton() ->UIToolbar
    {
        let toolBar = UIToolbar()
        
        //resize the keyboard size to fit the button
        toolBar.sizeToFit()
        
        //to make the butoon show in the rghit side ,need adding space to the toolbar
        let flixableSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.fixedSpace, target: nil, action: nil)
        
        //creating the done button
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action: #selector(UIViewController.self.dissmissKeyBoard))
        
        // adding the done button to toolBar and the flixable sapce
        toolBar.setItems([flixableSpace,doneButton], animated: false)
        
        
        
        return toolBar
        
    }
    
    
    //the func that hide the keyBoard
    @objc private func dissmissKeyBoard()
    {
        view.endEditing(true)
    }
    
    
    
   
    
    
}
