//
//  Safari.swift
//  Agenda
//
//  Created by Felipe Weber on 06/02/20.
//  Copyright © 2020 Alura. All rights reserved.
//

import UIKit
import SafariServices

class Safari: NSObject {

    func abrePaginaWeb(_ alunoSelecionado: Aluno, _ controller: UIViewController){
         if let urlDoAluno = alunoSelecionado.site{
            var urlFormatada = urlDoAluno
            if !urlFormatada.hasPrefix("http://"){
                urlFormatada = String(format: "http://%@", urlFormatada)
            }
            
            guard let url = URL(string: urlFormatada) else { return }
            let safariViewController = SFSafariViewController(url: url)
            controller.present(safariViewController, animated: true, completion: nil)
 
    }
}
}
