//
//  DetailViewKazakhstan.swift
//  CarCode
//
//  Created by Andrey Kudryavtsev on 16.12.2020.
//

import SwiftUI

// array Kazakhstan
let arrayKz = [
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
    
    @State private var textSearch = ""
    
    var body: some View {
        VStack {
            TextField("Enter code or region", text: $textSearch)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            Spacer()
            List {
                ForEach(arrayKz, id: \.self) { indexRow in
                    HStack{
                        Text(indexRow[0])
                            .bold()
                            .foregroundColor(Color.black)
                            .multilineTextAlignment(.leading)
                        Text(indexRow[1])
                            .foregroundColor(Color(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)))
                            .multilineTextAlignment(.leading)
                    }
                }
                .navigationBarTitle("Kazakhstan", displayMode: .inline)
                
                .listRowBackground(Color.white)
            }
        }
    }
}

struct DetailViewKazakhstan_Previews: PreviewProvider {
    static var previews: some View {
        DetailKazakhstanView()
    }
}
