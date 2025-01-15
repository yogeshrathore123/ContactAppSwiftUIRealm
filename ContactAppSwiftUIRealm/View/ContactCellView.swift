//
//  ContactCellView.swift
//  ContactAppSwiftUIRealm
//
//  Created by Yogesh Rathore on 14/01/25.
//

import SwiftUI

struct ContactCellView: View {
    
    var contactData: Contact
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 5.0) {
            Text(contactData.firstName)
                .font(.headline)
            Text(contactData.lastName)
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
    }
}

#Preview {
    //ContactCellView(contactData: Contact.init(firstName: "Yogesh", lastName: "Rathore"))
    ContactCellView(contactData: Contact.tempData.first!)
}
