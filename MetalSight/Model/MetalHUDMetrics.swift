//
// MetalHUDMetrics.swift
// MetalSight
//
// Created by Barreloofy on 12/12/25 at 7:13 PM
//

enum MetalHUDMetrics: String, Identifiable, CaseIterable {
  case device = "Metal Device"
  case rosetta = "Rosetta Info"
  case layersize = "Layer Size and Composition"
  case layerscale = "Layer Scale and Pixel Format"
  case memory = "Memory"
  case refreshrate = "Screen Refresh Rate"
  case thermal = "Thermal State"
  case gamemode = "Game Mode"
  case fps = "FPS"
  case fpsgraph = "FPS Graph"
  case framenumber = "Frame Number"
  case gputime = "GPU Time"
  case presentdelay = "Present Delay"
  case frameinterval = "Frame Interval"
  case frameintervalgraph = "Frame Interval Graph"
  case frameintervalhistogram = "Frame Interval Histogram"
  case metalcpu = "Command Buffer and Encoder Count"
  case shaders = "Shader Compiler"
  case disk = "Disk Usage"
  case gputimeline = "Encoder Time and GPU Timeline"
  case toplabeledcommandbuffers = "Top Labeled Command Buffers"
  case toplabeledencoders = "Top Labeled Encoders"

  var requiresEncoderGPUTimeTracking: Bool {
    switch self {
    case .gputimeline, .toplabeledcommandbuffers, .toplabeledencoders:
      true
    default:
      false
    }
  }

  var id: Self {
    self
  }

  var description: String {
    "\(self)"
  }
}
