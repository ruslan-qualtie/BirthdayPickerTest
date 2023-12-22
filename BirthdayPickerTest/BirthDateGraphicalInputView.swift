import SwiftUI

struct BirthDateGraphicalInputView: View {
    @ObservedObject public var viewModel: BirthDateInputViewModel

    var body: some View {
        DatePickerGraphical(
            text: $viewModel.birthDate,
            converter: viewModel.birthDateFormatter,
            initialDate: viewModel.initialDate
        )
        .scaleEffect(CGSize(width: 2.0, height: 2.0))
        .fixedSize(horizontal: true, vertical: true)
    }
}

#if DEBUG
public struct BirthDateGraphicalInputView_Previews: PreviewProvider {
    public static var previews: some View {
        BirthDateGraphicalInputView(viewModel: .init())
    }
}
#endif
