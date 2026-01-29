//
// HUDConfiguration.swift
// MetalSight
//
// Created by Barreloofy on 12/12/25 at 4:57 PM
//

import SwiftUI

struct HUDConfiguration: View {
	@Binding
	var placement: HUDPlacement

	@Binding
	var scale: Double

	var body: some View {
		VStack(alignment: .leading, spacing: 10) {
			Section("Placement") {
				Picker(selection: $placement) {
					ForEach(HUDPlacement.allCases) { placement in
						Text(placement.rawValue)
					}
				} label: {}
					.pickerStyle(.inline)
			}

			Section("Scale") {
				Slider(value: $scale, in: 0...1, step: 0.1)
			}
		}
	}
}


#Preview {
	@Previewable @State
	var placement = HUDPlacement.topright
	@Previewable @State
	var scale = 0.2

	HUDConfiguration(placement: $placement, scale: $scale)
}
