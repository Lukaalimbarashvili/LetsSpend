//
//  Slides.swift
//  LetsSpend
//
//  Created by Ucha Dzotsenidze on 02.04.21.
//

import Foundation
import UIKit

struct Slide {
    let title: String
    let animationName: String
    let buttonColor: UIColor
    let buttonTitle: String
    
    static let collection: [Slide] = [
        .init(title: "Get known to him ", animationName: "GetKnown", buttonColor: .systemGreen, buttonTitle: "Let's Get Started"),
        .init(title: "He owns one of the biggest online market - Amazon", animationName: "Amazon", buttonColor: .systemGreen, buttonTitle: "Interesting!"),
        .init(title: "He is the richest human on the Earth", animationName: "Rich", buttonColor: .systemGreen, buttonTitle: "Next"),
        .init(title: "Let's spend his money", animationName: "Spend", buttonColor: .systemGreen, buttonTitle: "Spend!")
    
    ]
}
