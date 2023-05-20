//
//  Home.swift
//  Curved Custom TabBar
//
//  Created by Work Flow Dev on 20/05/2023.
//

import SwiftUI

struct Home: View {
    /// Views propreties
    @State private var activeTab: Tab = .home
    /// For Smooth Shape Sliding Effect, We're going to use matched geometry effect
    @State private var tabShapePosition: CGPoint = .zero
    @Namespace private var animation
    
    init() {
        /// Hiding TabBar due the SwiftUI iOS 16 bug
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        VStack(spacing: 0) {
            TabView(selection: $activeTab){
                ForEach(Tab.allCases, id: \.rawValue) { item in
                    Text(item.rawValue)
                        .tag(item)
                }
            }
        
            CustomTabBar()
        }
    }
    
    /// Custom Tab Bar
    /// With More Easy Costomisation
    @ViewBuilder
    func CustomTabBar(_ tint: Color = .blue, _ inactiveTint: Color = .blue) -> some View {
        /// Moving All The Remaining Tab Item's To The Bottom
        HStack(alignment: .bottom, spacing: 0) {
            ForEach(Tab.allCases, id: \.rawValue) {
                TabItem(tint: tint,
                        inactiveTint: inactiveTint,
                        tab: $0,
                        animation: animation,
                        activeTab: $activeTab,
                        position: $tabShapePosition)
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 8)
        .background(content: {
            TabShape(midPoint: tabShapePosition.x)
                .fill(.white)
                .ignoresSafeArea()
                /// Adding Blur + Shadow for shape smoothoing
                .shadow(color: tint.opacity(0.2),
                        radius: 5,
                        x: 0,
                        y: -5)
                .blur(radius: 2)
                .padding(.top, 25)
        })
        /// Adding Animation
        .animation(.interactiveSpring(response: 0.6,
                                      dampingFraction: 0.7,
                                      blendDuration: 0.7),
                   value: activeTab)
    }
}

struct TabItem: View {
    var tint: Color
    var inactiveTint: Color
    var tab: Tab
    var animation: Namespace.ID
    @Binding var activeTab: Tab
    @Binding var position: CGPoint
    
    /// Each tab item position on the screen
    @State private var tabPosition: CGPoint = .zero
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: tab.systemImage)
                .font(.title2)
                .foregroundColor(activeTab == tab ? .white : inactiveTint)
                .frame(width: activeTab == tab ? 58 : 35, height: activeTab == tab ? 58 : 35)
                .background {
                    if activeTab == tab {
                        Circle()
                            .fill(tint.gradient)
                            .matchedGeometryEffect(id: "ACTIVETAB", in: animation)
                    }
                }
            
            Text(tab.rawValue)
                .font(.caption)
                .foregroundColor(activeTab == tab ? tint : .gray)
        }
        .frame(maxWidth: .infinity)
        .contentShape(Rectangle())
        .viewPosition(completion: { rect in
            tabPosition.x = rect.midX
            
            /// Updating active tab position
            if activeTab == tab {
                position.x = rect.midX
            }
        })
        .onTapGesture {
            activeTab = tab
            withAnimation(.interactiveSpring(response: 0.6,
                                             dampingFraction: 0.7,
                                             blendDuration: 0.7)) {
                position.x = tabPosition.x
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
