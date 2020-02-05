//
//  Repositorio.swift
//  Agenda
//
//  Created by Felipe Weber on 05/02/20.
//  Copyright © 2020 Alura. All rights reserved.
//

import UIKit

class Repositorio: NSObject {

    func salvaAluno(aluno: Dictionary<String, String>){
        
        AlunoAPI().salvaAlunosNoServico(paramentros: [aluno])
        AlunoDAO().salvaAluno(dicionarioDeAluno: aluno)
    }
}
