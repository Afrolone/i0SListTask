//
//  NoteItem.swift
//  iOSListTask
//
//  Created by Jahja Muratovic on 27. 1. 2024..
//

import Foundation

struct NoteItem {
    let id: UUID = UUID()
    let title: String
    let note: String?
    let shoppingItems: [UUID]?
    let creationDate: Date = Date()
}
