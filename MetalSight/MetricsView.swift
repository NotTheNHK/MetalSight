//
// MetricsView.swift
// MetalSight
//
// Created by Barreloofy on 12/12/25 at 5:00 PM
//

import SwiftUI

struct MetricsView: View {
  @Binding var metrics: Set<String>

  private func isOn(for metric: ElementConfiguration) -> Binding<Bool> {
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

  var body: some View {
    List(ElementConfiguration.allCases) { metric in
      Toggle(
        metric.rawValue,
        isOn: isOn(for: metric))
      .listRowSeparator(.hidden)
    }
  }
}
