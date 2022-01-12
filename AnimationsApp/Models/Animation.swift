//
//  Animation.swift
//  AnimationsApp
//
//  Created by Roman Zhukov on 12.01.2022.
//

import Spring  /* Евгения, не уверен, правильно ли импортировать в модель фреймворк.
                Возможно правильнее было бы проинициализировать свойства модели уже во ViewController и не обращатсья тут к классу Spring?
                Подскажите пожалуйста)
                */
struct Animation {
    let preset: String
    let curve: String
    let force: CGFloat
    let duration: CGFloat
    let delay: CGFloat
}

extension Animation {
    static func getRandomAnimation() -> Animation {
        Animation(preset: Spring.AnimationPreset.allCases.randomElement()?.rawValue ?? "",
                  curve: Spring.AnimationCurve.allCases.randomElement()?.rawValue ?? "",
                  force: CGFloat.random(in: 0.9...1),
                  duration: CGFloat.random(in: 1...1.5),
                  delay: CGFloat.random(in: 0...0.3))
    }
}

