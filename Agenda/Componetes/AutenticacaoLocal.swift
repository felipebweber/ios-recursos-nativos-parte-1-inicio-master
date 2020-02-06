//
//  AutenticacaoLocal.swift
//  Agenda
//
//  Created by Felipe Weber on 04/02/20.
//  Copyright © 2020 Alura. All rights reserved.
//

import UIKit
import LocalAuthentication

class AutenticacaoLocal: NSObject {
    
    var error: NSError?

    func autorizaUsuario(completion: @escaping(_ autenticado: Bool) -> Void){
        let contexto = LAContext()
        if contexto.canEvaluatePolicy(.deviceOwnerAuthentication, error: &error){
            contexto.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: "é necessário autenticação para apagar um aluno") { (resposta, error) in
                completion(resposta)
            }
        }
    }
}
