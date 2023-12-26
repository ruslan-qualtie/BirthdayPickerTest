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
    
    private var datePicker: some View {
        DatePicker(
            "",
            selection: $now,
            displayedComponents: [.date]
        )
            .datePickerStyle(.graphical)
            .scaleEffect(CGSize(width: 3.0, height: 3.0))
            .offset(x: 450)
            .onChange(of: now) { newValue in
                text = DateFormatter.monthDayYear.string(from: newValue)
            }
            .frame(width: 450, height: 500)
        
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
            VStack {
                datePicker
                HStack {
                    Button("- 10 YEAR") {
                        var dateComponent = DateComponents()
                        dateComponent.year = -10
                        let newDate = Calendar.current.date(byAdding: dateComponent, to: now)!
                        now = newDate
                    }
                    Button("- 1 YEAR") {
                        var dateComponent = DateComponents()
                        dateComponent.year = -1
                        let newDate = Calendar.current.date(byAdding: dateComponent, to: now)!
                        now = newDate
                    }
                    Button("+ 1 YEAR") {
                        var dateComponent = DateComponents()
                        dateComponent.year = 1
                        let newDate = Calendar.current.date(byAdding: dateComponent, to: now)!
                        now = newDate
                    }
                    Button("+ 10 YEAR") {
                        var dateComponent = DateComponents()
                        dateComponent.year = 10
                        let newDate = Calendar.current.date(byAdding: dateComponent, to: now)!
                        now = newDate
                    }
                }
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
