//
// MetricsView.swift
// MetalSight
//
// Created by Barreloofy on 12/12/25 at 5:00 PM
//

import SwiftUI

struct MetricsView: View {
  @Binding var metricsModifier: Set<String>
  @Binding var metrics: Set<String>

  private func isOn(for metric: MetalHUDMetrics) -> Binding<Bool> {
    Binding {
      metrics.contains(metric.description)
    } set: { newValue in
      if newValue {
        metrics.insert(metric.description)
      } else {
        metrics.remove(metric.description)
      }
    }
  }

  private func isOn(for modifier: String) -> Binding<Bool> {
    Binding {
      metricsModifier.contains(modifier)
    } set: { newValue in
      if newValue {
        metricsModifier.insert(modifier)
      } else {
        metricsModifier.remove(modifier)
      }
    }
  }

  var body: some View {
    List {
      Section {
        Toggle(
          "Show Value Range",
          isOn: isOn(for: "MTL_HUD_SHOW_METRICS_RANGE"))

        Toggle(
          "Encoder GPU Time Tracking",
          isOn: isOn(for: "MTL_HUD_ENCODER_TIMING_ENABLED"))
        Label("Increases CPU usage", systemImage: "exclamationmark.triangle.fill")
          .symbolRenderingMode(.multicolor)
          .listRowInsets(.leading, 25)
      }
      .listRowSeparator(.hidden)

      Section {
        ForEach(MetalHUDMetrics.allCases) { metric in
          VStack(alignment: .leading) {
            Toggle(
              metric.rawValue,
              isOn: isOn(for: metric))

            if metric.requiresEncoderGPUTimeTracking {
              Label(
                "Requires Encoder GPU Time Tracking",
                systemImage: "exclamationmark.triangle.fill")
              .symbolRenderingMode(.multicolor)
              .offset(x: 25)
            }
          }
        }
      }
      .listRowSeparator(.hidden)
    }
  }
}

#Preview {
  MetricsView(metricsModifier: .constant([]), metrics: .constant([]))
}
