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
		Toggle("Metal HUD", isOn: $enabled)
			.toggleStyle(.switch)

		Text("Relaunch Crossover, Steam or game to apply")
			.font(.footnote)
	}
}


#Preview {
	@Previewable @State
	var enabled = true

	HUDControl(enabled: $enabled)
}
