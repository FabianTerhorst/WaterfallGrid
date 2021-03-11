//
//  Copyright © 2019 Paolo Leonardi.
//
//  Licensed under the MIT license. See the LICENSE file for more info.
//
#if !arch(arm)
import SwiftUI

@available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
struct PreferenceSetter<ID: Hashable>: View {
    var id: ID
    var body: some View {
        GeometryReader { geometry in
            Color.clear
                .preference(key: ElementPreferenceKey.self, value: [ElementPreferenceData(id: AnyHashable(self.id), size: geometry.size)])
        }
    }
}
#endif
