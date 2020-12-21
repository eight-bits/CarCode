//
//  Settings.swift
//  CarCode
//
//  Created by Andrey Kudryavtsev on 20.12.2020.
//

import SwiftUI

// class settings
class MySettings: ObservableObject {
    
    @Published var themes = UserDefaults.standard.bool(forKey: "theme")
    
    @Published var typeTable = UserDefaults.standard.integer(forKey: "typeTable")
    
}

struct Param: View {
    
    // array themes items
    let arrayTheme = ["Light", "Dark"]
    // array typeTable
    let arrayTypeTable = ["In one line", "In two lines"]
        
    @ObservedObject var progSettings = MySettings()
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Choose a theme")) {
                    HStack {
                    Image(systemName: "moon")
                        Toggle(isOn : self.$progSettings.themes, label: {
                        Text("Dark Mode")
                    })
                    }
                }
                Section(header: Text("Kind of table")) {
                    VStack {
                        HStack {
                            Image(systemName: "rectangle.split.2x1")
                            Spacer()
                            Image(systemName: "rectangle.split.1x2")
                        }
                        Picker("Kind of table", selection: self.$progSettings.typeTable) {
                            ForEach(0..<self.arrayTypeTable.count) { index in
                                Text(self.arrayTypeTable[index])
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    Text("Program restart required")
                        .font(.system(size: 14))
                    }
                }
                Section(header: Text("Apply settings")) {
                    Button(action: {
                        UserDefaults.standard.set(self.progSettings.themes, forKey: "theme")
                        UserDefaults.standard.set(self.progSettings.typeTable, forKey: "typeTable")
                        UIApplication.shared.windows.first?.rootViewController?.overrideUserInterfaceStyle = self.progSettings.themes ? .dark : .light
                    }, label:{
                    Text("Save")
                    })
                }
            }
            .navigationBarTitle("Settings", displayMode: .inline)
            .colorScheme(self.progSettings.themes ? .dark : .light)
        }
    }
}

struct Settings: View {
    var body: some View {
        Param()
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
