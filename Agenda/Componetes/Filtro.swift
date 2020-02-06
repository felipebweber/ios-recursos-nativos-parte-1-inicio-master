//
//  Filtro.swift
//  Agenda
//
//  Created by Felipe Weber on 06/02/20.
//  Copyright © 2020 Alura. All rights reserved.
//

import UIKit

class Filtro: NSObject {

    func filtraAlunos(lisdaDeAlunos:Array<Aluno>, texto: String) -> Array<Aluno>{
        let alunosEncontrados = lisdaDeAlunos.filter { (aluno) -> Bool in
            if let nome = aluno.nome{
                return nome.contains(texto)
            }else{
                return false
            }
        }
        return alunosEncontrados
    }
}
