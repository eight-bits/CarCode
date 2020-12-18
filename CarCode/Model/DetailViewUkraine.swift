//
//  DetailViewUkraine.swift
//  CarCode
//
//  Created by Andrey Kudryavtsev on 17.12.2020.
//

import SwiftUI


// array Ukraine...
private let arrayUk = [
    ["Киев", "11 - AA, KA"],
    ["Киевская область", "10 - AI, KI"],
    ["Винницкая область", "02 - AB, KB"],
    ["Волынская ", "03 - AC, KC"],
    ["Днепропетровская область", "04 - AE, KE"],
    ["Донецкая область", "05 - AH, KH"],
    ["Житомирская область", "06 - AM, KM"],
    ["Закарпатская область", "07 - AO, KO"],
    ["Запорожская область", "08 - AP, KP"],
    ["Ивано-Франковская область", "09 - AT, KT"],
    ["Кировоградская область", "12 - BA, HA"],
    ["Луганская область", "13 - BB, HB"],
    ["Львовская область", "14 - BC, HC"],
    ["Николаевская область", "15 - BE, HE"],
    ["Одесская область", "16 - BH, HH"],
    ["Полтавская область", "17 - BI, HI"],
    ["Ровенская область", "18 - BK, HK"],
    ["Сумская область", "19 - BM, HM"],
    ["Тернопольская область", "20 - BO, HO"],
    ["Харьковская область", "21 - AX, KX"],
    ["Херсонская область", "22 - BT, HT"],
    ["Хмельницкая область", "23 - BX, HX"],
    ["Черкасская область", "24 - CA, IA"],
    ["Черниговская область", "25 - CB, IB"],
    ["Черновицкая область", "26 - CE, IE"],
]

// structure view Ukraine...
struct DetailViewUkraine: View {
    
    // text filter...
    @State private var textSearch = ""
    
    var body: some View {
        VStack {
            TextField("Enter code or name or region", text:$textSearch)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            List {
                if !self.textSearch.isEmpty {
                    ForEach(arrayUk.filter { $0[0].contains(textSearch) || $0[1].contains(textSearch)}, id: \.self) { indexRow in
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
                    ForEach(arrayUk, id: \.self) { indexRow in
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
            .navigationBarTitle("Ukraine", displayMode: .large)
        }
    }
}




struct DetailViewUkraine_Previews: PreviewProvider {
    static var previews: some View {
        DetailViewUkraine()
    }
}
