struct ContentView: View {
    @StateObject var transactions = TransactionListViewModel()
    
    var body: some View {
        
        NavigationStack {
            ZStack {
                TabView {
                    Dashboard()
                        .tabItem {
                            Image(systemName: "house")
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
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("My Finance")
                        .font(.title2)
                        .fontWeight(.bold)
                }
                                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Image(systemName: "ellipsis")
                        .font(.system(size: 20))
                        .rotationEffect(.degrees(-90))
                }
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
