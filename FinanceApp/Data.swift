//
//  Data.swift
//  FinanceApp
//
//  Created by GroupHappy on 04/13/2024.
//

import Foundation

class TransactionManager: ObservableObject {
    @Published var incomes: [Transaction] = []
    @Published var expenses: [Transaction] = []
    
    init() {
        // Add initial transactions
        incomes.append(Transaction(category: "Wage", name: "Salary", amount: 5000.0, type: "Income" , date: Date().addingTimeInterval(-4*24*3600)))
        incomes.append(Transaction(category: "Investment", name: "Stock", amount: 1250.00, type: "Income" , date: Date().addingTimeInterval(-5*24*3600)))
        incomes.append(Transaction(category: "Sale", name: "car", amount: 550.00, type: "Income" , date: Date().addingTimeInterval(-6*24*3600)))

        
        expenses.append(Transaction(category: "Insurance", name: "car", amount: 1033.80,type: "expense", date: Date().addingTimeInterval(-4*24*3600)))
        expenses.append(Transaction(category: "Tax", name: "Tax", amount: 2250.00, type: "expense", date: Date().addingTimeInterval(-5*24*3600)))
        expenses.append(Transaction(category: "Shopping", name: "South Coast", amount: 550.00, type: "expense", date: Date().addingTimeInterval(-6*24*3600)))
    }
}
struct Transaction: Identifiable, Codable {
    var id = UUID()
    var category: String
    var name: String
    var amount: Double
    var type: String
    var date: Date    
}
