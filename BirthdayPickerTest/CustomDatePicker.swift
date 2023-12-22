import SwiftUI

struct CustomDatePicker: View {
    private var text: Binding<String>
    private let converter: DateFormatter
    @State private var selectedDate: Date

    init(text: Binding<String>, converter: DateFormatter, initialDate: Date) {
        self.text = text
        self.converter = converter

        if let date = converter.date(from: text.wrappedValue) {
            _selectedDate = .init(initialValue: date)
        } else {
            _selectedDate = .init(initialValue: initialDate)
        }
    }

    var body: some View {
        DatePicker(
            "Date of Birth",
            selection: $selectedDate,
            displayedComponents: .date
        )
        .labelsHidden()
        .onChange(of: selectedDate) { newValue in
            text.wrappedValue = converter.string(from: newValue)
        }
    }
}
