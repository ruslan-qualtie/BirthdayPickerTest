import SwiftUI

struct YearPicker: View {
    @ObservedObject public var viewModel: YearPickerModel
    @Binding public var text: String

    var body: some View {
        if viewModel.shouldShowDatePicker {
            datePicker
        } else {
            VStack(spacing: 8) {
                yearsTableHeader()
                yearsTable(value: viewModel.initialYear)
            }
            .frame(width: 500, height: 500)
            .foregroundColor(Color(red: 238.0 / 255.0, green: 238.0 / 255.0, blue: 238.0 / 255.0))
            .background(Color(red: 55.0 / 255.0, green: 55.0 / 255.0, blue: 55.0 / 255.0))
        }
    }
    
    private var datePicker: some View {
        DatePicker(
            "",
            selection: $viewModel.selectedDate,
            displayedComponents: [.date]
        )
            .datePickerStyle(.graphical)
            .scaleEffect(CGSize(width: 3.0, height: 3.0))
            .offset(x: 450)
            .onChange(of: viewModel.selectedDate) { newValue in
                text = DateFormatter.monthDayYear.string(from: newValue)
            }
            .frame(width: 450, height: 500)
        
    }
    
    private func yearsTableHeader() -> some View {
        HStack(spacing: 0) {
            headerButton(
                icon: "chevron.left.2",
                action: viewModel.navigateBackwad
            )
            .disabled(viewModel.isDisabledBackward)
            Spacer()
            headerYears()
            Spacer()
            headerButton(
                icon: "chevron.right.2",
                action: viewModel.navigateForwad
            )
            .disabled(viewModel.isDisabledForward)
        }
        .buttonStyle(.plain)
        .frame(maxWidth: .infinity)
    }
    
    private func headerYears() -> some View {
        Text(viewModel.displayedYears)
            .font(.system(size: 24))
    }
    
    private func headerButton(icon: String, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            Image(systemName: icon)
                .font(.system(size: 24))
                .padding(.horizontal, 8)
        }
    }
    
    private func yearsTable(value: Int) -> some View {
        VStack {
            yearsRow(value: value)
            yearsRow(value: value + 3)
            yearsRow(value: value + 6)
            yearsRow(value: value + 9)
        }
    }
    
    private func yearsRow(value: Int) -> some View {
        HStack {
            yearButton(value: value - 1)
            yearButton(value: value)
            yearButton(value: value + 1)
        }
    }
    
    private func yearButton(value: Int) -> some View {
        Button(
            action: {
                viewModel.select(year: value)
            }
        ) {
            Text(String(value))
                .font(.system(size: 24))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .contentShape(Rectangle())
        }
        .buttonStyle(.plain)
        .disabled(viewModel.isDisabled(year: value))
    }
}

#if DEBUG
public struct YearPicker_Previews: PreviewProvider {
    public static var previews: some View {
        VStack {
            YearPicker(viewModel: .init(initialYear: 1890), text: .constant(""))
            YearPicker(viewModel: .init(initialYear: 2000), text: .constant(""))
            YearPicker(viewModel: .init(initialYear: 2020), text: .constant(""))
        }
    }
}
#endif
