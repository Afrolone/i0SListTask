//
//  NotesRepositoryProtocol.swift
//  iOSListTask
//
//  Created by Jahja Muratovic on 29. 1. 2024..
//

import Foundation
import Combine

protocol NotesRepositoryProtocol {
    func fetchNotes() -> AnyPublisher<[NoteItem], Error>
    func delete(note: NoteItem) -> AnyPublisher<NoteItem, Error>
    func add(note: NoteItem) -> AnyPublisher<NoteItem, Error>
    func update(note: NoteItem) -> AnyPublisher<NoteItem, Error>
}
