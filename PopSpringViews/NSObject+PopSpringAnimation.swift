//
//  NSObject+PopSpringAnimation.swift
//  EcoBuddy
//
//  Created by Andrea Bizzotto on 08/02/2017.
//  Copyright © 2017 musevisions. All rights reserved.
//

import UIKit
import SwiftPop

public extension NSObject {
    
    public func pop_addSpringAnimation(propertyNamed propertyName: String, initialValue: CGFloat, popRatio: CGFloat, touchDown: Bool, bounciness: CGFloat = 8) {
        
        assert(popRatio <= 1.0)
        assert(popRatio > 0.0)
        
        if popRatio == 1.0 {
            return
        }

        let targetValue = touchDown ? initialValue * popRatio : initialValue
        let numberValue = NSNumber(value: Float(targetValue))
        
        pop_addSpringAnimation(propertyNamed: propertyName, toValue: numberValue, bounciness: bounciness)
    }
    
    public func pop_addSpringAnimation(propertyNamed propertyName: String, initialSize: CGSize, popRatio: CGFloat, touchDown: Bool, bounciness: CGFloat = 8) {
        
        assert(popRatio <= 1.0)
        assert(popRatio > 0.0)
        
        if popRatio == 1.0 {
            return
        }
 
        let targetSize = touchDown ? CGSize(width: initialSize.width * popRatio, height:  initialSize.height * popRatio) : initialSize
        let size = NSValue(cgSize: targetSize)
        
        pop_addSpringAnimation(propertyNamed: propertyName, toValue: size, bounciness: bounciness)
    }
    
    private func pop_addSpringAnimation(propertyNamed propertyName: String, toValue value: Any, bounciness: CGFloat = 8) {
        
        self.pop_removeAllAnimations()
        
        let animation = makePopSprintAnimation(propertyNamed: propertyName, toValue: value, bounciness: bounciness)
        
        let animationKey = "SpringAnimation_\(propertyName)"

        self.pop_add(animation, forKey: animationKey)
    }

    private func makePopSprintAnimation(propertyNamed: String, toValue value: Any, bounciness: CGFloat) -> POPSpringAnimation {
        
        let animation = POPSpringAnimation(propertyNamed: propertyNamed)!
        animation.springBounciness = bounciness
        animation.toValue = value
        return animation
    }
}
