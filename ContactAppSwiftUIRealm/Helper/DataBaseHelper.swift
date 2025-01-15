//
//  DataBaseHelper.swift
//  ContactAppSwiftUIRealm
//
//  Created by Yogesh Rathore on 15/01/25.
//

import RealmSwift

class DataBaseHelper {
 
    static let shared = DataBaseHelper()
    private var realm = try! Realm()
    
    private init() {
        print("Realm Database Initialized URL = \(String(describing: databaseURL()))")
    }
    
    func databaseURL() -> URL? {
        return realm.configuration.fileURL
    }
    
    
    func addContact(contact: Contact) {
        try! realm.write {
            realm.add(contact)
        }
    }
    
    func updateContact(oldContact: Contact, newContact: Contact) {
        try! realm.write {
            oldContact.firstName = newContact.firstName
            oldContact.lastName = newContact.lastName
        }
    }
    
    func deleteContact(contact: Contact) {
        try! realm.write {
            realm.delete(contact)
        }
    }
    
    func getAllContacts() -> [Contact] {
        return Array(realm.objects(Contact.self))
    }
}
