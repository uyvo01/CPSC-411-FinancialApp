//
//  ContentView.swift
//  FinanceApp
//
//  Created by GroupHappy on 04/13/2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject var transaction = TransactionManager()
    //@EnvironmentObject var transaction : TransactionManager
    
    var body: some View {

        NavigationStack {
            ZStack {
                TabView {
                    if #available(iOS 17.0, *) {
                        Dashboard()
                            .tabItem {
                                Image(systemName: "house")
                            }
                    } else {
                        // Fallback on earlier versions
                        Text("This feature is available on iOS 17.0")
                    }
                    IncomeDetail()
                        .tabItem {
                            Image(systemName: "plus")
                        }
                    ExpensesDetail()
                        .tabItem {
                            Image(systemName: "minus")
                        }
                    Text("Settings")
                        .tabItem {
                            Image(systemName: "gearshape")
                        }
                }
                .padding(.horizontal)
                .accentColor(.black)
            }
            /*
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("My Finance")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.bottom,0)
                }
                                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Image(systemName: "ellipsis")
                        .font(.system(size: 20))
                        .rotationEffect(.degrees(-90))
                        .padding(.bottom,10)
                }
            }
             */
        }
        .environmentObject(transaction)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
