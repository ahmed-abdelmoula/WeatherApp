import SwiftUI

// SwiftUI mockup replicating the provided design with detailed custom colors.
// The illustration image is loaded from the uploaded file path:
// /mnt/data/bbc4a712-768b-4b87-9a7d-5cff014211e3.png
// The file path above should be transformed to a URL by the environment where this runs.

struct LoginMockupView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var rememberMe: Bool = false

    var body: some View {
        GeometryReader { geo in
            HStack(spacing: 0) {
                // Left artwork panel
                ZStack {
                    Color("#FFD22E")
                    VStack {
                        // Title in Arabic at top-left of the left panel
                        HStack {
                            VStack(alignment: .trailing, spacing: 6) {
                                Text("لوحة التحكم")
                                    .font(.system(size: 34, weight: .bold))
                                Text("نظام إدارة المحتوى المصطور والآمن، قم بإدارة بياناتك بكل سهولة ومرونة")
                                    .font(.system(size: 14))
                                    .frame(maxWidth: 260, alignment: .trailing)
                            }
                        }
                        .padding(.top, 36)
                        .padding(.trailing, 24)

                        Spacer()

                        // Illustration image
                        IllustrationView(imagePath: "/mnt/data/bbc4a712-768b-4b87-9a7d-5cff014211e3.png")
                            .frame(width: geo.size.width * 0.45, height: geo.size.height * 0.85)
                            .clipped()
                            .padding(.bottom, 16)
                    }
                }
                .frame(width: geo.size.width * 0.55)

                // Right form panel
                ZStack {
                    Color(UIColor.systemBackground)
                    VStack(spacing: 20) {
                        HStack {
                            Spacer()
                            Image(systemName: "touchid")
                                .resizable()
                                .frame(width: 34, height: 34)
                                .padding(.top, 18)
                                .padding(.trailing, 18)
                        }

                        VStack(alignment: .trailing, spacing: 12) {
                            Text("مرحباً بعودتك!")
                                .font(.system(size: 28, weight: .bold))

                            Text("يرجى إدخال بياناتك للدخول للوحة التحكم")
                                .font(.system(size: 14))
                                .foregroundColor(.gray)
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.horizontal, 28)

                        VStack(spacing: 14) {
                            // Username field
                            VStack(alignment: .trailing, spacing: 6) {
                                Text("اسم المستخدم")
                                    .frame(maxWidth: .infinity, alignment: .trailing)
                                TextField("ادخل اسم المستخدم", text: $username)
                                    .padding()
                                    .background(Color(hex: "#F5F5F5"))
                                    .cornerRadius(8)
                                    .multilineTextAlignment(.trailing)
                            }

                            // Password field
                            VStack(alignment: .trailing, spacing: 6) {
                                Text("كلمة المرور")
                                    .frame(maxWidth: .infinity, alignment: .trailing)
                                SecureField("", text: $password)
                                    .padding()
                                    .background(Color(hex: "#F5F5F5"))
                                    .cornerRadius(8)
                                    .multilineTextAlignment(.trailing)
                            }

                            HStack {
                                Toggle(isOn: $rememberMe) {
                                    Text("تذكرني")
                                }
                                .labelsHidden()

                                Spacer()

                                Button(action: { /* forgot password action */ }) {
                                    Text("نسيت كلمة المرور؟")
                                }
                            }
                            .padding(.horizontal, 4)
                        }
                        .padding(.horizontal, 28)

                        Spacer()

                        Button(action: {
                            // Perform login
                        }) {
                            HStack {
                                Image(systemName: "arrow.left")
                                Text("تسجيل الدخول")
                                    .fontWeight(.semibold)
                            }
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color(hex: "#FFD22E"))
                            .foregroundColor(.black)
                            .cornerRadius(10)
                            .padding(.horizontal, 28)
                        }

                        Button(action: {
                            // navigate to main page
                        }) {
                            Text("العودة للصفحة الرئيسية")
                                .foregroundColor(.gray)
                        }

                        Spacer()
                    }
                }
                .frame(width: geo.size.width * 0.45)
            }
            .edgesIgnoringSafeArea(.all)
            .environment(\.
                layoutDirection, .rightToLeft) // force RTL for the preview
        }
    }
}

struct IllustrationView: View {
    let imagePath: String

    var body: some View {
        // Try to load image from disk path provided by the uploaded file
        if let uiImage = UIImage(contentsOfFile: imagePath) {
            Image(uiImage: uiImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .shadow(radius: 6)
                .padding(20)
        } else {
            // Fallback if image not found
            Rectangle()
                .fill(Color(white: 0.95))
                .overlay(Text("Image not found") )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginMockupView()
            .previewInterfaceOrientation(.landscapeLeft)
            .previewDevice("iPad Pro (12.9-inch) (6th generation)")
    }
}
