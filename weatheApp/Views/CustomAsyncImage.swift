import SwiftUI

struct CustomAsyncImage: View {
    let url: String
    @State private var image: UIImage?
    @State private var isLoading = false

    var body: some View {
            if let img = image {
                Image(uiImage: img)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } else if isLoading {
                ProgressView()
            } else {
                Color.clear.onAppear(perform: load)
            }
        
    }

    private func load() {
        guard let url = URL(string: url) else { return }
        isLoading = true

        URLSession.shared.dataTask(with: url) { data, _, _ in
            if let data = data, let uiImg = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.image = uiImg
                }
            }
            DispatchQueue.main.async {
                self.isLoading = false
            }
        }.resume()
    }
}
