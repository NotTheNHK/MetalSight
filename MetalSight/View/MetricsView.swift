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

  @AppStorage("frameRange") private var frameRange = 6
  @AppStorage("gpuInterval") private var gpuInterval = 1
  @AppStorage("systemInterval") private var systemInterval = 3

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
          "Show Metrics With 0 Value",
          isOn: isOn(for: "MTL_HUD_SHOW_ZERO_METRICS"))

        Toggle(
          "Encoder GPU Time Tracking",
          isOn: isOn(for: "MTL_HUD_ENCODER_TIMING_ENABLED"))
        Label("Increases CPU usage", systemImage: "exclamationmark.triangle.fill")
          .symbolRenderingMode(.multicolor)
          .listRowInsets(.leading, 25)
      }
      .listRowSeparator(.hidden)

      Section {
        Picker("GPU Timeline Frame Range", selection: $frameRange) {
          ForEach(1...6, id: \.self) { count in
            Text(count.description)
          }
        }

        Picker("GPU Timeline Update Interval", selection: $gpuInterval) {
          ForEach([1, 15, 30, 45, 60], id: \.self) { interval in
            Text(interval.description)
          }
        }

        Picker("System Resource Update Interval", selection: $systemInterval) {
          ForEach([1, 3, 15, 30 , 45, 60], id: \.self) { interval in
            Text(interval.description)
          }
        }
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
