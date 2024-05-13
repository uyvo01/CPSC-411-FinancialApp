//
//  CircularProgress.swift
//  FinanceApp
//
//  Created by GroupHappy on 04/13/2024.
//

import SwiftUI
import Charts

@available(iOS 17.0, *)
struct CircularProgressView: View {
    @EnvironmentObject var transaction: TransactionManager
    
    var body: some View {
        let totalincome = transaction.incomes.map{$0.amount}.reduce(0, +)
        let totalexpense = transaction.expenses.map{$0.amount}.reduce(0, +)
        let totals = [
            (name: "Income", val: totalincome),
            (name: "Expenses", val: totalexpense)
        ]
        VStack {
            Chart {
                ForEach(totals, id: \.name) {total in
                    
                    SectorMark(
                        angle: .value("Type", total.val),
                        innerRadius: .ratio(0.6),
                        angularInset: 2.0
                    )
                    .foregroundStyle(by: .value("Type",total.name))
                    /*.annotation(position: .overlay){
                        Text("\(total.val, specifier: "%.0f")")
                            .font(.system(size: 14))
                            .fontWeight(.bold)
                            .foregroundStyle(.white)
                    }*/
                }
            }
        }
    }
}
@available(iOS 17.0, *)
struct CircularIncomeDetail: View {
    @EnvironmentObject var transaction: TransactionManager
    
    var body: some View {
        
        let totalWage = transaction.incomes.filter({$0.category=="Wage"}).map{$0.amount}.reduce(0, +)
        let totalInvestment = transaction.incomes.filter({$0.category=="Investment"}).map{$0.amount}.reduce(0, +)
        let totalSale = transaction.incomes.filter({$0.category=="Sale"}).map{$0.amount}.reduce(0, +)
        let totalOthers = transaction.incomes.filter({$0.category=="Others"}).map{$0.amount}.reduce(0, +)
        let totals = [
            (name: "Wage", val: totalWage),
            (name: "Investment", val: totalInvestment),
            (name: "Sale", val: totalSale),
            (name: "Other", val: totalOthers)
        ]
        VStack {
            Chart {
                ForEach(totals, id: \.name) {total in
                    
                    SectorMark(
                        angle: .value("Type", total.val),
                        angularInset: 2.0
                    )
                    .foregroundStyle(by: .value("Type",total.name))
                    .annotation(position: .overlay){
                        Text("\(total.val, specifier: "%.0f")")
                            .font(.system(size: 10))
                            .fontWeight(.bold)
                            .foregroundStyle(.white)
                    }
                }
            }
        }
    }
}

@available(iOS 17.0, *)
struct CircularExpenseDetail: View {
    @EnvironmentObject var transaction: TransactionManager
    
    var body: some View {
        
        let totalRestaurant = transaction.expenses.filter({$0.category=="Restaurant"}).map{$0.amount}.reduce(0, +)
        let totalShopping = transaction.expenses.filter({$0.category=="Shopping"}).map{$0.amount}.reduce(0, +)
        let totalInsurance = transaction.expenses.filter({$0.category=="Insurance"}).map{$0.amount}.reduce(0, +)
        let totalTax = transaction.expenses.filter({$0.category=="Tax"}).map{$0.amount}.reduce(0, +)
        let totalOthers = transaction.expenses.filter({$0.category=="Others"}).map{$0.amount}.reduce(0, +)
        let totals = [
            (name: "Restaurant", val: totalRestaurant),
            (name: "Shopping", val: totalShopping),
            (name: "Insurance", val: totalInsurance),
            (name: "Tax", val: totalTax),
            (name: "Others", val: totalOthers)
        ]
        VStack {
            Chart {
                ForEach(totals, id: \.name) {total in
                    
                    SectorMark(
                        angle: .value("Type", total.val),
                        angularInset: 2.0
                    )
                    .foregroundStyle(by: .value("Type",total.name))
                    .annotation(position: .overlay){
                        Text("\(total.val, specifier: "%.0f")")
                            .font(.system(size: 10))
                            .fontWeight(.bold)
                            .foregroundStyle(.white)
                    }
                }
            }
        }
    }
}
