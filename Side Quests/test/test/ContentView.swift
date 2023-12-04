//
//  ContentView.swift
//  APIResquest
//
//  Created by Nicolas Florencio Felipe on 30/11/23.
//

import SwiftUI

struct ContentView: View {
    @State private var userName = ""
    @State private var user: GitHubUser?
    
    var body: some View {
        VStack () {
            
            Form {
                Section ("Enter your username here:") {
                    TextField("", text: $userName)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                        .onChange(of: userName) {
                            Task {
                                do {
                                   user = try await getUser(login: userName)
                                } catch GitHubError.invalidData {
                                    print("invalid Data")
                                } catch GitHubError.invalidResponse {
                                    print("invalid Response")
                                } catch GitHubError.invalidURL {
                                    print("invalid URL")
                                } catch {
                                    print("unexpected error")
                                }
                            }
                        }
                        
                }
            }
            .frame(height: 100)
            
                Section {
                    AsyncImage(url: URL(string: user?.avatarUrl ?? "")) { Image in
                        Image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .clipShape(.circle)
                    } placeholder: {
                        Circle()
                            .foregroundStyle(.secondary)
                    }
                    .frame(width: 120, height: 120)
                    
                    Text(user?.name ?? "Name Placeholder")
                    
                    Text(user?.login ?? "Login Placeholder")
                        .bold()
                        .font(.title3)
                }
            
            Spacer()
                
        }
        
    }
    
    func getUser(login: String) async throws -> GitHubUser {
        
        let path = URL(string: "https://api.github.com/users/\(login)")
       
        
        guard let url = path else {
            throw GitHubError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw GitHubError.invalidResponse
        }
        
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return try decoder.decode(GitHubUser.self, from: data)
        } catch {
            throw GitHubError.invalidData
        }
    }
}

#Preview {
    ContentView()
}

struct GitHubUser: Codable {
    let login: String
    let avatarUrl: String
    let name: String
}

enum GitHubError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
}
