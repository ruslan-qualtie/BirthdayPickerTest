import SwiftUI

struct BirthdayPageInputView: View {
    @ObservedObject public var viewModel: BirthDateInputViewModel

    var body: some View {
        HStack {
            CustomDatePicker(
                text: $viewModel.birthDate,
                converter: viewModel.birthDateFormatter,
                initialDate: viewModel.initialDate
            )
            .scaleEffect(CGSize(width: 3.0, height: 3.0))
            .fixedSize(horizontal: true, vertical: true)
            .offset(x: 20)
            .padding()
        }
    }
}

#if DEBUG
public struct BirthdayPageInputView_Previews: PreviewProvider {
    public static var previews: some View {
        BirthdayPageInputView(viewModel: .init())
    }
}
#endif
