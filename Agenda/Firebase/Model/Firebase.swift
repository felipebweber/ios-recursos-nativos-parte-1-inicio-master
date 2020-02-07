//
//  Firebase.swift
//  Agenda
//
//  Created by Felipe Weber on 07/02/20.
//  Copyright © 2020 Alura. All rights reserved.
//

import UIKit
import Alamofire

class Firebase: NSObject {

    func enviaTokenParaServidor(token: String){
        
        guard let url = Configuracao().getUrlPadrao() else { return }
        
        Alamofire.request(url + "api/firebase/dispositivo", method: .post, headers: ["token": token]).responseData { (response) in
            if response.error == nil {
                print("Tokem enviado com sucesso")
            }else{
                print("Error")
                print(response.error!)
            }
        }
    }
}
