//
// Created by Treasure Letter ♥
//
// https://github.com/tinit4ever
//

import SwiftUI

struct OrderButtonView: View {
  // MARK: - PROPERTY
  var width = UIScreen.main.bounds.width
  
  @State private var isSwiping: Bool = false
  @State private var offSet = 0.0
  @Binding var isDeleteButtonClicked: Bool
  @Binding var isSelected: Bool
  
  // MARK: - BODY
  
  var body: some View {
    ZStack {
      Color.yellow
      
      HStack(alignment: .center) {
        Spacer()
        
        Button {
          withAnimation(.easeInOut(duration: 0.2)) {
            offSet = 0.0
          }
          isDeleteButtonClicked.toggle()
        } label: {
          VStack(alignment: .center) {
            Image(systemName: "trash")
              .resizable()
              .scaledToFit()
              .fontWeight(.bold)
              .frame(width: 25, height: 25)
            
            Text("Xoá")
              .font(.system(size: 16, weight: .medium ,design: .rounded))
          }
          .padding(.trailing, 25)
        }
      }
      .foregroundStyle(.colorWhite)
      
      ZStack {
        Color.colorWhite
        
        HStack(spacing: 10) {
          Image("toy")
            .resizable()
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .frame(width: 70, height: 70)
            .padding(.leading, 10)
            .shadow(color: .colorBlack.opacity(0.6), radius: 2, x: 1, y: 1)
          
          VStack(alignment: .leading, spacing: 4) {
            Text("Khoá Học Vỡ Nòng")
              .foregroundStyle(.colorBlack)
              .font(.system(size: 15, weight: .medium, design: .rounded))
            
            Text("của Bác Sĩ Táo")
              .foregroundStyle(.secondary)
              .font(.system(size: 10, weight: .regular, design: .rounded))
            
            Text("17 Tiếng")
              .foregroundStyle(.colorBlack)
              .font(.system(size: 11, weight: .light, design: .rounded))
            
            Text("230.000 vnđ")
              .foregroundStyle(.colorBlue)
              .font(.system(size: 12, weight: .medium, design: .rounded))
            
          }
          .frame(width: 185, alignment: .leading)
          .padding(.vertical)
          
          Spacer()
        }
      }
      .frame(width: width - 60, height: 90)
      .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
      .shadow(color: .colorBlack.opacity(0.6), radius: 4, x: 2, y: 2)
      .overlay(alignment: .topTrailing) {
        CustomCheckBoxView(isChecked: .constant(true))
          .padding(10)
      }
      .overlay(alignment: .bottomTrailing) {
        HStack(alignment: .center, spacing: 4) {
          Image(systemName: "star.fill")
            .foregroundStyle(.yellow)
          
          Text("(3.007)")
            .foregroundStyle(.secondary)
            .fontDesign(.rounded)
        }
        .font(.caption)
        .padding(10)
      }
      .offset(x: offSet)
      .gesture(
        DragGesture()
          .onChanged { value in
            if -value.translation.width > 10 && -value.translation.width <= 100 {
              withAnimation(.easeInOut(duration: 0.2)) {
                offSet = value.translation.width
              }
            }
          }
          .onEnded({ value in
            if -value.translation.width >= 80 {
              withAnimation(.easeInOut(duration: 0.2)) {
                offSet = -80
                isSwiping = true
              }
            } else {
              withAnimation(.easeInOut(duration: 0.2)) {
                offSet = 0
                isSwiping = false
              }
            }
          })
      )
    }
    .frame(width: width - 60, height: 90)
    .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
    .padding(.horizontal)
    .shadow(color: .colorBlack.opacity(0.6), radius: 4, x: 2, y: 2)
  }
}

// MARK: PREVIEW
#Preview {
  OrderButtonView(isDeleteButtonClicked: .constant(false), isSelected: .constant(true))
}
