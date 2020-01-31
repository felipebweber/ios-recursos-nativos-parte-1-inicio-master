//
//  Localizacao.swift
//  Agenda
//
//  Created by Felipe Weber on 31/01/20.
//  Copyright © 2020 Alura. All rights reserved.
//

import UIKit
import CoreLocation

class Localizacao: NSObject {

    func converteEnderecaoEmCoordenadas(endereco: String, local: @escaping(_ local: CLPlacemark) -> Void){
        let conversor = CLGeocoder()
        conversor.geocodeAddressString(endereco) { (listaDeLocalizaoes, error) in
            if let localizacao = listaDeLocalizaoes?.first{
                local(localizacao)
            }
        }
    }
}
