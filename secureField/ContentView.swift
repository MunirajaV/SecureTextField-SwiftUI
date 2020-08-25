//
//  ContentView.swift
//  secureField
//
//  Created by Muniraja Velumani on 25/08/20.
//

import SwiftUI

struct ContentView: View {
    @State var email = ""
    @State var password = ""
    @State var secured = false
    
    var body: some View {
        ZStack {
           VStack {
            Group {
                TextField("Email",text: self.$email).padding()
                    .frame(width: UIScreen.main.bounds.width - 34)
                    .background(Color.white)
            .cornerRadius(25)
            }
           ZStack {
            HStack { if self.secured { TextField("Password",text: self.$password).padding()
                .frame(width: UIScreen.main.bounds.width - 34)
                .background(Color.white)
            .cornerRadius(25)
                .offset(x: 15
                , y: 0)
            } else {
                SecureField("Password",text: self.$password).padding()
                    .foregroundColor(Color.black)
                    .frame(width: UIScreen.main.bounds.width - 34)
                    .background(Color.white)
                .cornerRadius(25)
                .offset(x: 15
                , y: 0)
                }
                Button(action: {self.secured.toggle()}) {
                    Image(systemName: self.secured ? "eye.fill": "eye.slash.fill")
                        .foregroundColor((self.secured == true) ? Color.green : Color.secondary)
                    } .offset(x: -40
                        , y: 0)
              }
            
            }
            Button(action: {}) {
                Text("Login").padding()
                .fixedSize()
                .frame(width: 140, height: 45)
                    .foregroundColor(.white)
                    .background(Color(#colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)))
                .cornerRadius(8)
            }
        } .padding([.leading, .trailing])
            
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 20)
        .background(Color(#colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
