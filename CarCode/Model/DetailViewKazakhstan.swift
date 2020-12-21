//
//  DetailViewKazakhstan.swift
//  CarCode
//
//  Created by Andrey Kudryavtsev on 16.12.2020.
//

import SwiftUI

// array Kazakhstan...
private let arrayKz = [
    ["Астана", "01"],
    ["Алма-Ата", "02"],
    ["Акмолинская область", "03"],
    ["Актюбинская область", "04"],
    ["Алматинская область", "05"],
    ["Атырауская область", "06"],
    ["Западно-Казахстанская область", "07"],
    ["Жамбылская область", "08"],
    ["Карагандинская область", "09"],
    ["Костанайская область", "10"],
    ["Кызылординская область", "11"],
    ["Мангистауская область", "12"],
    ["Южно-Казахстанская область", "13"],
    ["Павлодарская область", "14"],
    ["Северо-Казахстанская область", "15"],
    ["Восточно-Казахстанская область", "16"],
]

// structure view Kazakhstan...
struct DetailKazakhstanView: View {
    
    // text filter...
    @State private var textSearch = ""
    
    @ObservedObject var progSettings = MySettings()
    
    var body: some View {
        VStack {
            TextField("Enter code or name", text: $textSearch)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            Spacer()
            if self.progSettings.typeTable == 1 {
            // view one table line...
            List {
                if !self.textSearch.isEmpty {
                    ForEach(arrayKz.filter { $0[0].localizedLowercase.contains(textSearch.localizedLowercase) || $0[1].localizedLowercase.contains(textSearch.localizedLowercase)}, id: \.self) { indexRow in
                        VStack(alignment: .leading){
                            Text(indexRow[0])
                                .bold()
                                .multilineTextAlignment(.leading)
                            Text(indexRow[1])
                                .foregroundColor(Color(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)))
                                .multilineTextAlignment(.leading)
                        }
                    }
                } else {
                    ForEach(arrayKz, id: \.self) { indexRow in
                        VStack(alignment: .leading){
                            Text(indexRow[0])
                                .bold()
                                .multilineTextAlignment(.leading)
                            Text(indexRow[1])
                                .foregroundColor(Color(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)))
                                .multilineTextAlignment(.leading)
                        }
                    }
                }
            }
            .navigationBarTitle("Kazakhstan", displayMode: .large)
            // view two table line...
            } else {
                List {
                    if !self.textSearch.isEmpty {
                        ForEach(arrayKz.filter { $0[0].localizedLowercase.contains(textSearch.localizedLowercase) || $0[1].localizedLowercase.contains(textSearch.localizedLowercase)}, id: \.self) { indexRow in
                            HStack{
                                Text(indexRow[0])
                                    .bold()
                                    .multilineTextAlignment(.leading)
                                Text(indexRow[1])
                                    .foregroundColor(Color(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)))
                                    .multilineTextAlignment(.leading)
                            }
                        }
                    } else {
                        ForEach(arrayKz, id: \.self) { indexRow in
                            HStack{
                                Text(indexRow[0])
                                    .bold()
                                    .multilineTextAlignment(.leading)
                                Text(indexRow[1])
                                    .foregroundColor(Color(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)))
                                    .multilineTextAlignment(.leading)
                            }
                        }
                    }
                }
                .navigationBarTitle("Kazakhstan", displayMode: .large)
            }
    }
}
}

struct DetailViewKazakhstan_Previews: PreviewProvider {
    static var previews: some View {
        DetailKazakhstanView()
    }
}
