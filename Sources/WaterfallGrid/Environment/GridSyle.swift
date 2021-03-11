//
//  Copyright © 2019 Paolo Leonardi.
//
//  Licensed under the MIT license. See the LICENSE file for more info.
//
#if !arch(arm)
import SwiftUI

@available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
struct GridSyle {
    @PositiveNumber var columnsInPortrait: Int
    @PositiveNumber var columnsInLandscape: Int

    let spacing: CGFloat
    let animation: Animation?

    var columns: Int {
        #if os(OSX) || os(tvOS) || targetEnvironment(macCatalyst)
        return columnsInLandscape
        #elseif os(watchOS)
        return columnsInPortrait
        #else
        let screenSize = UIScreen.main.bounds.size
        return screenSize.width > screenSize.height ? columnsInLandscape : columnsInPortrait
        #endif
    }
}

@available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
struct GridStyleKey: EnvironmentKey {
    static let defaultValue = GridSyle(columnsInPortrait: 2, columnsInLandscape: 2,
                                       spacing: 8, animation: .default)
}

@available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
extension EnvironmentValues {
    var gridStyle: GridSyle {
        get { self[GridStyleKey.self] }
        set { self[GridStyleKey.self] = newValue }
    }
}
#endif
