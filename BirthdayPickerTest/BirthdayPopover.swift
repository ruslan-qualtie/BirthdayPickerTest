import SwiftUI

struct BirthdayPopover: View {
    @State private var now = Date()
    @State private var text = ""
    @State private var displayPopOver = false
    
    private var borderView: some View {
        RoundedRectangle(cornerRadius: 16)
            .inset(by: 2)
            .stroke(Color.blue, lineWidth: 4)
    }
    
    private var birthDateFormatter: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "MM/dd/yyyy"
        return dateFormatter
    }
    
    private var birthDateText: String {
        text.isEmpty ? "DD/MM/YYYY" : text
    }
    
    var body: some View {
        VStack {
            Text(birthDateText)
                .multilineTextAlignment(.center)
                .font(.system(size: 46, weight: .semibold))
                .foregroundColor(.white)
                .padding(24)
                .cornerRadius(16)
                .textFieldStyle(.plain)
                .overlay(borderView)
                .frame(width: 340)
                .onTapGesture { displayPopOver.toggle() }
        }
        .popover(isPresented: $displayPopOver) {
            DatePicker(
                "",
                selection: $now,
                displayedComponents: [.date]
            )
                .datePickerStyle(.graphical)
                .onChange(of: now) { newValue in
                    text = DateFormatter.monthDayYear.string(from: newValue)
                }
        }
        .padding()
    }
}

#if DEBUG
public struct BirthdayPopover_Previews: PreviewProvider {
    public static var previews: some View {
        BirthdayPopover()
    }
}
#endif
