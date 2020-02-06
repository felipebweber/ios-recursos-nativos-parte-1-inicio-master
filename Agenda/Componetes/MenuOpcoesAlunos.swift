//
//  MenuOpcoesAlunos.swift
//  Agenda
//
//  Created by Felipe Weber on 30/01/20.
//  Copyright © 2020 Alura. All rights reserved.
//

import UIKit


class MenuOpcoesAlunos: NSObject {

    func configuraMenuDeOpcoesDoAluno(alunoSelecionado: Aluno, navigation: UINavigationController) -> UIAlertController{
        let menu = UIAlertController(title: "Atenção", message: "Escolha uma das opções abaixo", preferredStyle: .actionSheet)
        
        guard let viewController = navigation.viewControllers.last else { return menu}
        
        
        let sms = UIAlertAction(title: "Enviar SMS", style: .default) { (acao) in
            Mensagem().enviaSMS(alunoSelecionado, controller: viewController)
        }
        menu.addAction(sms)
        
        let ligacao = UIAlertAction(title: "Ligar", style: .default) { (acao) in
            LigacaoTelefonica().fazLigacao(alunoSelecionado: alunoSelecionado)
        }
        menu.addAction(ligacao)
        
        let waze = UIAlertAction(title: "Localizar no waze", style: .default) { (acao) in
            Localizacao().localizaAlunoNoWaze(alunoSelecionado)
        }
        menu.addAction(waze)
        
        let mapa = UIAlertAction(title: "Localizar no mapa", style: .default) { (acao) in
            let mapa = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "mapa") as! MapaViewController
            mapa.aluno = alunoSelecionado
            navigation.pushViewController(mapa, animated: true)
        }
        menu.addAction(mapa)
        
        let abrirPaginaWeb = UIAlertAction(title: "Abrir Página", style: .default) { (acao) in
            Safari().abrePaginaWeb(alunoSelecionado, viewController)
        }
        menu.addAction(abrirPaginaWeb)
        
        let cancelar = UIAlertAction(title: "Cancela", style: .cancel, handler: nil)
        menu.addAction(cancelar)
        return menu
    }
}
