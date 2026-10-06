import Inject
import SwiftUI

struct ContentView: View {
  @ObserveInjection var inject
  @State private var showSheet = false

  var body: some View {
    VStack(spacing: 16) {
      Image(systemName: "rectangle.bottomthird.inset.filled")
        .font(.system(size: 56))
        .foregroundStyle(.tint)
      Text("Floating Bottom Sheets")
        .font(.title2.bold())
      Button("Show Bottom Sheet") {
        showSheet.toggle()
      }
      .buttonStyle(.borderedProminent)
    }
    .padding()
    .sheet(isPresented: $showSheet) {
      SheetContent()
        .presentationDetents([.height(220), .medium])
        .presentationDragIndicator(.visible)
        .presentationCornerRadius(24)
    }
    .enableInjection()
  }
}

struct SheetContent: View {
  @ObserveInjection var inject
  @Environment(\.dismiss) private var dismiss

  var body: some View {
    VStack(spacing: 12) {
      Text("Hello, bottom sheet!")
        .font(.headline)
      Text("Swipe down or drag the indicator to dismiss.")
        .font(.subheadline)
        .foregroundStyle(.secondary)
      Button("Close") {
        dismiss()
      }
      .buttonStyle(.bordered)
      .padding(.top, 4)
    }
    .frame(maxWidth: .infinity)
    .padding(.vertical, 24)
    .enableInjection()
  }
}

#Preview {
  ContentView()
}
