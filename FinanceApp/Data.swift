//
//  Data.swift
//  FinanceApp
//
//  Created by GroupHappy on 04/13/2024.
//

import Foundation
//import Combine

let filters: [String] = ["1 Year", "6 Months", "Last Month", "This Week"]

class TransactionManager: ObservableObject {
    @Published var incomes: [Transac] = []
    @Published var expenses: [Transac] = []
    
    init() {
        // Add initial transactions
        incomes.append(Transac(name: "Salary", amount: 13500.0, type: "Income" , date: "Mar 31, 2024"))
        incomes.append(Transac(name: "Investment", amount: 1250.00, type: "Income" , date: "Apr 1, 2024"))
        incomes.append(Transac(name: "Sale", amount: 550.00, type: "Income" , date: "Apr 5, 2024"))
        
        expenses.append(Transac(name: "Insurance", amount: 1033.80,type: "expense", date: "Apr 20, 2024"))
        expenses.append(Transac(name: "Tax", amount: 2250.00, type: "expense", date: "Apr 10, 2024"))
        expenses.append(Transac(name: "Shopping", amount: 550.00, type: "expense", date: "Apr 1, 2024"))
    }
}
struct Transac: Identifiable, Codable {
    var id = UUID()
    var name: String
    var amount: Double
    var type: String
    var date: String
}
    /*
     let Income:[Transaction] = [
     Transaction(name: "Salary", amount: 12500.80, serialNumber: "101", colorPrimary: "OrangePrimary", colorSecondary: "OrangeSecondary", type: "Income"),
     Transaction(name: "Investment", amount: 1250.00, serialNumber: "102", colorPrimary: "BluePrimary", colorSecondary: "BlueSecondary", type: "Income"),
     ]
     
     let Expenses:[Templete] = [
     Templete(name: "Insurance", amount: 150.80, serialNumber: "401", colorPrimary: "OrangePrimary", colorSecondary: "OrangeSecondary", type: "expense"),
     Templete(name: "Tax", amount: 1250.00, serialNumber: "402", colorPrimary: "BluePrimary", colorSecondary: "BlueSecondary", type: "expense"),
     ]
     
     let Templetes:[Templete] = [
     Templete(name: "Salary", amount: 12500.80, serialNumber: "101", colorPrimary: "OrangePrimary", colorSecondary: "OrangeSecondary", type: "Income"),
     Templete(name: "Investment", amount: 1250.00, serialNumber: "102", colorPrimary: "BluePrimary", colorSecondary: "BlueSecondary", type: "Income"),
     Templete(name: "Insurance", amount: 150.80, serialNumber: "401", colorPrimary: "OrangePrimary", colorSecondary: "OrangeSecondary", type: "expense"),
     Templete(name: "Tax", amount: 1250.00, serialNumber: "402", colorPrimary: "BluePrimary", colorSecondary: "BlueSecondary", type: "expense"),
     ]
     */
    let templetes:[Transaction] = [
        Transaction(id: "101", name: "Salary", amount: 12500.0, type: "Income" , date: "Mar 31, 2024"),
        Transaction(id: "102", name: "Investment", amount: 1250.00, type: "Income" , date: "Apr 1, 2024"),
        Transaction(id: "103", name: "Sale", amount: 550.00, type: "Income" , date: "Apr 5, 2024"),
    ]
    
    let B:[Transaction] = [
        Transaction(id: "401", name: "Insurance", amount: 15033.80,type: "expense", date: "Apr 20, 2024"),
        Transaction(id: "402", name: "Tax", amount: 1250.00, type: "expense", date: "Apr 10, 2024"),
        Transaction(id: "403", name: "Shopping", amount: 1250.00, type: "expense", date: "Apr 1, 2024"),
    ]

/*
final class TransactionListViewModel: ObservableObject{
    @Published var transactions: [Transaction] = []
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        getTransactions()
    }
    
    func getTransactions(){
        let urldata = "https://uyvo01.github.io/CPSC-411-FinancialApp/FinanceApp/Data/transactions.json"
        
        guard let url = URL(string: urldata) else {
            print("Invalid URL")
            return
        }
        URLSession.shared.dataTaskPublisher(for: url)
            .tryMap {(data, response) -> Data in
                guard let httpResponse = response as?HTTPURLResponse, httpResponse.statusCode == 200 else {
                    dump(response)
                    throw URLError(.badServerResponse)
                }
                return data
            }
            .decode(type: [Transaction].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink {
                completion in
                switch completion {
                case .failure(let error):
                    print("Error feching transactions:", error.localizedDescription)
                case .finished:
                    print("Finished fetching transactions")
                }
            }receiveValue: { [weak self] result in
                self?.transactions = result
                dump(self?.transactions)
            }
            .store(in: &cancellables)
    }
}
struct Templete {
    let id: String
    let name: String
    let amount: Double
    let type: String
}
*/
struct Transaction: Identifiable, Codable {
    let id: String
    let name: String
    let amount: Double
    let type: String
    let date: String
}

class Trans: ObservableObject{
    @Published var name: String
    @Published var amount: Double
    @Published var type: String
    @Published var date: String
    
    init(name: String, amount: Double, type: String, date: String) {
        self.name = name
        self.amount = amount
        self.type = type
        self.date = date
        
    }
}
