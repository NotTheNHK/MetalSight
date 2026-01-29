//
// Tab.swift
// MetalSight
//
// Created by NotTheNHK on 1/29/26 at 5:43 PM
//

enum Tab: String, Identifiable, CaseIterable {
	case hud = "HUD"
	case metrics = "Metrics"

	var id: Self {
		self
	}
}
