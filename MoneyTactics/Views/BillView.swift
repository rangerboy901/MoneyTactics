//
//  BillView.swift
//  MoneyTactics
//
//  Created by Joseph DeWeese on 4/2/22.
//

import SwiftUI

struct BillView: View {
    
        @Environment(\.managedObjectContext) private var viewContext

        @FetchRequest(
            sortDescriptors: [NSSortDescriptor(keyPath: \Bill.startDate, ascending: true)],
            animation: .default)
        private var bills: FetchedResults<Bill>

        var body: some View {
            NavigationView {
                List {
                    ForEach(bills) { bill in
                        BillCellView(name: bill.name ?? "Unknown", amount:
                        bill.totalAmount, date: bill.dueDate ?? Date())
                           
                    }
                    .onDelete(perform: deleteItems)

                        
                        
                }
                .listStyle(PlainListStyle())
                .navigationTitle("All Bills")
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        EditButton()
                        Spacer()
                    }
                   
                    ToolbarItem {
                        Button(action: addItem) {
                            Label("Add Item", systemImage: "plus")
                                .font(.title)
                        }
                    }
                }
                Text("Select an item")
            }
            .accentColor(Color(.label))
        }

        private func addItem() {
            withAnimation {
                let newBill = Bill(context: viewContext)
                newBill.name = "Fuel"
                newBill.totalAmount = 120.00
                newBill.startDate = Date()
                newBill.dueDate = Date()

                do {
                    try viewContext.save()
                } catch {
                   
                    print("Could not save data. \(error.localizedDescription)")
                }
            }
        }

        private func deleteItems(offsets: IndexSet) {
            withAnimation {
                offsets.map { bills[$0] }.forEach(viewContext.delete)

                do {
                    try viewContext.save()
                } catch {
                    // Replace this implementation with code to handle the error appropriately.
                    // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                    let nsError = error as NSError
                    fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
                }
            }
        }
    }

    private let itemFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .medium
        return formatter
    }()


struct BillView_Previews: PreviewProvider {
    static var previews: some View {
        BillView()
    }
}
