//
// TabContainer.swift
// MetalSight
//
// Created by NotTheNHK on 1/29/26 at 5:36 PM
//

import SwiftUI

// TODO: Improve view hierarchy retention

struct TabContainer: View {
	@State
	private var tabState = Tab.hud

	@Binding
	var configuration: Configuration

	var body: some View {
		Picker(selection: $tabState) {
			ForEach(Tab.allCases) { tab in
				Text(tab.rawValue)
			}
		} label: {}
			.pickerStyle(.segmented)
			.frame(maxWidth: .infinity, alignment: .center)

		if tabState == .hud {
			HUDConfiguration(
				placement: $configuration.placement,
				scale: $configuration.scale)
		} else {
			MetricsConfiguration(
				metrics: $configuration.metrics,
				metricsModifier: $configuration.metricsModifier)
		}
	}
}
