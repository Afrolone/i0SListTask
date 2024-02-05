//
//  NotesRepository.swift
//  iOSListTask
//
//  Created by Jahja Muratovic on 29. 1. 2024..
//

import Foundation
import Combine

final class NotesRepository: NotesRepositoryProtocol {
    func fetchNotes() -> AnyPublisher<[NoteItem], Error> {
        // -TODO: FUNC
        return Just([NoteItem(title: "sfddsf", note: "sdf", shoppingItems: [])])
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
    
    func delete(note: NoteItem) -> AnyPublisher<NoteItem, Error> {
        return Just(NoteItem(title: "sfddsf", note: "sdf", shoppingItems: []))
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
    
    func add(note: NoteItem) -> AnyPublisher<NoteItem, Error> {
        return Just(NoteItem(title: "sfddsf", note: "sdf", shoppingItems: []))
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
    
    func update(note: NoteItem) -> AnyPublisher<NoteItem, Error> {
        return Just(NoteItem(title: "sfddsf", note: "sdf", shoppingItems: []))
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}
