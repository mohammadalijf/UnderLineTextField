//
//  VerticalAlignmentTextLayer.swift
//  UnderLineTextField
//
//  Created by Mohammad Ali Jafarian on 10/19/17.
//  Copyright © 2017 Mohammad Ali Jafarian. All rights reserved.
//

import UIKit

/// Subclass of CATextLayer which align text in center vertically
class VerticalAlignedTextLayer: CATextLayer {
    //============
    // MARK: - inits
    //============
    override init() {
        super.init()
    }

    override init(layer: Any) {
        super.init(layer: layer)
    }

    required init(coder aDecoder: NSCoder) {
        super.init(layer: aDecoder)
    }
}

extension VerticalAlignedTextLayer {
    //=================
    // MARK: - Overrides
    //=================
    override func draw(in ctx: CGContext) {
        let height = self.bounds.size.height
        let fontSize = self.fontSize
        let yDiff = (height-fontSize) / 2 - fontSize / 10
        ctx.saveGState()
        ctx.translateBy(x: 0.0, y: yDiff)
        super.draw(in: ctx)
        ctx.restoreGState()
    }
}
