//
//  SetupProfile.swift
//  SosmedApp
//
//  Created by Irfandio Daffa on 27/02/21.
//

import SwiftUI

struct SetupProfile: View {
    
    @StateObject var setProfileData = SetProfileViewModel()
    @Binding var show: Bool
    @State var email = ""
    @State var password = ""
    @State var visible = false
    @State var error = ""
    @State var alert = false
    @Binding var index: Int
    
    var body: some View {
        
        ZStack{
            VStack{
                Image(systemName: "person")
                    .font(.system(size: 65))
                    .foregroundColor(.black)
                    .frame(width: 115, height: 115)
                    .background(Color.white)
                    .clipShape(Circle())
                    .padding(.top)
                    .onTapGesture {
                        setProfileData.picker.toggle()
                    }
                
                VStack(alignment: .leading){
                    Text("Email")
                        .font(Font.custom("Poppins-Light", size: 10))
                        .foregroundColor(.black)
                    
                    TextField("Email", text: $email)
                        .font(Font.custom("Poppins-Light", size: 10))
                        .foregroundColor(.black)
                        .autocapitalization(.none)
                    
                    HStack{
                        Rectangle()
                            .fill(self.email != "" ? Color(#colorLiteral(red: 0.7608050108, green: 0.8164883852, blue: 0.9259157777, alpha: 1)) : Color.black)
                            .frame(height: 1)
                    }
                }
                .padding(.vertical)
                
                VStack(alignment: .leading){
                    Text("Password")
                        .font(Font.custom("Poppins-Light", size: 10))
                        .foregroundColor(.black)
                    
                    HStack(spacing: 15){
                        VStack{
                            if self.visible{
                                TextField("Password", text: $password)
                                    .font(Font.custom("Poppins-Light", size: 10))
                                    .autocapitalization(.none)
                            } else {
                                SecureField("Password", text: $password)
                                    .font(Font.custom("Poppins-Light", size: 10))
                                    .autocapitalization(.none)
                            }
                        }
                        Button(action: {
                            self.visible.toggle()
                        }) {
                            Image(systemName: self.visible ? "eye.slash.fill" : "eye.fill")
                                .foregroundColor(.black)
                        }
                    }
                    
                    HStack{
                        Rectangle()
                            .fill(self.password != "" ? Color(#colorLiteral(red: 0.7608050108, green: 0.8164883852, blue: 0.9259157777, alpha: 1)) : Color.black)
                            .frame(height: 1)
                    }
                    .padding(.bottom,5)
                    
                    Button(action: {
                        //self.reset()
                    }) {
                        Text("Forget password")
                            .font(Font.custom("Poppins-Bold", size: 10))
                            .fontWeight(.medium)
                            .foregroundColor(Color(#colorLiteral(red: 0.1264492869, green: 0.1133133397, blue: 0.5760020614, alpha: 1)))
                    }
                }
                .padding(.bottom, 20)
                
                Button(action: {
                    //self.verify()
                }) {
                    HStack(){
                        Spacer()
                        
                        Text("Login")
                            .font(Font.custom("Poppins-Bold", size: 16))
                            .foregroundColor(.white)
                            .padding([.top,.bottom],12)
                        
                        
                        Spacer()
                    }
                    .background(Color(#colorLiteral(red: 0.1264492869, green: 0.1133133397, blue: 0.5760020614, alpha: 1)))
                    .cornerRadius(15)
                    .shadow(color: Color(#colorLiteral(red: 0.1264492869, green: 0.1133133397, blue: 0.5760020614, alpha: 1)), radius: 2, x: 0, y: 4)
                }
                
                HStack{
                    
                    Spacer()
                    
                    Text("I'm new here")
                        .font(Font.custom("Poppins-Light", size: 15))
                        .padding(.trailing, 3)
                    
                    Button(action: {
                        //self.index = 1
                    }) {
                        Text("Create new account")
                            .font(Font.custom("Poppins-Bold", size: 15))
                            .fontWeight(.medium)
                            .foregroundColor(Color("Primary"))
                    }
                    
                    Spacer()
                }
                .padding(.vertical)
                
            }
            .padding()
            .background(ZStack{
                    Color(#colorLiteral(red: 0.9176285267, green: 0.9121738076, blue: 0.9218217731, alpha: 1))
                    
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .foregroundColor(.white)
                        .blur(radius: 4)
                        .offset(x: -5, y: -5)
                    
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .fill(
                            LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.9591959119, green: 0.9534935355, blue: 0.9635791183, alpha: 1)), Color.white]), startPoint: .leading, endPoint: .trailing)
                        )
                        .padding(1)
                        .blur(radius: 2)
                })
            .cornerRadius(20)
            .padding()
            .shadow(color: Color(#colorLiteral(red: 0.9591959119, green: 0.9534935355, blue: 0.9635791183, alpha: 1)), radius: 10, x: 10, y: 10)
            .shadow(color: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), radius: 10, x: -10, y: -10)
            //#colorLiteral(red: 0.7608050108, green: 0.8164883852, blue: 0.9259157777, alpha: 1)
        }
        
    }
}
