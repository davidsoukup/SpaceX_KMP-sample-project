//
//  Fonts.swift
//  iosApp
//
//  Created by David Soukup on 16.10.2025.
//

import SwiftUI

struct LargeTitle: ViewModifier {
    var color: Color
    func body(content: Content) -> some View {
        content
            .font(.system(size: 34, weight: .bold))
            .foregroundColor(color)
    }
}

struct LargeTitleRegular: ViewModifier {
    var color: Color
    func body(content: Content) -> some View {
        content
            .font(.system(size: 34, weight: .regular))
            .foregroundColor(color)
    }
}

struct Title1Bold: ViewModifier {
    var color: Color
    func body(content: Content) -> some View {
        content
            .font(.system(size: 28, weight: .bold))
            .foregroundColor(color)
    }
}

struct Title1Regular: ViewModifier {
    var color: Color
    func body(content: Content) -> some View {
        content
            .font(.system(size: 28, weight: .regular))
            .foregroundColor(color)
    }
}

struct Title2Bold: ViewModifier {
    var color: Color
    func body(content: Content) -> some View {
        content
            .font(.system(size: 22, weight: .bold))
            .foregroundColor(color)
    }
}

struct Title3: ViewModifier {
    var color: Color
    func body(content: Content) -> some View {
        content
            .font(.system(size: 17, weight: .bold))
            .foregroundColor(color)
    }
}

struct Headline: ViewModifier {
    var color: Color
    func body(content: Content) -> some View {
        content
            .font(.system(size: 17, weight: .bold))
            .foregroundColor(color)
    }
}

struct HeadlineRegular: ViewModifier {
    var color: Color
    func body(content: Content) -> some View {
        content
            .font(.system(size: 17, weight: .regular))
            .foregroundColor(color)
    }
}

struct BodyBold: ViewModifier {
    var color: Color
    func body(content: Content) -> some View {
        content
            .font(.system(size: 17, weight: .bold))
            .foregroundColor(color)
    }
}

struct BodyRegular: ViewModifier {
    var color: Color
    func body(content: Content) -> some View {
        content
            .font(.system(size: 17, weight: .regular))
            .foregroundColor(color)
    }
}

struct CalloutBold: ViewModifier {
    var color: Color
    func body(content: Content) -> some View {
        content
            .font(.system(size: 16, weight: .semibold))
            .foregroundColor(color)
    }
}

struct CalloutRegular: ViewModifier {
    var color: Color
    func body(content: Content) -> some View {
        content
            .font(.system(size: 16, weight: .regular))
            .foregroundColor(color)
    }
}

struct Textmd: ViewModifier {
    var color: Color
    func body(content: Content) -> some View {
        content
            .font(.system(size: 16, weight: .regular))
            .foregroundColor(color)
    }
}

struct TextmdBold: ViewModifier {
    var color: Color
    func body(content: Content) -> some View {
        content
            .font(.system(size: 16, weight: .semibold))
            .foregroundColor(color)
    }
}

struct SubheadlineRegular: ViewModifier {
    var color: Color
    func body(content: Content) -> some View {
        content
            .font(.system(size: 15, weight: .regular))
            .foregroundColor(color)
    }
}

struct SubheadlineMedium: ViewModifier {
    var color: Color
    func body(content: Content) -> some View {
        content
            .font(.system(size: 15, weight: .medium))
            .foregroundColor(color)
    }
}

struct Subheadline: ViewModifier {
    var color: Color
    func body(content: Content) -> some View {
        content
            .font(.system(size: 15, weight: .bold))
            .foregroundColor(color)
    }
}

struct TextsmBold: ViewModifier {
    var color: Color
    func body(content: Content) -> some View {
        content
            .font(.system(size: 14, weight: .bold))
            .foregroundColor(color)
    }
}

struct Textsm: ViewModifier {
    var color: Color
    func body(content: Content) -> some View {
        content
            .font(.system(size: 14, weight: .semibold))
            .foregroundColor(color)
    }
}

struct TextsmRegular: ViewModifier {
    var color: Color
    func body(content: Content) -> some View {
        content
            .font(.system(size: 14, weight: .regular))
            .foregroundColor(color)
    }
}

struct FootnoteBold: ViewModifier {
    var color: Color
    func body(content: Content) -> some View {
        content
            .font(.system(size: 13, weight: .bold))
            .foregroundColor(color)
    }
}

struct FootnoteRegular: ViewModifier {
    var color: Color
    func body(content: Content) -> some View {
        content
            .font(.system(size: 13, weight: .regular))
            .foregroundColor(color)
    }
}

struct Caption1Bold: ViewModifier {
    var color: Color
    func body(content: Content) -> some View {
        content
            .font(.system(size: 12, weight: .bold))
            .foregroundColor(color)
    }
}

struct Caption1Regular: ViewModifier {
    var color: Color
    func body(content: Content) -> some View {
        content
            .font(.system(size: 12, weight: .regular))
            .foregroundColor(color)
    }
}

struct Caption2: ViewModifier {
    var color: Color
    func body(content: Content) -> some View {
        content
            .font(.system(size: 11, weight: .regular))
            .foregroundColor(color)
    }
}
