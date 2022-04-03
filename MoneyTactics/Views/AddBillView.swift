//
//  AddBillView.swift
//  MoneyTactics
//
//  Created by Joseph DeWeese on 4/3/22.
//

import SwiftUI


struct AddBillView: View {
    
   @StateObject var addBillVM = AddBillViewModel()
    
    var body: some View {
        
        VStack {
            HStack{
                
                Button {
                    
                }label: {
                    Text("Cancel")
                        .font(.title3)
                        .frame(width: 80, height: 30)
                }
                Spacer()
                
                Button {
                    
                }label: {
                    Text("Save")
                        .font(.title3)
                        .fontWeight(.bold)
                        .frame(width: 70, height: 30)
                }
            }
            .padding()
            
            Form {
                TextField("Name of Expense..", text: $addBillVM.name)
                TextField("Enter Total Weekly Amount...", text: $addBillVM.amount)
                DatePicker("Start Date...", selection: $addBillVM.startDate, displayedComponents: .date)
                DatePicker("Due Date...", selection: $addBillVM.dueDate, displayedComponents: .date)
            }
        }
    }
}

struct AddBillView_Previews: PreviewProvider {
    static var previews: some View {
        AddBillView()
    }
}
