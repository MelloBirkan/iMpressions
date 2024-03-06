//
//  ContentView.swift
//  iMpressions
//
//  Created by Marcello Gonzatto Birkan on 06/03/24.
//

import SwiftUI

struct BookListView: View {
  @State private var createNewMedia = false
    var body: some View {
      NavigationStack {
        VStack {
              Image(systemName: "globe")
                  .imageScale(.large)
                  .foregroundStyle(.tint)
              Text("Hello, world!")
          }
        .padding()
        .navigationTitle("My Medias")
        .toolbar {
          Button {
            
          } label: {
            Image(systemName: "plus.circle.fill")
              .imageScale(.large)
          }
        }
      }
    }
}

#Preview {
    BookListView()
}
