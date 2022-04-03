//
//  BillCellView.swift
//  MoneyTactics
//
//  Created by Joseph DeWeese on 4/2/22.
//

import SwiftUI

struct BillCellView: View {
    
    var name: String
    let amount: Double
    let date: Date
    
    
    var body: some View {
        
        HStack {
            VStack(alignment: .leading, spacing: 5) {
                Text(name)
                    .font(.title2)
                    .fontWeight(.bold)
                Text(amount.toCurrency)
                    .font(.subheadline)
                    .fontWeight(.semibold)
            }
            .padding()
            Spacer()
            Text(date.longDate)
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundColor(.blue)
                .padding()
        }
    }
}

struct BillCellView_Previews: PreviewProvider {
    static var previews: some View {
        BillCellView(name: "Fuel", amount: 120.00, date: Date())
    }
}
