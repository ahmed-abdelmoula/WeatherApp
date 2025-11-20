//
//  LoadingView.swift
//  weatheApp
//
//  Created by Ahmed Mac on 18/11/2025.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ProgressView().progressViewStyle(CircularProgressViewStyle(tint: .white)).frame(maxWidth: .infinity,maxHeight: .infinity)
    }
}

#Preview {
    LoadingView()
}
