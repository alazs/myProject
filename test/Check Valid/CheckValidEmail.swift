//
//  CheckValidEmail.swift
//  test
//
//  Created by Hackeru_Student on 7/18/18.
//  Copyright © 2018 Hackeru_Student. All rights reserved.
//

import Foundation

class CheckValidEmail {
    
    func isValidEmail(email : String) ->Bool
    {
        // "OC"= means ordinary character: so, a letter or a digit.
        // __firstpart ... has to start and end with an OC. For the characters in the middle you can have a few unusual characters such as underscore, but the start and end have to be OC. (It's ok to have only one OC an that's it
        let __firstpart = "[A-Z0-9a-z]([A-Z0-9a-z._%+-]{0,30}[A-Z0-9a-z])?"
        
        //__serverpart ... You have sections like "blah." which repeat. (So, mail.city.fcu.edu type of thing.) The sections have to start and end with an OC, but in the middle you can also have dash "-". (If you want to allow other unusual characters in there, say underscore, just add it before the dash
        
        let __serverpart = "([A-Z0-9a-z]([A-Z0-9a-z-]{0,30}[A-Z0-9a-z])?\\.){1,5}"
        
        let __emailRegex = __firstpart + "@" + __serverpart + "[A-Za-z]{2,6}"
        
        let __emailPredicate = NSPredicate(format: "SELF MATCHES %@", __emailRegex)
        
        return __emailPredicate.evaluate(with: email)
        
    }
    
}


