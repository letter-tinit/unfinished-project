//
// Created by Treasure Letter ♥
//
// https://github.com/tinit4ever
//

import SwiftUI

struct CartView: View {
  // MARK: - PROPERTY
  private var width = UIScreen.main.bounds.width
  @State private var isDeleteButtonClicked: Bool = false
  @State private var isSelected: Bool = false
  
  // MARK: - BODY
  
  var body: some View {
    VStack(spacing: 20) {
      HeaderView(title: Strings.CartView.cart)
        .padding(.horizontal)
        .padding(.top)
        .shadow(color: .colorBlack.opacity(0.6), radius: 4, x: 2, y: 2)
      
      ScrollView(.vertical) {
        ForEach(0...3, id: \.self) { _ in
          OrderButtonView(isDeleteButtonClicked: $isDeleteButtonClicked, isSelected: $isSelected)
            .padding(.vertical, 6)
        }
        .padding(10)
      }
      .alert(isPresented: $isDeleteButtonClicked) {
        Alert(
          title: Text(Strings.CartView.remind),
          primaryButton: .default(
            Text(Strings.Common.confirm), action: {
              print("Deleting")
            }
          ),
          secondaryButton: .destructive(
            Text(Strings.Common.cancel), action: {
              print("Cancelled")
            }
          )
        )
      }
      
      VStack {
        ZStack(alignment: .leading) {
          Color.colorBlue
          
          VStack {
            Spacer()
            Color.colorWhite.opacity(0.3)
              .frame(height: 35)
          }
          
          VStack {
            VStack(alignment: .leading, spacing: 5) {
              ResultRowView(title: "\(Strings.CartView.subTotal):", content: "930.000 VND")
              ResultRowView(title: "\(Strings.CartView.discount):", content: "15%")
              ResultRowView(title: "\(Strings.CartView.promocode):", content: "-----")
            }
            
            Spacer()
            
            ResultRowView(title: "\(Strings.CartView.total):", content: "790.500 VND")
          }
          .padding(.horizontal, 20)
          .padding(.vertical, 10)
        }
        .clipped()
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .frame(width: width - 60, height: 120)
        
        Button {
          
        } label: {
          ZStack {
            RoundedRectangle(cornerRadius: 8)
            
            Text(Strings.CartView.payment)
              .foregroundStyle(.colorWhite)
              .font(.system(size: 20, weight: .semibold, design: .rounded))
          }
        }
        .foregroundStyle(.yellow)
        .frame(width: width - 60, height: 40)
      }
      
      Spacer(minLength: 80)
    }
  }
}

// MARK: PREVIEW
#Preview {
  CartView()
}
//"
