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
    
    // status show alert...
    @State private var showAlert = false
    
    // status show settings
    @State private var showSettings = false
    
    @State private var showDark = false
    
    // change color font NavigationBar...
    init() {
        // change is with .large...
        //UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.orange]
        // change is with .inline...
        //UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
        
        // change background color navigationbar type .inline...
        //UINavigationBar.appearance().barTintColor = .orange
        // change background color navigationbar type .large...
        //UINavigationBar.appearance().backgroundColor = .white
        
        UINavigationBar.appearance().tintColor = .white
        //UINavigationBar.appearance()
        let coloredAppearance = UINavigationBarAppearance()
        coloredAppearance.backgroundColor = .purple
        coloredAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        coloredAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        UINavigationBar.appearance().standardAppearance = coloredAppearance
        UINavigationBar.appearance().compactAppearance = coloredAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
    }
    
    var body: some View {
        VStack {
            NavigationView{
                VStack {
                    Image("flags")
                        .clipShape(Circle())
                        .shadow(radius: 5.5)
                        .overlay(RoundedRectangle(cornerRadius: 42) .stroke(Color.orange, lineWidth: 3))
                        .padding(.top, 15)
                    NavigationLink(destination:
                                    DetailRussianView(),
                                   label: {
                                    Text("Russia")
                                        .font(.system(size: 24))
                                        .padding(.bottom, 20)
                                        .padding(.top, 20)
                                   })
                    NavigationLink(destination:
                                    DetailBelarusView(),
                                   label: {
                                    Text("Belarus")
                                        .font(.system(size: 24))
                                        .padding(.bottom, 20)
                                   })
                    NavigationLink(destination:
                                    DetailViewUkraine(),
                                   label: {
                                    Text("Ukraine")
                                        .font(.system(size: 24))
                                        .padding(.bottom, 20)
                                   })
                    NavigationLink(destination:
                                    DetailKazakhstanView(),
                                   label: {
                                    Text("Kazakhstan")
                                        .font(.system(size: 24))
                                        .padding(.bottom, 20)
                                   })
                        .navigationBarTitle("CarCode")
                        .navigationBarItems(leading:(
                            Toggle(isOn: $showDark, label: {
                                Text("Dark theme")
                                    .foregroundColor(Color.white)
                            })
                            .toggleStyle(SwitchToggleStyle(tint: .yellow))
                        ),
                        trailing:(
                            Button(action: {self.showAlert = true},
                                   label: {
                                    Image(systemName: "info.circle")
                                        .font(.system(size: 24))
                                   }
                            )
                            .alert(isPresented: $showAlert, content: {
                                Alert(title: Text("About"), message: Text("CarCode - Version 2.0.0\nXcode - Version 12.5.1 (12E507)\nSwift - 5.3\nFramework - SwiftUI\nCopyright © 2021 Andrey Kudryavtsev"), dismissButton: .default(Text("Ok")))
                            })
                        )
                        )
                    Spacer()
                    Text("Copyright © 2021")
                        .font(.system(size: 12))
                        .foregroundColor(Color(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)))
                }
            }
        }
        .colorScheme(showDark ? .dark : .light)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
