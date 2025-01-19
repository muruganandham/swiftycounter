// The Swift Programming Language
// https://docs.swift.org/swift-book
import SwiftUI

@available(iOS 17.0, *)
@available(macOS 14.0, *)
public struct SwiftyCounter: View {
    
    @Binding var rating: Int
    @State var minValue = 0
    @State var maxValue = 100
    @State var step = 10
    
    // Public initializer with default values
    public init(rating: Binding<Int>, step: Int = 10) {
        self._rating = rating
        self._step = State(initialValue: step)
    }
    
    public var body: some View {
        HStack(alignment: .center) {
            Button(action: {
                withAnimation {
                    rating -= step
                    if rating <= minValue {
                        rating = minValue
                    }
                }
            }) {
                Image(systemName: "minus.circle") // Icon for the button
                    .resizable() // Makes the icon resizable
                    .scaledToFit() // Ensures the icon fits the frame
                    .frame(width: 24, height: 24) // Icon size within the button
            }
            .frame(width: 24, height: 24) // Button square size
            .disabled(rating <= minValue)
            
            // print the rating value
            Text("\(rating)").contentTransition(.numericText(value: Double(rating))).frame(width: 50)
            
            Button(action: {
                withAnimation {
                    rating += step
                    if rating >= maxValue {
                        rating = maxValue
                    }
                }
            }) {
                Image(systemName: "plus.circle") // Icon for the button
                    .resizable() // Makes the icon resizable
                    .scaledToFit() // Ensures the icon fits the frame
                    .frame(width: 24, height: 24) // Icon size within the button
            }
            .frame(width: 24, height: 24) // Button square size
            .disabled(rating >= maxValue)
        }
    }
}
