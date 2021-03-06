//
//  FBSimulatorInteraction+PXCTestKit.swift
//  pxctest
//
//  Created by Johannes Plunien on 06/12/16.
//  Copyright © 2016 Johannes Plunien. All rights reserved.
//

import FBSimulatorControl
import Foundation

extension FBSimulatorInteraction {

    func loadPreferences(_ defaults: [String: Any]) -> FBSimulatorInteraction {
        return interact(simulator: { (error: NSErrorPointer, simulator: FBSimulator?) -> Bool in
            guard let simulator = simulator else { return false }
            let strategy = FBDefaultsModificationStrategy(simulator: simulator)
            var result = true
            do {
                try strategy.modifyDefaults(inDomainOrPath: "com.apple.Preferences", defaults: defaults)
            }
            catch (let innerError) {
                error?.pointee = innerError as NSError
                result = false
            }
            return result
        })
    }

}
