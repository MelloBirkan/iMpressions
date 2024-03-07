//
//  ContentView.swift
//  iMpressions
//
//  Created by Marcello Gonzatto Birkan on 06/03/24.
//

import SwiftUI
import SwiftData

struct MediaListView: View {
  @Query(sort: \Media.title) private var medias: [Media]
  @State private var createNewMedia = false
    var body: some View {
      NavigationStack {
        List {
          ForEach(medias) {media in
            NavigationLink {
              Text(media.title)
            } label: {
              HStack(spacing: 10, content: {
                media.icon
                
                VStack(alignment: .leading, content: {
                  Text(media.title)
                    .font(.title2)
                  
                  if let author = media.author {
                    Text(author)
                  }

                  if let studio = media.studio {
                    Text(studio)
                  }
                  
                  if let rating = media.rating {
                    HStack {
                      ForEach(0..<rating, id: \.self) { _ in
                        Image(systemName: "star.fill")
                          .imageScale(.small)
                          .foregroundStyle(.yellow)
                      }
                    }
                  }
                })
              })
            }

          }
        }
        .listStyle(.plain)
        .navigationTitle("My Medias")
        .toolbar {
          
          Button {
            createNewMedia = true
          } label: {
            Image(systemName: "plus.circle.fill")
              .imageScale(.large)
            
          }
        }
        .sheet(isPresented: $createNewMedia) {
            NewMediaView()
            .presentationDetents([.medium])
        }
      }
    }
}

#Preview {
    MediaListView()
    .modelContainer(for: Media.self, inMemory: true)
}
