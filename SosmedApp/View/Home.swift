//
//  Home.swift
//  SosmedApp
//
//  Created by Irfandio Daffa on 25/02/21.
//

import SwiftUI
import Firebase

struct Home: View {
    var body: some View {
        VStack{
            Text("Yeaay kamu berhasil masuk nih")
                .font(Font.custom("Poppins-Bold", fixedSize: 20))
                .fontWeight(.bold)
                .foregroundColor(Color("Primary"))
            
            Button(action: {
                try! Auth.auth().signOut()
                UserDefaults.standard.set(false, forKey: "status")
                NotificationCenter.default.post(name: NSNotification.Name("status"), object: nil)
            }) {
                Text("Log Out")
            }
        }
    }
}
