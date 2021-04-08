//
//  MidView.swift
//  WeatherForecast
//
//  Created by Palash Roy on 3/16/20.
//  Copyright © 2020 Palash Roy. All rights reserved.
//

import SwiftUI

struct MidView: View {
    @ObservedObject var currentViewModel: CurrentViewModel
     @State private var favoriteColor = 0
    var body: some View {
        
        VStack {
            HStack {
            VStack(alignment: .leading) {
                Text("\(currentViewModel.city),  \(currentViewModel.country)")
                    .font(.largeTitle)
                    .fontWeight(.light)
                    .foregroundColor(.white)
                Text("\(currentViewModel.currentDate)")
                    .foregroundColor(Color(.white))
                    .fontWeight(.semibold)
            }
            //.padding(.leading, -150)
             Spacer()
                VStack {
                        Picker(selection: $favoriteColor, label: Text("")) {
                            Text("Metric").tag(0)
                            Text("Imperial").tag(1)
                        }.pickerStyle(SegmentedPickerStyle())
                            .frame(width: 150)
                            .colorMultiply(Color("segment"))
                            .colorInvert()

                        //Text("Value: \(favoriteColor)")
                    }
            }.padding(.horizontal,10)
                
            
            Spacer()
        }
        
        
        
    }
}

struct MidView_Previews: PreviewProvider {
    static var previews: some View {
        MidView(currentViewModel: CurrentViewModel())
    }
}
