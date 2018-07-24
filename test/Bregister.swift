//
//  Bregister.swift
//  test
//
//  Created by Hackeru_Student on 6/11/18.
//  Copyright © 2018 Hackeru_Student. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation



class Bregister: UIViewController,UITableViewDataSource,UITableViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, CLLocationManagerDelegate,UITextFieldDelegate{
    
    
    @IBOutlet weak var BusinessName: UITextField!
    @IBOutlet weak var Address: UITextField!
    @IBOutlet weak var PhoneNo: UITextField!
    @IBOutlet weak var Fax: UITextField!
    @IBOutlet weak var BusinessEmail: UITextField!
    @IBOutlet weak var WebSite: UITextField!
    @IBOutlet weak var AboutBusiness: UITextField!
    
    @IBOutlet weak var FullName: UITextField!
    @IBOutlet weak var IDNo: UITextField!
    @IBOutlet weak var PersonalEmail: UITextField!
    @IBOutlet weak var PersonalPhoneNo: UITextField!
    @IBOutlet weak var Password: UITextField!
    @IBOutlet weak var RepeatedPassword: UITextField!
    
    @IBOutlet weak var BregSecondaryView: UIView!
    @IBOutlet weak var BregScrollView: UIScrollView!
    @IBOutlet var BregMainView: UIView!
    
    @IBOutlet weak var BregSecondaryViewHeight: NSLayoutConstraint!
    //catagory names
    var subCategory = 0
    
    var categoryNames = ["item 1","Item 2","Item 3","Item 4","Item 5","Item 6","Item 7"]
    
    var categorytype1 = ["x1","x2","x3","x4","x5","x6","x7","x8"]
    var categorytype2 = ["y1","y2","y3","y4","y5"]
    var categorytype3 = ["z1","z2","z3","z4","z5","z6"]
    
    var hoursArray = [String]()
    var hoursArrayData = Array(repeating: "00:00", count: 14)//*************Change this depinding on the clocks startup time
    
    
    //UI refresh controll
    var refresher : UIRefreshControl?
    
    @IBOutlet weak var btnDrop1: UIButton!
    @IBOutlet weak var btnDrop2: UIButton!
    
    @IBOutlet weak var tblView1: UITableView!
    @IBOutlet weak var tblView2: UITableView!
    
    
    var imageChose = 0 // it decides whether the user chose to upload a logo(1) or a backGround image(2)
    @IBOutlet weak var imageLogoView: UIImageView!
    @IBOutlet weak var imageBGView: UIImageView!
    let imagePicker = UIImagePickerController()
    
    @IBAction func loadLogoBtn(_ sender: Any) {// *!*!!*!!!*!!!!*!!!*!!*!* add more code here for: if cancelled state and constraints
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        imageChose = 1
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func loadBGBtn(_ sender: Any) {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        imageChose = 2
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBOutlet weak var loadLogoBtnOutlet: UIButton!
    @IBOutlet weak var loadBGBtnOutlet: UIButton!
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            if imageChose == 1 {
                imageLogoView.contentMode = .scaleAspectFit
                imageLogoView.image = pickedImage
                loadLogoBtnOutlet.alpha = 0.2
            }else{
                imageBGView.contentMode = .scaleAspectFit
                imageBGView.image = pickedImage
                loadBGBtnOutlet.alpha = 0.2
            }
        }
        dismiss(animated: true, completion: nil)
    }
    
    /*func imagePickerControllerDidCancel(picker: UIImagePickerController) {
     dismissViewControllerAnimated(true, completion: nil)
     }*/
    
    @IBOutlet weak var daysStackView: UIStackView!
    //height of the days stackview =420
    @IBOutlet weak var daysStackViewHeight: NSLayoutConstraint!
    var daysStackViewCurrentHeight = 420
    @IBOutlet weak var CategoriesStackView: UIStackView!
    
    @IBOutlet weak var allDaySwitch: UISwitch!
    @IBOutlet weak var allDayLabel: UILabel!
    
    @IBOutlet weak var daysSwitchStack: UIStackView!//switch stack for each seperate day
    @IBOutlet weak var daysSwitchStackHeight: NSLayoutConstraint!// = 50
    @IBOutlet weak var stackViewHeight: NSLayoutConstraint! //170 this is the 2 categories stack view
    
    @IBOutlet var UiPickerViewCollection: [UIPickerView]!
    var firstTimeForPicker = 1 // this var is used for one thing only -> to set pickerview switches to 7:00 at the launch of the app
    
    @IBOutlet var DaysStackCollection: [UIStackView]!
    @IBOutlet var ButtonSwitchesCollection: [UIButton]!
    @IBAction func ButtonSwitchesCollectionAction(_ sender: UIButton) {
        for button in ButtonSwitchesCollection {
            if button.tag == sender.tag{
                for stack in DaysStackCollection{
                    if stack.tag == button.tag{
                        if stack.isHidden{
                            setStackView(view: stack, hidden: false)
                            setBtnImage(view: button, image: #imageLiteral(resourceName: "CheckCircleChecked"))
                            daysStackViewHeight.constant += 60
                            ChangeScrollViewHieght(H: 60)
                            //Change3viewSizes(much: 60)
                        }else{
                            setStackView(view: stack, hidden: true)
                            setBtnImage(view: button, image: #imageLiteral(resourceName: "CheckCircleUnchecked"))
                            daysStackViewHeight.constant -= 60
                            ChangeScrollViewHieght(H: -60)
                            //Change3viewSizes(much: -60)
                        }
                        daysStackViewCurrentHeight = Int(daysStackViewHeight.constant)
                    }
                }
            }
        }
    }
    
    @IBOutlet weak var map: MKMapView!
    
    var acceptedAgreement = 0
    @IBOutlet weak var agreementBtn: UIButton!
    @IBAction func agreementBtn(_ sender: Any) {
        
        print(hoursArrayData)
        
        if acceptedAgreement == 0{
            setBtnImage(view: agreementBtn, image: #imageLiteral(resourceName: "CheckCircleChecked"))
            acceptedAgreement = 1
        }else {
            setBtnImage(view: agreementBtn, image: #imageLiteral(resourceName: "CheckCircleUnchecked"))
            acceptedAgreement = 0
        }
        
    }
    
    @IBAction func LicenseReviewBtn(_ sender: UIButton) {
        createAlert(title: "License Agreemnt", message: "You have got to have long hair to use our app")
    }
    
    func createAlert (title:String, message:String)
    {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.destructive, handler: { (action) in alert.dismiss(animated: true, completion: nil)}))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    /***************************************************************/  //View Did Loooooooad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //hide key board when click around
        self.hideKeyBoardWhenTabAround()
        
        mapTest()
        tblView1.isHidden = true
        tblView2.isHidden = true
        btnDrop2.isHidden = true
        daysStackView.isHidden = true
        daysSwitchStack.isHidden = true
        daysStackViewHeight.constant = 0
        //        imageLogoView.isHidden = true
        //        imageBGView.isHidden = true
        
        stackViewHeight.constant = 0
        
        daysSwitchStackHeight.constant = 0
        
        imagePicker.delegate = self
        
        for i in (0...23){//it fills hoursArray
            if i < 10 {
                hoursArray.insert("0\(i):00", at: hoursArray.endIndex)
                hoursArray.insert("0\(i):30", at: hoursArray.endIndex)
            }else{
                hoursArray.insert("\(i):00", at: hoursArray.endIndex)
                hoursArray.insert("\(i):30", at: hoursArray.endIndex)
            }
            
            if i <= 13 {
                if i % 2 == 0 {
                    hoursArrayData[i] = "07:00"
                }else{
                    hoursArrayData[i] = "16:00"
                }
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        BregScrollView.contentSize = CGSize(width: 0, height: 1367)
        print("this print from viewDidAppear \(scrollHeight)")
    }
    var scrollHeight = 1367
    var tables = 0// this decides the height of the tableview's height (the height of the stack view they are in)
    func Change3viewSizes (much: CGFloat){ // changes the size of Main, Scroll And Secondary Views
        //BregMainView.frame.size.height += much
        BregScrollView.frame.size.height += much
        BregSecondaryView.frame.size.height += much
    }
    
    func ChangeScrollViewHieght (H: Int)
    {
        if stackViewHeight.constant == 0 { tables = 0} else { tables = 170 }
        scrollHeight += H
        //UIScrollView.transition(with: BregScrollView, duration: 0.5, options: .transitionCrossDissolve, animations: {
        BregScrollView.contentSize = CGSize(width: 0, height: scrollHeight + tables)
        //})
        
        print("H is \(H)  and scroll is \(scrollHeight)")
    }
    
    //chek if the category table is hidden or not
    @IBAction func onClickBtnDrop1(_ sender: Any) {
        
        if tblView1.isHidden {
            setView(view: tblView1, hidden: false)
            setView(view: tblView2, hidden: true)
            stackViewHeight.constant = 170
            //CategoriesStackView.isHidden = false
        } else {
            setView(view: tblView1, hidden: true)
            stackViewHeight.constant = 0
            //CategoriesStackView.isHidden = true
        }
        if stackViewHeight.constant == 0 { tables = 0} else { tables = 170 }
        ChangeScrollViewHieght(H: 0)//0 is just for refresh
    }
    
    //chek if the subCategory table is hidden or not
    @IBAction func onClickBtnDrop2(_ sender: Any) {
        if tblView2.isHidden {
            setView(view: tblView2, hidden: false)
            setView(view: tblView1, hidden: true)
            stackViewHeight.constant = 170
            //CategoriesStackView.isHidden = false
        } else {
            setView(view: tblView2, hidden: true)
            stackViewHeight.constant = 0
            //CategoriesStackView.isHidden = true
        }
        if stackViewHeight.constant == 0 { tables = 0} else { tables = 170 }
        ChangeScrollViewHieght(H: 0)//0 is just for refresh
    }
    
    @IBAction func allDaySwitchTap(_ sender: Any) {// something is wrong here,
        if allDaySwitch.isOn {
            setStackView(view: daysStackView, hidden: true)
            setStackView(view: daysSwitchStack, hidden: true)
            daysStackViewHeight.constant = 0
            daysSwitchStackHeight.constant = 0
            allDayLabel.text = "כל היום!"
            ChangeScrollViewHieght(H: -(50 + daysStackViewCurrentHeight))
        }else{
            setStackView(view: daysStackView, hidden: false)
            setStackView(view: daysSwitchStack, hidden: false)
            daysStackViewHeight.constant = CGFloat(daysStackViewCurrentHeight)
            daysSwitchStackHeight.constant = 50
            allDayLabel.text = "איזה ימים פתוח?"
            ChangeScrollViewHieght(H: 50 + daysStackViewCurrentHeight)
        }
        //allDaySwitch.isOn = !allDaySwitch.isOn
        print("switch tapped and printed: \(scrollHeight)")
    }
    /////try this later:
    //
    //    playButton.currentTitle == "Play" ? startPlay() : stopPlay()
    //
    //////Original Code is
    //
    //    if playButton.currentTitle == "Play"{
    //    StartPlay()
    //    }else{
    //    StopPlay()
    //    }
    /////Done nigga!!!
    
    
    func setView(view: UITableView, hidden: Bool) {
        UITableView.transition(with: view, duration: 0.3, options: .transitionCrossDissolve, animations: {
            view.isHidden = hidden
            view.alpha = hidden ? 0 : 1// if hidden == true ---> view.alpha = 0 | else view.alpha = 1
        })
    }
    
    public func setStackView(view: UIStackView, hidden: Bool) {
        UIStackView.transition(with: view, duration: 0.3, options: .transitionCrossDissolve, animations: {
            view.isHidden = hidden
            view.alpha = hidden ? 0 : 1
        })
    }
    
    func setBtnImage(view: UIButton, image: UIImage) {
        UIButton.transition(with: view, duration: 0.3, options: .transitionCrossDissolve, animations: {
            view.setImage(image, for: .normal)
        })
    }
    
    
    
    private func mapTest()
    {
        map.mapType = MKMapType.standard
        let location = CLLocationCoordinate2D(latitude: 32.952047,longitude: 35.177933)
        
        // 3)
        let span = MKCoordinateSpanMake(0.05, 0.05)
        let region = MKCoordinateRegion(center: location, span: span)
        map?.setRegion(region, animated: true)
        
        // 4)
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = "iOSDevCenter-Kirit Modi"
        annotation.subtitle = "Abdalla"
        map?.addAnnotation(annotation)
    }
    
    var businessLatitude = 0.0
    var businessLongitude = 0.0
    
    @IBAction func mapLongPress(_ sender: UILongPressGestureRecognizer) {
        if sender.state != UIGestureRecognizerState.began { return }
        let touchLocation = sender.location(in: map)
        let locationCoordinate = map.convert(touchLocation, toCoordinateFrom: map)
        print("Tapped at lat: \(locationCoordinate.latitude) long: \(locationCoordinate.longitude)")
        businessLatitude = locationCoordinate.latitude
        businessLongitude = locationCoordinate.longitude
    }
    
   /* let manager = CLLocationManager()
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
        let location = locations[0]
        
        let span:MKCoordinateSpan = MKCoordinateSpanMake(0.01, 0.01)
        let myLocation:CLLocationCoordinate2D = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
        let region:MKCoordinateRegion = MKCoordinateRegionMake(myLocation, span)
        map.setRegion(region, animated: true)
        
        print(location.altitude)
        print(location.speed)
        
        self.map.showsUserLocation = true
    }*/
    let CheckEmail = CheckValidEmail()
    
    
    @IBAction func FinishBreg(_ sender: Any) {
        
        if BusinessName.text == ""{
            createAlert(title: "Empty Business Name", message: "Please enter a valid business name")
            return
        }
        if Address.text == ""{
            createAlert(title: "Empty Address", message: "Please state your business address")
            return
        }
        if PhoneNo.text == ""{
            createAlert(title: "No Phone Number ", message: "Please enter a valid phone number")
            return
        }
        if Fax.text == ""{
            createAlert(title: "Empty Fax Number", message: "Please enter a valid fax number")
            return
        }
        if BusinessEmail.text == ""{
            createAlert(title: "Empty Email Field", message: "Please enter an Email")
            return
        }
        if !CheckEmail.isValidEmail(email: BusinessEmail.text!){
            createAlert(title: "Business Email is not Valid", message: "Please enter a valid Email")
            return
        }
        if WebSite.text == ""{
            createAlert(title: "Empty Website Field", message: "Please state your business website")
            return
        }
        
        if btnDrop1.titleLabel?.text == "Select Item"{
            createAlert(title: "No Item Selected", message: "Please select an item")
            return
        }
        if btnDrop2.titleLabel?.text == "Select Type"{
            createAlert(title: "No Type Selected", message: "Please select a type")
            return
        }
        
        if imageLogoView.image == nil{
            createAlert(title: "No Logo Image", message: "Please upload a logo image")
            return
        }
        if  imageBGView.image == nil {
            createAlert(title: "No BackGround Image", message: "Please upload a background image")
            return
        }
        
       /* if AboutBusiness.text == ""{
            createAlert(title: "What about the business?", message: "Please provide more info about the business")
            return
        }*/
        
        if FullName.text == ""{
            createAlert(title: "Full Name Required", message: "Please provide your full name")
            return
        }
        if IDNo.text == ""{
            createAlert(title: "ID Required", message: "Please provide your ID number")
            return
        }
        if PersonalEmail.text == ""{
            createAlert(title: "Personal Email Required", message: "Please provide your Email")
            return
        }
        if PersonalPhoneNo.text == ""{
            createAlert(title: "Phone Number Required", message: "Please provide your phone number")
            return
        }
        if Password.text == ""{
            createAlert(title: "Password Required", message: "Please provide a password")
            return
        }
        if RepeatedPassword.text != Password.text {
            createAlert(title: "Passwords Doesn't Match", message: "Please check your password again")
        }
        
        if acceptedAgreement == 0{
            createAlert(title: "License Agreement", message: "You should read and agree to our Terms and Conditions of Use")
        }
    
        
    }
    
    
    /*func getDataFromPlist()
     {
     let path = Bundle.main.path(forResource: "myData", ofType: "plist")
     
     //get spcific dictinry in the plist
     let dataDic = NSDictionary(contentsOfFile: path!)
     
     //chek if  the requerd key is exist
     if(dataDic?.object(forKey: "catagoryNames") != nil )
     {
     //get the array
     categoryNames = dataDic?.object(forKey: "catagoryNames") as? [String]
     }
     }*/
    
    //tbaleview Functionality
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == tblView1{
            return categoryNames.count
        }else{
            if subCategory == 1 {return categorytype1.count}
            if subCategory == 2 {return categorytype2.count}
            if subCategory == 3 {return categorytype3.count}
            else{return 8}
            
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == tblView1
        {
            let cell = tblView1.dequeueReusableCell(withIdentifier: "catCell", for: indexPath)
            cell.textLabel?.text = categoryNames[indexPath.row]
            return cell
        }
        else{
            let cell2 = tblView2.dequeueReusableCell(withIdentifier: "subCell", for: indexPath)
            
            if subCategory == 1 {cell2.textLabel?.text = categorytype1[indexPath.row]}
            if subCategory == 2 {cell2.textLabel?.text = categorytype2[indexPath.row]}
            if subCategory == 3 {cell2.textLabel?.text = categorytype3[indexPath.row]}
            
            return cell2
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //change the button name to the chosin category
        if tableView == tblView1{
            btnDrop1.setTitle("\(categoryNames[indexPath.row])", for: .normal)
            btnDrop2.setTitle("Select Type", for: .normal)
            if subCategory == 0 {btnDrop2.isHidden = false;}
            if indexPath.row + 1 == 1 {subCategory = 1}
            if indexPath.row + 1 == 2 {subCategory = 2}
            if indexPath.row + 1 >= 3 {subCategory = 3}
            setView(view: tblView1, hidden: true)
        }
        if tableView == tblView2{
            if subCategory == 1 {btnDrop2.setTitle("\(categorytype1[indexPath.row])", for: .normal)}
            if subCategory == 2 {btnDrop2.setTitle("\(categorytype2[indexPath.row])", for: .normal)}
            if subCategory == 3 {btnDrop2.setTitle("\(categorytype3[indexPath.row])", for: .normal)}
            setView(view: tblView2, hidden: true)
            print("table view 2 print!@!@#!@#!@#")
        }
        tables = 0
        ChangeScrollViewHieght(H: 0)//just for refreshing Scroll height
        stackViewHeight.constant = 0
        //CategoriesStackView.isHidden = true
        // refresh data of table 2
        self.tblView2.reloadData()
        self.refresher?.endRefreshing()
        print(subCategory)
    }
    
   
    
    
}

extension Bregister: UIPickerViewDataSource, UIPickerViewDelegate{
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 48
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if firstTimeForPicker == 1 {
            for pickerView in UiPickerViewCollection {
                if pickerView.tag % 2 == 0{
                    pickerView.selectRow(14, inComponent: 0, animated: true)
                }else{
                    pickerView.selectRow(32, inComponent: 0, animated: true)
                }
            }
            firstTimeForPicker = 0
        }
        if pickerView.tag == 1 {pickerView.selectRow(32, inComponent: 0, animated: true) }
        return hoursArray[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        hoursArrayData[pickerView.tag] = hoursArray[row]
    }
    
    //    public func resetViews() {
    //        let windows = UIApplication.sharedApplication().windows as [UIWindow]
    //        let myWidows = UIApplication.
    //        for window in windows {
    //            let subviews = window.subviews as [UIView]
    //            for v in subviews {
    //                v.removeFromSuperview()
    //                window.addSubview(v)
    //            }
    //        }
    //    }
    
    
    //////////loction from map
//        @IBAction func revealRegionDetailsWithLongPressOnMap(sender: UILongPressGestureRecognizer) {
//            if sender.state != UIGestureRecognizerState.began { return }
//            let touchLocation = sender.location(in: map)
//            let locationCoordinate = map.convert(touchLocation, toCoordinateFrom: map)
//            print("Tapped at lat: \(locationCoordinate.latitude) long: \(locationCoordinate.longitude)")
//        }
    
    
}


