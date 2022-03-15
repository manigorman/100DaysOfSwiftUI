//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Igor Manakov on 15.03.2022.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}
