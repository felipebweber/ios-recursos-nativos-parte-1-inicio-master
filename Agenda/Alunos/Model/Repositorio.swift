//
//  Repositorio.swift
//  Agenda
//
//  Created by Felipe Weber on 05/02/20.
//  Copyright © 2020 Alura. All rights reserved.
//

import UIKit

class Repositorio: NSObject {

    func recuperaAlunos(completion: @escaping(_ listaDeAlunos: Array<Aluno>) -> Void){
        var alunos = AlunoDAO().recuperaAlunos()
        if alunos.count == 0{
            AlunoAPI().recuperaAlunos {
                alunos = AlunoDAO().recuperaAlunos()
                completion(alunos)
            }
        }
        else{
            completion(alunos)
        }
    }
    
    func salvaAluno(aluno: Dictionary<String, String>){
        
        AlunoAPI().salvaAlunosNoServico(paramentros: [aluno])
        AlunoDAO().salvaAluno(dicionarioDeAluno: aluno)
    }
}
