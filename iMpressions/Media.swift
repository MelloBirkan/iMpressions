//
//  Book.swift
//  iMpressions
//
//  Created by Marcello Gonzatto Birkan on 06/03/24.
//

import SwiftUI
import SwiftData

@Model
class Media {
  var title: String
  var author: String?
  var studio: String?
  var dateAdded: Date
  var dateStarted: Date
  var dateCompleted: Date
  var summary: String
  var rating: Int?
  var status: Status
  
  init( // ctrl + M formata assim
    title: String,
    author: String? = nil,
    studio: String? = nil,
    dateAdded: Date = Date.now,
    dateStarted: Date = Date.distantPast,
    dateCompleted: Date = Date.distantFuture,
    summary: String = "",
    rating: Int? = nil,
    status: Status = .onShelf
  ) {
    self.title = title
    self.author = author
    self.studio = studio
    self.dateAdded = dateAdded
    self.dateStarted = dateStarted
    self.dateCompleted = dateCompleted
    self.summary = summary
    self.rating = rating
    self.status = status
  }
  
  var icon: Image {
    switch status {
    case .onShelf:
      Image(systemName: "checkmark.diamond.fill")
    case .inProgress:
      Image(systemName: "book.fill")
    case .completed:
      Image(systemName: "books.vertical.fill")
    }
  }
}

enum TypeMedia: Codable, Identifiable, CaseIterable {
  case game, book, movie
  var id: Self {
    self
  }
}

enum Status: Int, Codable, Identifiable, CaseIterable {
  case onShelf, inProgress, completed
  var id: Self {
    self
  }
  var descr: String {
    switch self {
    case .onShelf:
      "On Shelf"
    case .inProgress:
      "In Progress"
    case .completed:
      "Completed"
    }
  }
}
