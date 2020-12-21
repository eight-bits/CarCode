//
//  DetailViewRussian.swift
//  CarCode
//
//  Created by Andrey Kudryavtsev on 16.12.2020.
//

import SwiftUI

// array Russia...
private let arrayRu = [
    ["Республика Адыгея", "01"],
    ["Республика Башкортостан", "02, 102, 702"],
    ["Республика Бурятия", "03"],
    ["Республика Алтай", "04"],
    ["Республика Дагестан", "05"],
    ["Республика Ингушетия", "06"],
    ["Кабардино-Балкарская Республика", "07"],
    ["Республика Калмыкия", "08"],
    ["Республика Карачаево-Черкесия", "09"],
    ["Республика Карелия", "10"],
    ["Республика Коми", "11"],
    ["Республика Марий Эл", "12"],
    ["Республика Мордовия", "13, 113"],
    ["Республика Саха (Якутия)", "14"],
    ["Республика Северная Осетия — Алания", "15"],
    ["Республика Татарстан", "16, 116, 716"],
    ["Республика Тыва", "17"],
    ["Удмуртская Республика", "18"],
    ["Республика Хакасия", "19"],
    ["Чувашская Республика", "21, 121"],
    ["Алтайский край", "22, 122"],
    ["Краснодарский край", "23, 93, 123, 193"],
    ["Красноярский край", "24, 84, 88, 124"],
    ["Приморский край", "25, 125"],
    ["Ставропольский край", "26, 126"],
    ["Хабаровский край", "27, 127"],
    ["Амурская область", "28"],
    ["Архангельская область", "29"],
    ["Астраханская область", "30"],
    ["Белгородская область", "31"],
    ["Брянская область", "32"],
    ["Владимирская область", "33"],
    ["Волгоградская область", "34, 134"],
    ["Вологодская область", "35"],
    ["Воронежская область", "36, 136"],
    ["Ивановская область", "37"],
    ["Иркутская область", "38, 85, 138"],
    ["Калининградская область", "39, 91"],
    ["Калужская область", "40"],
    ["Камчатский край", "41, 82"],
    ["Кемеровская область", "42, 142"],
    ["Кировская область", "43"],
    ["Костромская область", "44"],
    ["Курганская область", "45"],
    ["Курская область", "46"],
    ["Ленинградская область", "47, 147"],
    ["Липецкая область", "48"],
    ["Магаданская область", "49"],
    ["Московская область", "50, 90, 150, 190, 750, 790"],
    ["Мурманская область", "51"],
    ["Нижегородская область", "52, 152"],
    ["Новгородская область", "53"],
    ["Новосибирская область", "54, 154"],
    ["Омская область", "55"],
    ["Оренбургская область", "56, 156"],
    ["Орловская область", "57"],
    ["Пензенская область", "58"],
    ["Пермский край", "59, 81, 159"],
    ["Псковская область", "60"],
    ["Ростовская область", "61, 161, 761"],
    ["Рязанская область", "62"],
    ["Самарская область", "63, 163, 763"],
    ["Саратовская область", "64, 164"],
    ["Сахалинская область", "65"],
    ["Свердловская область", "66, 96, 196"],
    ["Смоленская область", "67"],
    ["Тамбовская область", "68"],
    ["Тверская область", "69, 169"],
    ["Томская область", "70"],
    ["Тульская область", "71"],
    ["Тюменская область", "72"],
    ["Ульяновская область", "73, 173"],
    ["Челябинская область", "74, 174, 774"],
    ["Забайкальский край", "75, 80"],
    ["Ярославская область", "76"],
    ["Москва", "77, 97, 99, 177, 199, 197, 777, 797, 799"],
    ["Санкт-Петербург", "78, 98, 178, 198"],
    ["Еврейская автономная область", "79"],
    ["Республика Крым", "82"],
    ["Ненецкий автономный округ", "83"],
    ["Ханты-Мансийский автономный округ", "86, 186"],
    ["Чукотский автономный округ", "87"],
    ["Ямало-Ненецкий автономный округ", "89"],
    ["Севастополь", "92"],
    ["Байконур", "94"],
    ["Чеченская республика", "20, 95"],
]

// structure view Russian...
struct DetailRussianView: View {
    
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
                    ForEach(arrayRu.filter { $0[0].localizedLowercase.contains(textSearch.localizedLowercase) || $0[1].localizedLowercase.contains(textSearch.localizedLowercase)}, id: \.self) { indexRow in
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
                    ForEach(arrayRu, id: \.self) { indexRow in
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
            .navigationBarTitle("Russia", displayMode: .large)
            // view two table line...
            } else {
                List {
                    if !self.textSearch.isEmpty {
                        ForEach(arrayRu.filter { $0[0].localizedLowercase.contains(textSearch.localizedLowercase) || $0[1].localizedLowercase.contains(textSearch.localizedLowercase)}, id: \.self) { indexRow in
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
                        ForEach(arrayRu, id: \.self) { indexRow in
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
                .navigationBarTitle("Russia", displayMode: .large)
            }
        }
    }
}

struct DetailViewRussian_Previews: PreviewProvider {
    static var previews: some View {
        DetailRussianView()
    }
}
