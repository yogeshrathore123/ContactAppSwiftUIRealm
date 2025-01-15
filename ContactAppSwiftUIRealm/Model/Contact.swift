//
//  Contact.swift
//  ContactAppSwiftUIRealm
//
//  Created by Yogesh Rathore on 14/01/25.
//

import RealmSwift

class Contact: Object {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var firstName: String
    @Persisted var lastName: String
    
    convenience init(firstName: String, lastName: String) {
        self.init()
        self.firstName = firstName
        self.lastName = lastName
    }
    
    static var tempData: [Contact] = [
            ]
}
