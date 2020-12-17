//
//  ContentView.swift
//  CarCode
//
//  Created by Andrey Kudryavtsev on 15.12.2020.
//

import SwiftUI


struct ContentView: View {
    var body: some View {
        NavView()
    }
}


// Structure first view...
struct NavView: View {
    
// change color font NavigationBar...
    init() {
        
        // change is with .large
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.orange]
        
        //change is with .inline
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
        
        UINavigationBar.appearance().barTintColor = .orange
        
    
            }
    
    var body: some View {
        VStack {
            NavigationView{
                VStack {
                    NavigationLink(destination:
                                    DetailRussianView(),
                                   label: {
                                    Text("Russian")
                                        .font(.system(size: 24))
                                        .padding(.bottom, 30)
                                        .padding(.top, 100)
                                   })
                    NavigationLink(destination:
                                    DetailBelarusView(),
                                   label: {
                                    Text("Belarus")
                                        .font(.system(size: 24))
                                        .padding(.bottom, 30)
                                   })
                    NavigationLink(destination:
                                    DetailKazakhstanView(),
                                   label: {
                                    Text("Kazakhstan")
                                        .font(.system(size: 24))
                                        .padding(.bottom, 30)
                                   })
                        .navigationBarTitle("CarCode")
                        .navigationBarItems(trailing:
                                                HStack{
                                                    Button(action: {
                                                        print("press info")
                                                    }, label: {
                                                        Image(systemName: "info.circle")
                                                    })
                                                })
                    Spacer()
                    Text("Copyright © 2020")
                        .font(.system(size: 12))
                        .foregroundColor(Color(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)))
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
