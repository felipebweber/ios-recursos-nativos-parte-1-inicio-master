//
//  CalculaMediaAPI.swift
//  Agenda
//
//  Created by Felipe Weber on 03/02/20.
//  Copyright © 2020 Alura. All rights reserved.
//

import UIKit

class CalculaMediaAPI: NSObject {

    func calculaMediaGeralDosAlunos(alunos: Array<Aluno>, sucesso:@escaping(_ dicionarioDeMedias: Dictionary<String, Any>)-> Void, falha:@escaping(_ error: Error)-> Void){
        
        guard let url = URL(string: "https://www.caelum.com.br/mobile") else { return }
        
        var listaDeAluno: Array<Dictionary<String, Any>> = []
        var json: Dictionary<String, Any> = [:]
        
        for aluno in alunos{
            guard let nome = aluno.nome else { break }
            guard let endereco = aluno.endereco else { break }
            guard let telefone = aluno.telefone else { break }
            guard let site = aluno.site else { break }
            
            var dicionarioDeAlunos = [
                "id": "\(aluno.objectID)",
                "nome:": nome,
                "endereco": endereco,
                "telefone": telefone,
                "site": site,
                "nota": String(aluno.nota)
            ]
            listaDeAluno.append(dicionarioDeAlunos as [String:Any])
        }
        
        
        json = [
            "list": [
                ["aluno": listaDeAluno]
            ]
        ]
        
        
        do{
            var requisicao = URLRequest(url: url)
            let data = try JSONSerialization.data(withJSONObject: json, options: [])
            requisicao.httpBody = data
            // qual verbo usar para fazer a request? POST
            requisicao.httpMethod = "POST"
            // explica o tipo de dados que esta sendo enviado para servidor
            requisicao.addValue("application/json", forHTTPHeaderField: "Content")
            
            let task = URLSession.shared.dataTask(with: requisicao) { (data, response, error) in
                if error == nil{
                    do{
                        let dicionario = try JSONSerialization.jsonObject(with: data!, options: []) as! Dictionary<String, Any>
                        sucesso(dicionario)
                    }catch{
                         print("Erro 2: \(error.localizedDescription)")
                        falha(error)
                    }
                }
            }
            task.resume()
        }catch{
            print("Erro 1: \(error.localizedDescription)")
        }
        
    }
}
