//
//  ContentView.swift
//  21cm0127&31 Test
//
//  Created by cmStudent on 2023/01/11.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        NavigationView{
            VStack{
                
                Text("夢の地図")
                    .font(.largeTitle)
                    .foregroundColor(Color.blue)
                Text(" 30日で本当の自分がわかる")
            
                    NavigationLink(
                        destination:
                            NextView()) {
                        
                        Text("始める")
                            .frame(width: 100, height: 80 )
                            .foregroundColor(Color.green)
                            .background(Color.primary)
                            .clipShape(Circle())
                            }
                }
            }
        }
}

    


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
        
