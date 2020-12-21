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
    
    // change color font NavigationBar...
    init() {
        // change is with .large...
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.orange]
        
        // change is with .inline...
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
        
        // change background color navigationbar onli type .inline...
        UINavigationBar.appearance().barTintColor = .orange
        
        UIApplication.shared.windows.first?.rootViewController?.overrideUserInterfaceStyle = self.progSettings.themes ? .dark : .light
    }
    
    @ObservedObject var progSettings = MySettings()
    
    var body: some View {
        VStack {
            NavigationView{
                VStack {
                    Image("flags")
                        .frame(width: 100, height: 100, alignment: .center)
                        .clipShape(Circle())
                        .padding(.top, 20)
                        .shadow(radius: 5.5)
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
                            Button(action: {
                                self.showSettings.toggle()
                            }, label: {
                                Image(systemName: "gearshape")
                                    .font(.system(size: 24))
                            }).sheet(isPresented: $showSettings) {
                                Settings()
                            }
                        ),
                        trailing:(
                            VStack {
                            Button(action: {
                                print(self.progSettings.themes)
                                print(self.progSettings.typeTable)
                                
                            }, label: {
                                Text("12")
                            })
                            Button(action: {self.showAlert = true},
                                   label: {
                                    Image(systemName: "info.circle")
                                        .font(.system(size: 24))
                                   }
                            )
                            }
                            .alert(isPresented: $showAlert, content: {
                                Alert(title: Text("About"), message: Text("CarCode - Version 2.0.0\nXcode - Version 12.3 (12C33)\nSwift - 5.3\nFramework - SwiftUI\nCopyright © 2020 Andrey Kudryavtsev"), dismissButton: .default(Text("Ok")))
                            })
                        )
                        )
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
