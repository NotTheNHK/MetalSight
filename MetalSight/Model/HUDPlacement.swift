//
// HUDPlacement.swift
// MetalSight
//
// Created by Barreloofy on 12/12/25 at 7:13 PM
//

enum HUDPlacement: String, Identifiable, Codable, CaseIterable {
  case topleft = "Top-Left"
  case topcenter = "Top-Center"
  case topright = "Top-Right"
  case centerleft = "Center-Left"
  case centered = "Centered"
  case centerright = "Center-Right"
  case bottomright = "Bottom-Right"
  case bottomcenter = "Bottom-Center"
  case bottomleft = "Bottom-Left"

  var id: Self {
    self
  }

  var description: String {
    "\(self)"
  }
}
