//
//  NewBookView.swift
//  iMpressions
//
//  Created by Marcello Gonzatto Birkan on 06/03/24.
//

import SwiftUI

struct NewBookView: View {
  @Environment(\.modelContext) private var context
  @Environment(\.dismiss) var dismiss
  @State private var title = ""
  @State private var author = ""
  @State private var studio = ""
  
    var body: some View {
      NavigationStack {
        Form {
          TextField("Media Title", text: $title)
          TextField("Author", text: $author)
          TextField("Studio", text: $studio)
          Button("Create") {
            let newBook = Book(title: title, author: author.isEmpty ? nil : author, studio: studio.isEmpty ? nil : studio)
            context.insert(newBook)
            dismiss()
          }
          .frame(maxWidth: .infinity, alignment: .trailing)
          .buttonStyle(.borderedProminent)
          .padding(.vertical)
          .disabled(title.isEmpty || (author.isEmpty && studio.isEmpty))
          .navigationTitle("New Media")
          .navigationBarTitleDisplayMode(.inline)
        }
      }
    }
}

#Preview {
    NewBookView()
}
