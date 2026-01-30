//
// TabContainer.swift
// MetalSight
//
// Created by NotTheNHK on 1/29/26 at 5:36 PM
//

import SwiftUI

// NOTE: This serves as a usable enough replacement for SwiftUI's native `TabView`, as there are visual limitations when used from inside `MenuBarExtra`.

struct TabContainer: View {
	@State
	private var selectedTab = Tab.hud

	@Binding
	var configuration: Configuration

	var body: some View {
		Picker(selection: $selectedTab) {
			ForEach(Tab.allCases) { tab in
				Text(tab.rawValue)
			}
		} label: {}
			.pickerStyle(.segmented)
			.frame(maxWidth: .infinity, alignment: .center)

		ZStack {
			HUDConfiguration(
				placement: $configuration.placement,
				scale: $configuration.scale)
			.opacity(selectedTab == .hud ? 1 : 0)

			MetricsConfiguration(
				metrics: $configuration.metrics,
				metricsModifier: $configuration.metricsModifier)
			.opacity(selectedTab == .metrics ? 1 : 0)
		}
	}
}


#Preview {
	@Previewable @State
	var configuration = Configuration()

	TabContainer(configuration: $configuration)
}
