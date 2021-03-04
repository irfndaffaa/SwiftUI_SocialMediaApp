//
//  SetProfileViewModel.swift
//  SosmedApp
//
//  Created by Irfandio Daffa on 27/02/21.
//

import SwiftUI
import Firebase

class SetProfileViewModel: ObservableObject{
    
    @Published var name = ""
    @Published var bio = ""
    
    @Published var image_data = Data(count: 0)
    @Published var picker = false
}

