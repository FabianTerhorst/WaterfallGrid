//
//  Copyright © 2019 Paolo Leonardi.
//
//  Licensed under the MIT license. See the LICENSE file for more info.
//

import SwiftUI

@available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
struct ScrollOptions {
    let direction: Axis.Set
}

@available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
struct ScrollOptionsKey: EnvironmentKey {
    static let defaultValue = ScrollOptions(direction: .vertical)
}

@available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
extension EnvironmentValues {
    var scrollOptions: ScrollOptions {
        get { self[ScrollOptionsKey.self] }
        set { self[ScrollOptionsKey.self] = newValue }
    }
}
