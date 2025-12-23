//
// CodableStorage.swift
// MetalSight
//
// Created by Barreloofy on 12/17/25 at 5:53 PM
//

import SwiftUI

@propertyWrapper
struct CodableStorage<Value: Codable>: DynamicProperty {
  private var storage: AppStorage<Data>

  private let encoder = JSONEncoder()
  private let decoder = JSONDecoder()

  init(wrappedValue: Value, _ key: String) {
    storage = AppStorage(wrappedValue: try! encoder.encode(wrappedValue), key)
  }

  var wrappedValue: Value {
    get {
      try! decoder.decode(Value.self, from: storage.wrappedValue)
    }
    nonmutating set {
      storage.wrappedValue = try! encoder.encode(newValue)
    }
  }

  var projectedValue: Binding<Value> {
    Binding {
      wrappedValue
    } set: { newValue in
      wrappedValue = newValue
    }
  }
}
