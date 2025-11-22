//
//  InspectImageResponseView.swift
//  weatheApp
//
//  Created by Ahmed Mac on 22/11/2025.
//

import Foundation
import SwiftUI

struct InspectImageResponseView: View {
    @State private var info: String = "Tap to test"
    
    var body: some View {
        VStack(spacing: 16) {
            Text(info)
                .padding()
                .multilineTextAlignment(.leading)
            
            Button("Test URLSession fetch") {
                testFetch()
            }
        }
        .padding()
    }
    
    func testFetch() {
        info = "Loading..."
        let url = URL(string: "https://cdn.pixabay.com/photo/2020/01/24/21/33/city-4791269_960_720.png")!
        var req = URLRequest(url: url)
        // optional: try adding headers (see next snippet)
        req.setValue("image/*", forHTTPHeaderField: "Accept")
        
        URLSession.shared.dataTask(with: req) { data, response, error in
            DispatchQueue.main.async {
                if let e = error {
                    info = "Error: \(e.localizedDescription)"
                    return
                }
                guard let http = response as? HTTPURLResponse else {
                    info = "No HTTP response"
                    return
                }
                let status = http.statusCode
                let mime = http.allHeaderFields["Content-Type"] ?? "unknown"
                let len = data?.count ?? 0
                info = "Status: \(status)\nMIME: \(mime)\nData size: \(len) bytes\nHeaders:\n\(http.allHeaderFields)"
                
                // quick attempt to create an image so you know if data is valid
                if let d = data, UIImage(data: d) == nil {
                    info += "\n\n⚠️ Data received but UIImage(data:) is nil — image may be corrupted or in an unsupported format."
                }
            }
        }.resume()
    }
}
