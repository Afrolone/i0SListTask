//
//  ShoppingItemDetailView.swift
//  iOSListTask
//
//  Created by Jahja Muratovic on 3. 2. 2024..
//

import SwiftUI

struct ShoppingItemDetailView: View {
    @StateObject var viewModel: ShoppingListViewModel
    @Environment(\.presentationMode) var presentationMode
    @FocusState var focusField: ShoppingField?
    @State private var showingAlert = false
    
    var body: some View {
        VStack {
            Spacer()
            nameInput
            amountInput
            HStack {
                saveButton
                Spacer()
                    .frame(width: NumberConstants.buttonInline)
                deleteButton
            }.padding()
            Spacer()
        }
        .background(
            Color
                .white
                .onTapGesture {
                    focusField = nil
                }
        )
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: backButton)
        .alert(isPresented:$showingAlert) {
            deletionAlert
        }
        .overlay(conditionalLoaderView)
    }
    
    var nameInput: some View {
        TextField(
            Constants.name,
            text: $viewModel.itemName
        )
        .focused($focusField, equals: .name)
        .onSubmit { handleFocus() }
        .textInputAutocapitalization(.never)
        .disableAutocorrection(true)
        .textFieldStyle(.roundedBorder)
        .padding()
        .background(Color.white)
        .onTapGesture {
            focusField = .name
        }
    }
    
    
    var amountInput: some View {
        TextField(
            Constants.amount,
            value: $viewModel.amount,
            format: .number
        )
        .focused($focusField, equals: .amount)
        .onSubmit { handleFocus() }
        .keyboardType(.numberPad)
        .disableAutocorrection(true)
        .textFieldStyle(.roundedBorder)
        .padding()
        .background(Color.white)
        .onTapGesture {
            focusField = .amount
        }
    }
    
    var backButton: some View {
        Button(action : {
            if viewModel.changesPresent {
                showingAlert = true
            } else {
                goBack()
            }
        }){
            HStack {
                Image(systemName:"chevron.left")
                Text(Constants.back)
                    .font(.body)
            }
        }
    }
    
    var saveButton: some View {
        Button(Constants.save) {
            if viewModel.areFieldsEmpty { return }
            viewModel.save()
            goBack()
        }
    }
    
    var deleteButton: some View {
        Button(Constants.delete, role: .destructive) {
            viewModel.delete()
            goBack()
        }
        .opacity(viewModel.hideDeleteButton ? 0.0 : 1.0)
    }
    
    var deletionAlert: Alert {
        Alert(
            title: Text(Constants.sureToDiscard),
            primaryButton: .destructive(Text(Constants.yes)) {
                goBack()
            },
            secondaryButton: .cancel(Text(Constants.no))
        )
    }
    
    var conditionalLoaderView: some View {
        ProgressView()
            .scaleEffect(1.5)
            .progressViewStyle(CircularProgressViewStyle(tint: .blue))
            .opacity(viewModel.isLoading ? 1.0 : .zero)
    }
    
    func goBack() {
        presentationMode.wrappedValue.dismiss()
    }
    
    func handleFocus() {
        guard let focusField = focusField else { return }
        if focusField == .name {
            self.focusField = .amount
        }
        if focusField == .amount {
            self.focusField = nil
        }
    }
}

#Preview {
    ShoppingItemDetailView(viewModel: ShoppingListViewModel())
}
