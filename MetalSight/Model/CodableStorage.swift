//
// CodableStorage.swift
// MetalSight
//
// Created by Barreloofy on 12/17/25 at 5:53 PM
//

import SwiftUI

@propertyWrapper
struct CodableStorage<Value: Codable>: DynamicProperty {
	@AppStorage private var storage: Data

	private let encoder = JSONEncoder()
	private let decoder = JSONDecoder()

	init(wrappedValue: Value, _ key: String, store: UserDefaults? = nil) {
		self._storage = AppStorage(
			wrappedValue: try! encoder.encode(wrappedValue),
			key,
			store: store)
	}

	var wrappedValue: Value {
		get {
			try! decoder.decode(Value.self, from: storage)
		}
		nonmutating set {
			storage = try! encoder.encode(newValue)
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
