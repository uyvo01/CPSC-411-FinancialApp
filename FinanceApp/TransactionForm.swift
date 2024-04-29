//
//  FinanceAppApp.swift
//  FinanceApp
//
//  Created by GroupHappy on 04/13/2024.
//

import SwiftUI

struct AddIncome: View {
    @SceneStorage("incomeName") var incomeName: String = ""
    @SceneStorage("incomeAmount") var incomeAmount: String = ""
    @SceneStorage("incomeDate") var incomeDate: String = ""
    @SceneStorage("incomeType") var incomeType: String = "income"
    @State var message: String = ""
    
    @EnvironmentObject var transaction: TransactionManager
    var body: some View {
        // TODO: (Model 3) Surround the entire VStack with a NavigationView
        NavigationView {
            /* Enclosed root VStack */

            /* Model 3 start of code block */
            VStack {
                Text("Add New Income")
                    .font(.headline)
                    .modifier(TitleText())
                VStack {
                    HStack {
                        Text("Name:")
                            .modifier(TextLabel())
                        TextField("Name", text: $incomeName)
                            .modifier(TextBox())
                        Spacer()
                    }
                    HStack {
                        Text("Amount:")
                            .modifier(TextLabel())
                        TextField("Amount", text:$incomeAmount)
                            .modifier(TextBox())
                        Spacer()
                    }
                    HStack {
                        Text("Date:")
                            .modifier(TextLabel())
                        TextField("Date", text:$incomeDate)
                            .modifier(TextBox())
                        Spacer()
                    }
                }
                .modifier(RoundedBackground())
                .padding(.bottom, 30)
            
                // Insert Add Income button code below
                HStack {
                    
                    Button(action: {
                        if let validAmount = Double(incomeAmount) {
                            transaction.incomes.append(Transac(name: incomeName, amount: validAmount, type: incomeType, date:incomeDate))
                            message = " New income added!"
                        } else {
                            message = " does not have a valid amount!"
                        }
                        
                    }) {
                        Text("Submit")
                            .bold()
                            .modifier(ButtonDesign())
                    }
                   
                    Spacer()
                    
                }
                .padding(.bottom, 30)
                Report(message: $message)
            }
        }
        /* Model 3 end of code block */
    }
}
struct AddExpense: View {
    @SceneStorage("expenseName") var expenseName: String = ""
    @SceneStorage("expenseAmount") var expenseAmount: String = ""
    @SceneStorage("expenseDate") var expenseDate: String = ""
    @SceneStorage("expenseType") var expenseType: String = "expense"
    @State var message: String = ""
    
    @EnvironmentObject var transaction: TransactionManager
    var body: some View {
        // TODO: Surround the entire VStack with a NavigationView
        NavigationView {
            /* Enclosed root VStack */

            /* Model 3 start of code block */
            VStack {
                Text("Add Expense")
                    .font(.headline)
                    .modifier(TitleText())
                VStack {
                    HStack {
                        Text("Name:")
                            .modifier(TextLabel())
                        TextField("Name", text: $expenseName)
                            .modifier(TextBox())
                        Spacer()
                    }
                    HStack {
                        Text("Amount:")
                            .modifier(TextLabel())
                        TextField("Amount", text:$expenseAmount)
                            .modifier(TextBox())
                        Spacer()
                    }
                    HStack {
                        Text("Date:")
                            .modifier(TextLabel())
                        TextField("Date", text:$expenseDate)
                            .modifier(TextBox())
                        Spacer()
                    }
                }
                .modifier(RoundedBackground())
                .padding(.bottom, 30)
            
                // Insert Add Income button code below
                HStack {
                    
                    Button(action: {
                        if let validAmount = Double(expenseAmount) {
                            transaction.expenses.append(Transac(name: expenseName, amount: validAmount, type: expenseType, date:expenseDate))
                            message = " New expense added!"
                        } else {
                            message = " does not have a valid amount!"
                        }
                        
                    }) {
                        Text("Submit")
                            .bold()
                            .modifier(ButtonDesign())
                    }
                   
                    Spacer()
                    
                }
                .padding(.bottom, 30)
                Report(message: $message)
            }
        }
        /* Model 3 end of code block */
    }
}
// TODO: Copy Report structure here
struct Report: View {
    @Binding var message: String
    
    var body: some View {
        VStack {
            HStack {
                // We can use an if statement to control what
                // View to display
                if !message.isEmpty {
                    Text(message)
                }
            }
        }
    }
}
