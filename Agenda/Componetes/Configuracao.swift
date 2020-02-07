//
//  Configuracao.swift
//  Agenda
//
//  Created by Felipe Weber on 07/02/20.
//  Copyright © 2020 Alura. All rights reserved.
//

import UIKit

class Configuracao: NSObject {

    func getUrlPadrao() -> String?{
        guard let caminhoParaPlist = Bundle.main.path(forResource: "Info", ofType: "plist") else { return nil}
        
        //pegar o caminho com dicionario
        guard let dicionario = NSDictionary(contentsOfFile: caminhoParaPlist) else { return nil}
        guard let urlPadrao = dicionario["UrlPadrao"] as? String else { return nil}
        
        return urlPadrao
    }
}
