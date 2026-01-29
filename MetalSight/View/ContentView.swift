//
// ContentView.swift
// MetalSight
//
// Created by Barreloofy on 11/30/25 at 10:36 PM
//

import SwiftUI

struct ContentView: View {
	@AppStorage("enabled")
	private var enabled = false

	@CodableStorage("configuration")
	private var configuration = Configuration()

	private let launchctlURL = URL(filePath: "/bin/launchctl")

	var body: some View {
		VStack(alignment: .leading, spacing: 10) {
			HUDControl(
				enabled: $enabled)

			TabContainer(
				configuration: $configuration)

			AppControl()
		}
		.onChange(of: enabled) {
			if enabled {
				try! Process.run(
					launchctlURL,
					arguments: configuration.asArguments)
			} else {
				try! Process.run(
					launchctlURL,
					arguments: ["unsetenv", "MTL_HUD_ENABLED"])
			}
		}
		.task(id: configuration) {
			guard
				enabled == true,
				let _ = try? await Task.sleep(for: .seconds(0.5))
			else { return }

			try! Process.run(
				launchctlURL,
				arguments: configuration.asArguments)
		}
	}
}


#Preview {
	ContentView()
		.scenePadding()
}
