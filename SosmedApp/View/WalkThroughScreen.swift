//
//  WalkThroughScreen.swift
//  SosmedApp
//
//  Created by Irfandio Daffa on 26/02/21.
//

import SwiftUI
import Lottie

struct WalkThroughScreen: View {
    
    var body: some View {
        ZStack{
            ScreenView()
        }
        .overlay(
            Button(action: {}, label: {
                Image(systemName: "chevron.right")
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(.black)
                    .frame(width: 60, height: 60)
                    .background(Color(#colorLiteral(red: 0.9193362594, green: 0.9369602799, blue: 1, alpha: 1)))
                    .clipShape(Circle())
                // Circular Slider
                    .overlay(
                        ZStack{
                            Circle()
                                .stroke(Color("Primary"), lineWidth: 4)
                                
                            Circle()
                                .trim(from: 0, to: 0.5)
                                .stroke(Color(#colorLiteral(red: 0.815690577, green: 0.8108426929, blue: 0.8194177747, alpha: 1)), lineWidth: 4)
                            
                        }
                        .padding(-10)
                    )
            })
            ,alignment: .bottom
        ).padding(.bottom, 20)
    }
}

struct ScreenView: View{
    
    @State var show = false
    
    var body: some View{
        VStack(spacing: 20){
            HStack{
                Text("Hello!")
                    .font(Font.custom("Poppins-Bold", size: 25))
                    .fontWeight(.bold)
                
                Spacer()
            }
            .foregroundColor(Color("Primary"))
            .padding()
            
            AnimatedWalkthrough(show: $show)
                .frame(height: UIScreen.main.bounds.height / 2)
            
            Text("Yeaayy!! you almost there")
                .font(Font.custom("Poppins-Bold", size: 20))
                .fontWeight(.bold)
                .foregroundColor(Color("Primary"))
                .padding(.top, 10)
            
            Text("Let's setup your profile before we go")
                .font(Font.custom("Poppins-Bold", size: 18))
                .fontWeight(.bold)
                .foregroundColor(Color("Primary"))
                .padding(.top, 5)
            
            Spacer(minLength: 100)
        }
    }
}

struct AnimatedWalkthrough: UIViewRepresentable{
    
    @Binding var show: Bool
    
    func makeUIView(context: Context) -> AnimationView {
        let view = AnimationView(name: "wt", bundle: Bundle.main)
        
        view.play{ (status) in
            if status{
                withAnimation(.interactiveSpring(response: 0.7, dampingFraction: 0.8, blendDuration: 0.8)){
                    show.toggle()
                }
            }
        }
        
        view.loopMode = .loop
        
        return view
    }
    
    func updateUIView(_ uiView: AnimationView, context: Context) {
        
    }
}
