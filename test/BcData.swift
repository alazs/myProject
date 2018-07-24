//
//  BcData.swift
//  test
//
//  Created by Hackeru_Student on 7/1/18.
//  Copyright © 2018 Hackeru_Student. All rights reserved.
//

import Foundation

class BcData
    
{
    private var name: String? = ""
    private var phone : String? = ""
    private var fax: String? = ""
    private var emailAddress: String? = ""
    private var addressStreet: String? = ""
    private var addressUnit: String? = ""
    private var zipcode: String? = ""
    private var website: String? = ""
    
    //emptay constractor
    init()
    {
    
    }
    
    init(myFax : String) {
        self.fax = myFax;
    }
    
    //setters and getters
    
    //name
    var reName :String
    {
        set
        {
            self.name = newValue
        }
        get
        {
            return self.name!
        }
    }
    
    //phone
    var rePhone :String
    {
        set
        {
            self.phone = newValue
        }
        get
        {
            return self.phone!
        }
    }
    
  //fax
    var reFax : String
    {
        set
        {
            self.fax=newValue
        }
        get{
            return self.fax!
        }
    }
    
    //email address
    var reEmailAddress :String
    {
        set
        {
            self.emailAddress = newValue
        }
        get
        {
            return self.emailAddress!
        }
    }
    
    //address city
    var reAddressCity : String
    {
        set
        {
            self.addressStreet = newValue
        }
        
        get
        {
            return self.addressStreet!
        }
    }
    //address street
    var reAddressStreet : String
    {
        set
        {
            self.addressStreet = newValue
        }
        
        get
        {
            return self.addressStreet!
        }
    }
    
    //address unit
    
    var reAddressUnit : String
    {
        set
        {
            self.addressUnit = newValue
        }
        
        get
        {
            return self.addressUnit!
        }
    }
    
    //zip code
    var reZipCode : String
    {
        set
        {
            self.zipcode = newValue
        }
        get
        {
            return self.zipcode!
        }
    }
    
    // web site
    var reWebSite : String
    {
        set
        {
            self.website = newValue
        }
        
        get
        {
            return self.website!
        }
    }
}
