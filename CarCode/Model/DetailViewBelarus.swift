//
//  DetailViewBelarus.swift
//  CarCode
//
//  Created by Andrey Kudryavtsev on 16.12.2020.
//

import SwiftUI

// array Belarus...
private let arrayBy = [
    ["Вооружённые Силы", "0"],
    ["Брестская область", "1"],
    ["Витебская область", "2"],
    ["Гомельская область", "3"],
    ["Гродненская область", "4"],
    ["Минская область", "5"],
    ["Могилёвская область", "6"],
    ["Минск", "7"],
    ["Минский автомобильный завод", "8"],
]

// structure view Balarus...
struct DetailBelarusView: View {
    
    // text filter...
    @State private var textSearch = ""
    
    var body: some View {
        VStack {
            TextField("Enter code or name", text: $textSearch)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            Spacer()
            List {
                if !self.textSearch.isEmpty {
                    ForEach(arrayBy.filter { $0[0].localizedLowercase.contains(textSearch.localizedLowercase) || $0[1].localizedLowercase.contains(textSearch.localizedLowercase)}, id: \.self) { indexRow in
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
                    ForEach(arrayBy, id: \.self) { indexRow in
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
            .navigationBarTitle("Belarus", displayMode: .inline)
        }
    }
}


struct DetailViewBelarus_Previews: PreviewProvider {
    static var previews: some View {
        DetailBelarusView()
    }
}
