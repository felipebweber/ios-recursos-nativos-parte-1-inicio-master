//
//  AlunoAPI.swift
//  Agenda
//
//  Created by Felipe Weber on 04/02/20.
//  Copyright © 2020 Alura. All rights reserved.
//

import UIKit
import Alamofire

class AlunoAPI: NSObject {
    
    func salvaAlunosNoServico(paramentros: Array<Dictionary<String, String>>){
        guard let url = URL(string: "http://localhost:8080/api/aluno/lista") else { return }
        var requisicao = URLRequest(url: url)
        requisicao.httpMethod = "PUT"
        let json = try! JSONSerialization.data(withJSONObject: paramentros, options:[])
        requisicao.httpBody = json
        requisicao.addValue("application/json", forHTTPHeaderField: "Content-Type")
        Alamofire.request(requisicao)
    }
}
