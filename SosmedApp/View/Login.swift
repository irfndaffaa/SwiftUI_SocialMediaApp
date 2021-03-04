//
//  Login.swift
//  SosmedApp
//
//  Created by Irfandio Daffa on 23/02/21.
//

import SwiftUI
import Lottie
import Firebase


struct Hub: View {
    
    @State var show = false
    @State var status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
    
    var body: some View{
        NavigationView {
            VStack{
                if self.status{
                    Home()
                }
                else{
                    SplashScreen()
                }
            }
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            .onAppear{
                NotificationCenter.default.addObserver(forName: NSNotification.Name("status"), object: nil, queue: .main) { (_) in
                    self.status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
                }
            }
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
    
}

struct Login: View {
    
    @Binding var show: Bool
    @State var email = ""
    @State var password = ""
    @State var visible = false
    @State var error = ""
    @State var alert = false
    @Binding var index: Int
    
    var body: some View {
        ZStack(alignment: .center){
            VStack{
                HStack{
                    VStack(alignment: .leading, spacing: 10, content: {
                        Text("Login")
                            .font(Font.custom("Poppins-Bold", size: 18))
                            .fontWeight(.bold)
                            .foregroundColor(Color(#colorLiteral(red: 0.1264492869, green: 0.1133133397, blue: 0.5760020614, alpha: 1)))
                    })
                    .padding(.top, 5)
                    
                    Spacer(minLength: 15)
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
                        self.reset()
                    }) {
                        Text("Forget password")
                            .font(Font.custom("Poppins-Bold", size: 10))
                            .fontWeight(.medium)
                            .foregroundColor(Color(#colorLiteral(red: 0.1264492869, green: 0.1133133397, blue: 0.5760020614, alpha: 1)))
                    }
                }
                .padding(.bottom, 20)
                
                Button(action: {
                    self.verify()
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
                        self.index = 1
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
            .frame(height: show ? nil : 0)
            .opacity(show ? 1 : 0)
            
            if self.alert{
                ErrorCheck(alert: self.$alert, error: self.$error)
            }
        }
    }
    
    func verify(){
        if self.email != "" && self.password != ""{
            Auth.auth().signIn(withEmail: self.email, password: self.password) { (res, err) in
                if err != nil{
                    self.error = err!.localizedDescription
                    self.alert.toggle()
                    return
                }
                
                print("Success")
                
                UserDefaults.standard.set(true, forKey: "status")
                NotificationCenter.default.post(name: NSNotification.Name("status"), object: nil)
            }
        }
        else{
            self.error = "Please fill all content properly"
            self.alert.toggle()
        }
    }
    
    func reset(){
        if self.email != ""{
            Auth.auth().sendPasswordReset(withEmail: self.email) { (err) in
                if err != nil{
                    self.error = err!.localizedDescription
                    self.alert.toggle()
                    return
                }
            }
        }
        else{
            self.error = "Email is empty"
            self.alert.toggle()
        }
    }
}

struct SplashScreen: View{
    
    @State var show = false
    @State var index = 0
    @State var error = ""
    @State var alert = false
    
    var body: some View{
        VStack{
            ZStack {
                VStack{
                    AnimatedView(show: $show)
                        .frame(height: UIScreen.main.bounds.height / 2)
                    
                    ZStack{
                        Register(show: self.$show, index: self.$index)
                            .zIndex(Double(self.index))
                        
                        Login(show: self.$show, index: self.$index)
                        
                    }
                }
            }
        }
    }
}

struct Register: View{
    
    @State var email = ""
    @State var password = ""
    @State var visible = false
    @State var error = ""
    @State var alert = false
    @Binding var show: Bool
    @Binding var index: Int
    
    var body: some View{
        ZStack(alignment: .center){
            VStack{
                HStack{
                    VStack(alignment: .leading, spacing: 10, content: {
                        Text("Register")
                            .font(Font.custom("Poppins-Bold", size: 18))
                            .fontWeight(.bold)
                            .foregroundColor(Color(#colorLiteral(red: 0.1264492869, green: 0.1133133397, blue: 0.5760020614, alpha: 1)))
                    })
                    .padding(.top, 5)
                    
                    Spacer(minLength: 15)
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
    //                                self.reset()
                    }) {
                        Text("")
                            .font(Font.custom("Poppins-Bold", size: 10))
                            .fontWeight(.medium)
                            .foregroundColor(Color(#colorLiteral(red: 0.1264492869, green: 0.1133133397, blue: 0.5760020614, alpha: 1)))
                    }
                }
                .padding(.bottom, 20)
                
                Button(action: {
                    self.register()
                }) {
                    HStack(){
                        Spacer()
                        
                        Text("Register")
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
                    
                    Text("I'm already in")
                        .font(Font.custom("Poppins-Light", size: 15))
                        .padding(.trailing, 3)
                    
                    Button(action: {
                        self.index = 0
                    }) {
                        Text("Log In")
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
            .frame(height: show ? nil : 0)
            .opacity(show ? 1 : 0)
            
            if self.alert{
                ErrorCheck(alert: self.$alert, error: self.$error)
            }
        }
    }
    
    func register(){
        if self.email != "" && self.password != ""{
            Auth.auth().createUser(withEmail: self.email, password: self.password) { (res, err) in
                if err != nil{
                    self.error = err!.localizedDescription
                    self.alert.toggle()
                    return
                }
                
                print("Success")
                
                UserDefaults.standard.set(true, forKey: "status")
                NotificationCenter.default.post(name: NSNotification.Name("status"), object: nil)
            }
        }
        else{
            self.error = "Please fill all content properly"
            self.alert.toggle()
        }
    }
}

struct AnimatedView: UIViewRepresentable{
    
    @Binding var show: Bool
    
    func makeUIView(context: Context) -> AnimationView {
        let view = AnimationView(name: "splash4", bundle: Bundle.main)
        
        view.play{ (status) in
            if status{
                withAnimation(.interactiveSpring(response: 0.7, dampingFraction: 0.8, blendDuration: 0.8)){
                    show.toggle()
                }
            }
        }
        
        return view
    }
    
    func updateUIView(_ uiView: AnimationView, context: Context) {
        
    }
}

struct ErrorCheck: View{
    
    @Binding var alert: Bool
    @Binding var error: String
    
    var body: some View{
        VStack{
            VStack{
                HStack{
                    Spacer()
                    
                    Text(self.error == "RESET" ? "Message" : "Error")
                        .font(Font.custom("Poppins-Bold", size: 28))
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                    
                    Spacer()
                }
                .padding()
                
                Text(self.error == "RESET" ? "Password reset link has been sent successfully to your email" : self.error)
                    .font(Font.custom("Poppins-Light", size: 15))
                    .foregroundColor(Color("Primary"))
                    .padding(.top, 5)
                    .padding(.horizontal,25)
                
                Button(action: {
                    self.alert.toggle()
                }) {
                    Text(self.error == "RESET" ? "Ok" : "Cancel")
                        .font(Font.custom("Poppins-Light", size: 15))
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 120)
                }
                .background(Color("Primary"))
                .cornerRadius(10)
                .padding(.top,25)
            }
            .padding(.vertical, 25)
            .frame(width: UIScreen.main.bounds.width - 70)
            .background(Color.white)
            .cornerRadius(15)
        }
    }
}
