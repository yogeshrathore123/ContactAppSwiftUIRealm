//
//  ContentView.swift
//  ContactAppSwiftUIRealm
//
//  Created by Yogesh Rathore on 13/01/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var contactArray: [Contact] = []
    
    var body: some View {
        
        
        
        NavigationView {
            
            List {
                ForEach(0..<contactArray.count, id: \.self) { index in
                    ContactCellView(contactData: contactArray[index])
                        .swipeActions {
                            Button {
                                DataBaseHelper.shared.deleteContact(contact: contactArray[index])
                                contactArray.remove(at: index)
                            } label: {
                                Text("Delete")
                            }
                            .tint(.red)
                        }
                        .swipeActions {
                            Button {
                                openAlert(isAdd: false, index: index)
                            } label: {
                                Text("Edit")
                            }
                            .tint(.green)

                        }

                }
            }
            .navigationTitle(Text("Contacts"))
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        openAlert(isAdd: true)
                    } label: {
                        Image(systemName: "plus")
                    }
                    
                }
            }
            .onAppear {
                contactArray = DataBaseHelper.shared.getAllContacts()
            }
        }
    }
}

//MARK: Helper Merthod Open Alert
extension ContentView {
    
    func openAlert(isAdd: Bool, index: Int = 0) {
        
        let alertController = UIAlertController(title: isAdd ? "Add Contact" : "Edit Contact", message: isAdd ? "Enter your details" : "Edit your details", preferredStyle: .alert)
        
        alertController.addTextField { firstNameTextField in
            firstNameTextField.placeholder = isAdd ? "Enter your first name" : contactArray[index].firstName
        }
        
        alertController.addTextField { lastNameTextField in
            lastNameTextField.placeholder = isAdd ? "Enter your last name" : contactArray[index].lastName
        }
        
        let save = UIAlertAction(title: isAdd ? "Save" : "Update", style: .default) { _ in
            
            if let firstName = alertController.textFields?.first?.text,
               let lastName = alertController.textFields?.last?.text {
                
                let contact = Contact(firstName: firstName, lastName: lastName)
                if isAdd {
                    DataBaseHelper.shared.addContact(contact: contact) // Add in Realm
                    contactArray.append(contact)
                } else {
                    DataBaseHelper.shared.updateContact(oldContact: contactArray[index], newContact: contact) // Edit in Realm
                    contactArray[index] = contact
                }
            }
        }
        
        alertController.addAction(save)
        
        UIApplication.shared.keyWindow?.rootViewController?.present(alertController, animated: true)
    }
    
}

#Preview {
    ContentView()
}
