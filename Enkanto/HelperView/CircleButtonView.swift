//
//  CircleButtonView.swift
//  Enkanto
//
//  Created by Iuri Ferreira on 03/10/23.
//

import SwiftUI

enum ButtonType : String {
    case back = "gobackward"
    case no = "xmark"
    case heart = "heart.fill"
    case star = "star.fill"
    case lightning = "cloud.bolt.fill"
}

struct CircleButton : ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .background(Circle().foregroundColor(.white))
            .scaleEffect(configuration.isPressed ? 0.7 : 1.0)
    }
}

struct ColorButton : ViewModifier {
    var type : ButtonType
    
    func body(content: Content) -> some View {
        switch type {
        case .no:
            return AnyView(
                content
                .foregroundColor(Color.red))
        case .back:
            return AnyView(
                content
                .foregroundColor(.yellow))
        case .heart:
            return AnyView(
                content
                .foregroundColor(.red))
        case .star:
            return AnyView(
                content
                .foregroundColor(Color.blue))
        case .lightning:
            return AnyView(
                content
                .foregroundColor(Color.purple))
        }
    }
}

extension View {
    func colorButton(_ type:ButtonType) -> some View {
        self.modifier(ColorButton(type: type))
    }
}

struct CircleButtonView: View {
    var type : ButtonType
    var action : ()->()
    var body: some View {
        Button {
            action()
        } label: {
            Image(systemName: type.rawValue)
                .resizable()
                .font(.system(size: 12, weight: .bold))
                .aspectRatio(contentMode: .fit)
                .padding(12)
        }
        .buttonStyle(CircleButton())
        .colorButton(type)

    }
}

struct CircleButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.gray.opacity(0.1)
                .edgesIgnoringSafeArea(.all)
            VStack {
                CircleButtonView(type: .back) {}
                    .frame(height: 50)
                CircleButtonView(type: .heart) {}
                    .frame(height: 50)
                CircleButtonView(type: .no) {}
                    .frame(height: 50)
                CircleButtonView(type: .star) {}
                    .frame(height: 50)
                CircleButtonView(type: .lightning) {}
                    .frame(height: 50)
            }
        }
        
    }
}
