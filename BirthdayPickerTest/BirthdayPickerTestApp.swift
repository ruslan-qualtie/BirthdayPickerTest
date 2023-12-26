import SwiftUI

@main
struct BirthdayPickerTestApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                BirthdayPopover()
                    .tabItem { Text("Date Piker inside popover") }
                BirthdayPageInputView(viewModel: .init())
                    .tabItem { Text("Scaled Date Piker") }
                BirthDateGraphicalInputView(viewModel: .init())
                    .tabItem { Text("Graphical Date Piker")}
            }
        }
    }
}
