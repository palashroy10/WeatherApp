//
//  TopView.swift
//  WeatherForecast
//
//  Created by Palash Roy on 3/15/20.
//  Copyright © 2020 Palash Roy. All rights reserved.
//

import SwiftUI
let width = UIScreen.main.bounds.size.width
struct TopView: View {
   @ObservedObject var currentViewModel: CurrentViewModel
    @ObservedObject var forecastViewModel: ForecastViewModel
    @State var showField: Bool = true
    var body: some View {
        HStack(alignment:(.center)) {
            ///TextFeild
            TextField("Enter City Name:", text: self.$currentViewModel.cityName) {
                self.currentViewModel.serachCity()
                self.forecastViewModel.cityName = self.currentViewModel.cityName
                self.forecastViewModel.serachCity()
            }
            .frame(width: 300, height: 50)
            .padding(.leading, 15)
            .background(self.showField ? Color(.clear) : Color("lightBlue"))
            
            .foregroundColor(Color(.white))
            ///image search
            Image(systemName: "magnifyingglass.circle.fill")
            .resizable()
                .background(Color("lightBlue"))
                .frame(width: 40, height: 40)
                .foregroundColor(Color(.white))
                .animation(.spring())
            .cornerRadius(20)
                .onTapGesture {
                    self.showField.toggle()
            }
        }
        .background(self.showField ? Color(.clear) : Color("lightBlue"))
        .cornerRadius(25)
            .animation(.spring())
            .offset(x: self.showField ? 75 - width : 0)
    }
}

struct TopView_Previews: PreviewProvider {
    static var previews: some View {
        TopView(currentViewModel: CurrentViewModel(), forecastViewModel: Fore)
    }
}

