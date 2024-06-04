//
// Created by Treasure Letter ♥
//
// https://github.com/tinit4ever
//

import SwiftUI
import Lottie

struct CreateProfileView: View {
  // MARK: - PROPERTY
  
  
  @State private var name: String = ""
  @State private var phoneNumber: String = ""
  @State private var dob = Date()
  @State private var gender: Gender = .male

  // MARK: - BODY
  
  var body: some View {
    VStack(alignment: .center, spacing: 30) {
      LottieView(animation: .named("profile"))
        .playing()
        .resizable()
        .scaledToFit()
//        .scaleEffect(0.9)
      // MARK: - NAME TEXTFIELD
      ZStack {
        RoundedRectangle(cornerRadius: 10)
          .stroke(.colorBlue, lineWidth: 2)
          .shadow(color: .colorBlack.opacity(0.7),radius: 4, x: 2, y: 2)
        
        TextField(Strings.Common.name, text: $name)
          .font(.system(size: 22, weight: .medium, design: .rounded))
          .padding()
          .textInputAutocapitalization(.never)
          .shadow(color: .colorBlack.opacity(0.3), radius: 3, x: 2, y: 2)
      }// PASSWORD TEXTFIELD
      .frame(width: 340, height: 60)
      
      // MARK: - NAME TEXTFIELD
      ZStack {
        RoundedRectangle(cornerRadius: 10)
          .stroke(.colorBlue, lineWidth: 2)
          .shadow(color: .colorBlack.opacity(0.7),radius: 4, x: 2, y: 2)
        
        TextField("Số điện thoại", text: $phoneNumber)
          .font(.system(size: 22, weight: .medium, design: .rounded))
          .padding()
          .textInputAutocapitalization(.never)
          .shadow(color: .colorBlack.opacity(0.3), radius: 3, x: 2, y: 2)
      }// PASSWORD TEXTFIELD
      .frame(width: 340, height: 60)
      
      // MARK: - DAYOFBIRTHINPUT
      ZStack {
        RoundedRectangle(cornerRadius: 10)
          .stroke(.colorBlue, lineWidth: 2)
          .shadow(color: .colorBlack.opacity(0.5), radius: 2, x: 2, y: 2)
        
        HStack {
          DatePicker(selection: $dob, displayedComponents: .date) {
            Text(Strings.ChildrenInformationView.dob)
              .font(.system(size: 22, weight: .medium, design: .rounded))
              .foregroundStyle(.colorBlack)
              .padding(.horizontal)
          }
          .datePickerStyle(CompactDatePickerStyle()).environment(\.locale, Locale.init(identifier: "vi"))
          .tint(.colorBlack)
          
          Spacer(minLength: 10)
        }
        
        .shadow(color: .colorBlack.opacity(0.5), radius: 8, x: 2, y: 2)
      }
      .frame(width: 340, height: 60)
      
      // MARK: - GENDERINPUT
      ZStack {
        RoundedRectangle(cornerRadius: 10)
          .stroke(.colorBlue, lineWidth: 2)
          .shadow(color: .colorBlack.opacity(0.5), radius: 2, x: 2, y: 2)
        
        HStack {
          Text(Strings.ChildrenInformationView.gender)
            .font(.system(size: 22, weight: .medium, design: .rounded))
            .foregroundStyle(.colorBlack)
            .padding(.horizontal)
          
          Spacer(minLength: 10)
          
          Picker("Gender", selection: $gender) {
            ForEach(Gender.allCases, id: \.self) { selected in
              Text(selected.localizedString())
                .foregroundStyle(.colorWhite)
            }
          }
          .pickerStyle(.menu)
          .tint(.colorBlack)
        }
        .shadow(color: .colorBlack.opacity(0.5), radius: 8, x: 2, y: 2)
      }
      .frame(width: 340, height: 60)
      
      Spacer()
      
      Button {
        
      } label: {
        ZStack {
          Capsule()
          Text("Tạo")
            .foregroundStyle(.colorWhite)
            .font(.system(size: 22, weight: .semibold, design: .rounded))
        }
        .shadow(color: .colorBlack.opacity(0.6), radius: 4, x: 2, y: 2)
        .frame(height: 50)
        .padding()
      }
    }// VSTACK TextFields
  }
}

// MARK: PREVIEW
#Preview {
  CreateProfileView()
}
