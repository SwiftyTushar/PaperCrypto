//
//  TradesView.swift
//  PaperCrypto
//
//  Created by Tushar Patil on 02/02/24.
//

import SwiftUI

struct TradesView: View {
    @State private var selectedTab:Int = 0
    var body: some View {
        
        VStack{
            TradesHeaderView()

            Picker("", selection: $selectedTab) {
                Text("Positions").tag(0)
                Text("History").tag(1)
            }
            .pickerStyle(.segmented)
            .padding(.horizontal,20)
            if selectedTab == 1{
                TradeHistoryView()
            } else {
                CurrentPositionView()
            }
            Spacer()
        }
    }
}

struct TradesView_Previews: PreviewProvider {
    static var previews: some View {
        TradesView()
    }
}
