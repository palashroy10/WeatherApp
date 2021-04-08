//
//  ContentView.swift
//  WeatherForecast
//
//  Created by Palash Roy on 3/15/20.
//  Copyright © 2020 Palash Roy. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var currentViewModel: CurrentViewModel = CurrentViewModel()
    @ObservedObject var forecastViewModel: ForecastViewModel = ForecastViewModel()
    
    var body: some View {
        ZStack { BackSplash().edgesIgnoringSafeArea(.all)
            VStack {
                TopView(currentViewModel: currentViewModel, forecastViewModel: forecastViewModel)
                MidView(currentViewModel: currentViewModel)
                
            }.onAppear(perform: fetchDetails)
            VStack(alignment: .center, spacing: 20) {
                CurrentTempView(currentViewModel: currentViewModel)
                //Text("\(forecastViewModel.cityName)")
                VStack(alignment: .leading, spacing: 10) {
                    BottomScroller(forecastViewModel: forecastViewModel)
                }
                
            }.onAppear(perform: fetchForecastdetails)
            
        }
    }
    
    private func fetchDetails(){
        self.currentViewModel.serachCity()
    }
    
    private func fetchForecastdetails(){
        self.forecastViewModel.serachCity()
    }
}


// 
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
