//
//  NotesUseCaseProtocol.swift
//  iOSListTask
//
//  Created by Jahja Muratovic on 29. 1. 2024..
//

import Foundation
import Combine

protocol NotesUseCaseProtocol {
    func fetchNotes() -> AnyPublisher<[NoteItem], Error>
    func delete(note: NoteItem) -> AnyPublisher<NoteItem, Error>
    func add(note: NoteItem) -> AnyPublisher<NoteItem, Error>
    func update(note: NoteItem) -> AnyPublisher<NoteItem, Error>
}
