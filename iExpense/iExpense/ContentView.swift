//
//  ContentView.swift
//  iExpense
//
//  Created by Igor Manakov on 15.03.2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var expenses = Expenses()
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    ForEach(expenses.items.filter {$0.type == "Personal"}) { item in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(item.name)
                                    .font(.headline)
                                
                                Text(item.type)
                            }
                            
                            Spacer()
                            
                            let code = Locale.current.currencyCode ?? "USD"
                            Text(item.amount, format: .currency(code: code))
                                .foregroundColor((item.amount >= 1000) ? .green : .red)
                        }
                    }
                    .onDelete(perform: removeItems)
                } header: {
                    Text("Personal expenses")
                }
                
                Section {
                    ForEach(expenses.items.filter {$0.type == "Business"}) { item in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(item.name)
                                    .font(.headline)
                                
                                Text(item.type)
                            }
                            
                            Spacer()
                            
                            let code = Locale.current.currencyCode ?? "USD"
                            Text(item.amount, format: .currency(code: code))
                                .foregroundColor((item.amount >= 1000) ? .green : .red)
                        }
                    }
                    .onDelete(perform: removeItems)
                } header: {
                    Text("Business expenses")
                }
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button {
                    showingAddExpense.toggle()
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddExpense, onDismiss: didDismiss) {
                AddView(expenses: expenses)
            }
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
    
    func didDismiss() {
        showingAddExpense = false
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
