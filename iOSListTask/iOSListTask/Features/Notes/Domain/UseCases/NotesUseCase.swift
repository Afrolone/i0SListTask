//
//  NotesUseCase.swift
//  iOSListTask
//
//  Created by Jahja Muratovic on 29. 1. 2024..
//

import Foundation
import Combine

final class NotesUseCase: NotesUseCaseProtocol {
    private lazy var remoteRepository: NotesRepositoryProtocol = {
        NotesRepository()
    }()
    
    func fetchNotes() -> AnyPublisher<[NoteItem], Error> {
        return remoteRepository.fetchNotes()
    }
    
    func delete(note: NoteItem) -> AnyPublisher<NoteItem, Error> {
        return remoteRepository.delete(note: note)
    }
    
    func add(note: NoteItem) -> AnyPublisher<NoteItem, Error> {
        return remoteRepository.add(note: note)
    }
    
    func update(note: NoteItem) -> AnyPublisher<NoteItem, Error> {
        return remoteRepository.update(note: note)
    }
}

