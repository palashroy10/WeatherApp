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
    @State var showField2: Bool = true
    @State private var favoriteColor = 0
    @State private var units = ["metric","imperial"]
    var something: String {
        callme()
        return ""
    }
    var lastUnit = "metric"
    
    var body: some View {
        HStack {
            HStack(alignment:(.center)) {
                ///TextFeild
                TextField("Enter City Name:", text: self.$currentViewModel.cityName) {
                    self.currentViewModel.serachCity()
                    self.forecastViewModel.cityName = self.currentViewModel.cityName
                    self.forecastViewModel.serachCity()
                }
                .frame(width: 250.0, height: 50)
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
                        self.showField2 = true
                }
            }
            .background(self.showField ? Color(.clear) : Color("lightBlue"))
            .cornerRadius(25)
                .animation(.spring())
                
                .offset(x: self.showField ? 195 - width : 70)
            
            HStack {
                Image(systemName: "gear")
                .resizable()
                    //.background(Color("lightBlue"))
                    .frame(width: 40, height: 40)
                    .foregroundColor(Color(.white))
                    .animation(.spring())
                    .rotationEffect(Angle.degrees(self.showField2 ? 0 : -360))
                .cornerRadius(20)
                    .onTapGesture {
                        self.showField2.toggle()
                        self.showField = true
                }
                VStack {
                    Picker(selection: $favoriteColor, label: Text(something)) {
                        Text("Metric").tag(0)
                        Text("Imperial").tag(1)
                        
                    }.pickerStyle(SegmentedPickerStyle())
                        .frame(width: 150)
                        .colorMultiply(Color("segment"))
                        .colorInvert()
                    }
                
                
            }.animation(.spring())
             .offset(x: self.showField2 ?  85 :  -80)
        }
        
    }
    
    func callme() {
        if forecastViewModel.unit != units[favoriteColor] {
            forecastViewModel.unit = units[favoriteColor]
            currentViewModel.unit = units[favoriteColor]
            //lastUnit = units[favoriteColor]
            currentViewModel.serachCity()
            forecastViewModel.serachCity()
        }
    }
}

struct TopView_Previews: PreviewProvider {
    static var previews: some View {
        TopView(currentViewModel: CurrentViewModel(), forecastViewModel: ForecastViewModel()).background(Color(.blue))
    }
}

