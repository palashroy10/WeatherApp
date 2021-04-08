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
    var body: some View {
        
        VStack {
            
            VStack(alignment: .leading) {
                Text("\(currentViewModel.city),  \(currentViewModel.country)")
                    .font(.largeTitle)
                    .fontWeight(.light)
                    .foregroundColor(.white)
                Text("\(currentViewModel.currentDate)")
                    .foregroundColor(Color(.white))
                    .fontWeight(.semibold)
            }
            .padding(.leading, -175)
                
            Spacer()
        }
        
        
        
    }
}

struct MidView_Previews: PreviewProvider {
    static var previews: some View {
        MidView(currentViewModel: CurrentViewModel())
    }
}
