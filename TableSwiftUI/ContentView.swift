//
//  ContentView.swift
//  TableSwiftUI
//
//  Created by Zaitsev Vladislav on 11.02.2025.
//

import SwiftUI

struct ContentView: View {
    @State private var login: String = ""
    @State private var email: String = ""
    
    @State private var selectedGender = "Не указано" // Default selection
    let genders = ["Не указано", "Мужчина", "Женщина"]
    
    @State private var selectedDate = Date()
    @State private var isDateActive = false
    @State private var dateString = "Изменить дату"
    
    @State private var isNotificationsEnabled: Bool = true
    
    @State private var selectedColor: Color = .blue
    
    @State private var sliderValue: Double = 25
    
    @State private var FirstPassword: String = ""
    @State private var SecondPassword: String = ""
    
    var body: some View {
        Text("Настройки")
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(.system(size: 32, weight: .bold))
        
        List {
            Section(header: Text("Личные Данные")) {
                TextField("Login", text: $login)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .onChange(of: login) {
                        print("Login: \(login)")
                    }
                
                TextField("Email", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .onChange(of: email) {
                        print(("Email: \(email)"))
                    }
                
                Picker("Пол", selection: $selectedGender) {
                    ForEach(genders, id: \.self) {
                        Text($0)
                    }
                }
                
                HStack {
                    Text("Дата рождения")
                    
                    Button(dateString) {
                        isDateActive.toggle()
                    }
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    
                }
                
                if isDateActive {
                    DatePicker(
                        "Выберите дату",
                        selection: $selectedDate,
                        displayedComponents: [.date]
                    )
                    .datePickerStyle(.graphical)
                    .onChange(of: selectedDate) {_, newValue in
                        let dateFormatter = DateFormatter()
                        dateFormatter.dateFormat = "dd-MM-yyyy"
                        dateString = dateFormatter.string(from: newValue)
                    }
                    
                    Button("Готово") {
                        isDateActive = false
                    }
                }
            }
            
            Section("Настройки Интерфейса") {
                Toggle("Включить уведомления", isOn: $isNotificationsEnabled)
                
                ColorPicker("Выберите цвет", selection: $selectedColor)
                
                HStack {
                    Text("Контраст")
                    
                    Slider(value: $sliderValue, in: 0...100)
                }
            }

            Section("Сменить Пароль") {
                SecureField("FirstPassword", text: $FirstPassword)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .onChange(of: login) {
                        print("FirstPassword: \(FirstPassword)")
                    }
                
                SecureField("SecondPassword", text: $SecondPassword)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .onChange(of: email) {
                        print(("SecondPassword: \(SecondPassword)"))
                    }
            }
        }
        .padding(.bottom)
        
        Button("Сохранить настройки") {
            print(FirstPassword)
        }
    }
}

#Preview {
    ContentView()
}
