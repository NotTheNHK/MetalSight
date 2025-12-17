//
// HUDControl.swift
// MetalSight
//
// Created by Barreloofy on 12/9/25 at 5:34 PM
//

import SwiftUI

struct HUDControl: View {
  @Binding
  var enabled: Bool

  var body: some View {
    Section {
      Toggle("Metal HUD", isOn: $enabled)
        .toggleStyle(.switch)

      Text("Relaunch Crossover, Steam, game to apply")
        .font(.footnote)
    }
  }
}
