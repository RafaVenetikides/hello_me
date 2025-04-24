import SwiftUI
import SwiftData

@main
struct MyApp: App {
    
    init() {
        registerFont(filename: "Unna-Regular.ttf")
        registerFont(filename: "Unna-Bold.ttf")
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
                .preferredColorScheme(.light)
        }
        .modelContainer(for: MemeModel.self)
    }
    
    func registerFont(filename: String, bundle: Bundle = .main) {
            guard
                let url = bundle.url(forResource: filename, withExtension: nil),
                let dataProvider = CGDataProvider(url: url as CFURL),
                let cgFont = CGFont(dataProvider)
            else { return }
            
            CTFontManagerRegisterGraphicsFont(cgFont, nil)
        }
}

extension Font {
    static func unnaRegular(_ size: CGFloat, relativeTo style: TextStyle = .body) -> Font {
        Font.custom("Unna-Regular", size: size, relativeTo: style)
    }
    
    static func unnaBold(_ size: CGFloat, relativeTo style: TextStyle = .body) -> Font {
            Font.custom("Unna-Bold", size: size, relativeTo: style)
        }
}
