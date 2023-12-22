import SwiftUI

@main
struct BirthdayPickerTestApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                BirthdayPageInputView(viewModel: .init())
                    .tabItem { Text("Scaled Date Piker") }
                BirthdayPopover()
                    .tabItem { Text("Date Piker inside popover") }
                BirthDateGraphicalInputView(viewModel: .init())
                    .tabItem { Text("Graphical Date Piker")}
            }
        }
    }
}
