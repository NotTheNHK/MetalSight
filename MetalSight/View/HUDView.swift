//
// HUDView.swift
// MetalSight
//
// Created by Barreloofy on 12/12/25 at 4:57 PM
//

import SwiftUI

struct HUDView: View {
  @Binding var placement: HUDPlacement
  @Binding var scale: Double

  var body: some View {
    VStack(alignment: .leading, spacing: 10) {
      Section("Placement") {
        Picker("", selection: $placement) {
          ForEach(HUDPlacement.allCases) { placement in
            Text(placement.rawValue)
          }
        }
        .pickerStyle(.inline)
      }

      Section("Scale") {
        Slider(value: $scale, in: 0...1, step: 0.1)
          .padding(.top, -5)
      }
    }
    .padding()
  }
}


#Preview {
  @Previewable @State var placement = HUDPlacement.topright
  @Previewable @State var scale = 0.2

  HUDView(placement: $placement, scale: $scale)
}
