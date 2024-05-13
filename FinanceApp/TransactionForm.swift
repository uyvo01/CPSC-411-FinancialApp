//
//  FinanceAppApp.swift
//  FinanceApp
//
//  Created by GroupHappy on 04/13/2024.
//

import SwiftUI

struct AddIncome: View {
    @State var incomeName: String = ""
    @State var incomeAmount: String = ""
    @State var incomeType: String = "income"
    @State var category : String = ""
    @State var categorys = ["Wage","Investment","Sale","Others"]
    
    @State var message: String = ""
    @State var transdate = Date()
    
    @EnvironmentObject var transaction: TransactionManager
    var body: some View {
       
        NavigationView {
            /* Enclosed root VStack */

            /* Model 3 start of code block */
            VStack {
                Text("Add New Income")
                    .font(.title2)
                    .fontWeight(.bold)
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
                        Text("Category: ")
                            .modifier(TextLabel())
                        Picker("Category", selection: $category) {
                            ForEach(categorys, id: \.self) {
                                Text($0).tag($0)
                             }
                        }
                        .modifier(TextBox())
                        Spacer()
                    }
                    HStack {
                        Text("Select date:")
                            .modifier(TextLabel())
                        DatePicker(
                            "",
                            selection: $transdate,
                            in: ...Date(),
                            displayedComponents: [.date]
                        )
                        .datePickerStyle(.automatic)
                        .modifier(TextBox())
                        Spacer()
                    }
                    
                }
                .modifier(RoundedBackground())
                
            
                // Insert Add Income button code below
                VStack (alignment: .center){
                    
                    Button(action: {
                        if let validAmount = Double(incomeAmount) {
                            transaction.incomes.append(Transaction(category: category, name: incomeName, amount: validAmount, type: incomeType,  date:transdate))
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
    @State var expenseName: String = ""
    @State var expenseAmount: String = ""
    @State var category: String = ""
    @State var expenseType: String = "expense"
    let categorys = ["Insuarance", "Tax","Restaurant", "Shopping", "Others"]
    
    @State var message: String = ""
    @State var transdate = Date()
    @EnvironmentObject var transaction: TransactionManager
    var body: some View {
       
        NavigationView {
            /* Enclosed root VStack */

            /* Model 3 start of code block */
            VStack {
                Text("Add New Expense")
                    .font(.title2)
                    .fontWeight(.bold)
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
                        Text("Category: ")
                            .modifier(TextLabel())
                        Picker("Category", selection: $category) {
                            ForEach(categorys, id: \.self) {
                                Text($0)
                            }
                        }
                        .modifier(TextBox())
                        Spacer()
                    }
                    HStack {
                        Text("Select date:")
                            .modifier(TextLabel())
                        DatePicker(
                            "",
                            selection: $transdate,
                            in: ...Date(),
                            displayedComponents: [.date]
                        )
                        .datePickerStyle(.automatic)
                        .modifier(TextBox())
                        Spacer()
                    }
                    
                }
                .modifier(RoundedBackground())
                
            
                // Insert Add Income button code below
                VStack (alignment: .center){
                    
                    Button(action: {
                        if let validAmount = Double(expenseAmount) {
                            transaction.expenses.append(Transaction(category: category, name: expenseName, amount: validAmount, type: expenseType, date:transdate))
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
