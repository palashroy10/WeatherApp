//
//  CurrentTempView.swift
//  WeatherForecast
//
//  Created by Palash Roy on 3/16/20.
//  Copyright © 2020 Palash Roy. All rights reserved.
//

import SwiftUI

struct CurrentTempView: View {
    @ObservedObject var currentViewModel: CurrentViewModel
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            Image(systemName: Helper.showWeatherIcon(item: self.currentViewModel.weather))
                .resizable()
                .foregroundColor(.white)
                .frame(width: 200, height: 200, alignment: .center)
            
            HStack{
                Text("\(self.currentViewModel.temparature)")
                .foregroundColor(Color(.white))
                .font(.system(size: 40))
                .bold()
                
                Text("\(self.currentViewModel.description)")
                .foregroundColor(Color("secondary"))
            }
            
            HStack {
                VStack {
                Text("\(self.currentViewModel.wind)").foregroundColor(Color("secondary"))//Wind
                    .fontWeight(.heavy)
                    Text("Wind").foregroundColor(Color("secondary"))
                }
                VStack {
                    Text("\(self.currentViewModel.humidity)%")//Humidity
                    .foregroundColor(Color("secondary"))//Wind
                    .fontWeight(.heavy)
                    Text("Humidity").foregroundColor(Color("secondary"))
                }
                VStack {
                    Text("\(self.currentViewModel.maxTemp)")//Wind
                    .foregroundColor(Color("secondary"))//Wind
                    .fontWeight(.heavy)
                    Text("Max").foregroundColor(Color("secondary"))
                }
            }
            
            Text("7-Day Forecast")
            .foregroundColor(.white)
            .bold()
            .fontWeight(.light)
        }
    }
}

struct CurrentTempView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentTempView(currentViewModel: CurrentViewModel())
    }
}
