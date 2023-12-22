import SwiftUI

struct BirthDateGraphicalInputView: View {
    @ObservedObject public var viewModel: BirthDateInputViewModel

    var body: some View {
        VStack {
            Text(viewModel.displayedBirthDate)
                .multilineTextAlignment(.center)
                .font(.system(size: 46, weight: .semibold))
                .foregroundColor(.white)
                .padding(24)
                .cornerRadius(16)
                .textFieldStyle(.plain)
                .overlay(borderView)
                .frame(width: 340)
            DatePickerGraphical(
                text: $viewModel.birthDate,
                converter: viewModel.birthDateFormatter,
                initialDate: viewModel.initialDate
            )
            .fixedSize(horizontal: true, vertical: true)
        }
    }
    
    private var borderView: some View {
        RoundedRectangle(cornerRadius: 16)
            .inset(by: 2)
            .stroke(Color.blue, lineWidth: 4)
    }
}

#if DEBUG
public struct BirthDateGraphicalInputView_Previews: PreviewProvider {
    public static var previews: some View {
        BirthDateGraphicalInputView(viewModel: .init())
    }
}
#endif
