//
//  MenuOpcoesAlunos.swift
//  Agenda
//
//  Created by Felipe Weber on 30/01/20.
//  Copyright © 2020 Alura. All rights reserved.
//

import UIKit

enum MenuActionSheetAluno{
    case sms
    case ligacao
    case waze
}

class MenuOpcoesAlunos: NSObject {

    func configuraMenuDeOpcoesDoAluno(completion: @escaping(_ opcao: MenuActionSheetAluno) -> Void) -> UIAlertController{
        let menu = UIAlertController(title: "Atenção", message: "Escolha uma das opções abaixo", preferredStyle: .actionSheet)
        let sms = UIAlertAction(title: "Enviar SMS", style: .default) { (acao) in
            completion(.sms)
        }
        menu.addAction(sms)
        
        let ligacao = UIAlertAction(title: "Ligar", style: .default) { (acao) in
            completion(.ligacao)
        }
        menu.addAction(ligacao)
        
        let waze = UIAlertAction(title: "Localizar no waze", style: .default) { (acao) in
            completion(.waze)
        }
        menu.addAction(waze)
        
        let cancelar = UIAlertAction(title: "Cancela", style: .cancel, handler: nil)
        menu.addAction(cancelar)
        return menu
    }
}
