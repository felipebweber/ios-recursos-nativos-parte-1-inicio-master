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
    
    //MARK: - GET
    func recuperaAlunos(completion: @escaping() -> Void){
        
        guard let url = Configuracao().getUrlPadrao() else { return }
        
        Alamofire.request(url + "api/aluno", method: .get).responseJSON { (response) in
            switch response.result{
            case .success:
                if let resposta = response.result.value as? Dictionary<String, Any>{
                    guard let listaDeAlunos = resposta["alunos"] as? Array<Dictionary<String, Any>>  else { return }
                    for dicionarioDeAluno in listaDeAlunos{
                        AlunoDAO().salvaAluno(dicionarioDeAluno: dicionarioDeAluno)
                    }
                    completion()
                }
                break
            case .failure:
                print(response.error)
                completion()
                break
            }
        }
    }
    
    
    //MARK: - PUT
    func salvaAlunosNoServico(paramentros: Array<Dictionary<String, String>>){
        
        guard let urlPadrao = Configuracao().getUrlPadrao() else { return }
        
        guard let url = URL(string: urlPadrao + "api/aluno/lista") else { return }
        var requisicao = URLRequest(url: url)
        requisicao.httpMethod = "PUT"
        let json = try! JSONSerialization.data(withJSONObject: paramentros, options:[])
        requisicao.httpBody = json
        requisicao.addValue("application/json", forHTTPHeaderField: "Content-Type")
        Alamofire.request(requisicao)
    }
    
    //MARK: - DELETE
    func deletaAluno(id: String){
        guard let url = Configuracao().getUrlPadrao() else { return }
        
        Alamofire.request(url + "api/aluno/\(id)", method: .delete).responseJSON { (resposta) in
            switch resposta.result{
            case .failure:
                print(resposta.result.error!)
                break
            default:
                break
            }
        }
    }
}
