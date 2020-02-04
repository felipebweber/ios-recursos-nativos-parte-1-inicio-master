//
//  MapaViewController.swift
//  Agenda
//
//  Created by Felipe Weber on 31/01/20.
//  Copyright © 2020 Alura. All rights reserved.
//

import UIKit
import MapKit

class MapaViewController: UIViewController, CLLocationManagerDelegate {

    // MARK: - IBOutlet
    
    @IBOutlet weak var mapa: MKMapView!
    
    
    // MARK: - Variavel
    var aluno: Aluno?
    lazy var localizacao = Localizacao()
    lazy var gerenciadorDeLocalizacao = CLLocationManager()
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = getTitulo()
        verificaAutorizacaoDoUsuario()
        localizacaoInicial()
        
        mapa.delegate = localizacao
        gerenciadorDeLocalizacao.delegate = self
    }
    
    // MARK: - Metodos
    func getTitulo() -> String{
        return "Localizar Alunos"
    }
    
    func verificaAutorizacaoDoUsuario(){
        if CLLocationManager.locationServicesEnabled(){
            switch CLLocationManager.authorizationStatus() {
            case .authorizedWhenInUse:
                let botao = Localizacao().configuraBotaoLocalizacaoAtual(mapa: mapa)
                mapa.addSubview(botao)
                gerenciadorDeLocalizacao.startUpdatingLocation()
                break
            case .notDetermined:
                gerenciadorDeLocalizacao.requestWhenInUseAuthorization()
                break
            case .denied:
                
                break
            default:
                break
            }
        }
    }
    
    func localizacaoInicial(){
        Localizacao().converteEnderecaoEmCoordenadas(endereco: "Caelum - São Paulo") { (localizacaoEncontrada) in
//            let pino = self.configuraPino(titulo: "Caelum", localizacao: localizacaoEncontrada)
            let pino = Localizacao().configuraPino(titulo: "Caelum", localizacao: localizacaoEncontrada, cor: .black, icone: #imageLiteral(resourceName: "icon_caelum.png"))
            let regiao = MKCoordinateRegion(center: pino.coordinate, latitudinalMeters: 5000, longitudinalMeters: 5000)
            self.mapa.setRegion(regiao, animated: true)
            self.mapa.addAnnotation(pino)
            self.localizarAluno()
        }
    }

    func localizarAluno(){
        if let aluno = aluno{
            Localizacao().converteEnderecaoEmCoordenadas(endereco: aluno.endereco!) { (localizacaoEncontrada) in
//                let pino = self.configuraPino(titulo: aluno.nome!, localizacao: localizacaoEncontrada)
                let pino = Localizacao().configuraPino(titulo: aluno.nome!, localizacao: localizacaoEncontrada, cor: nil, icone: nil)
                self.mapa.addAnnotation(pino)
                self.mapa.showAnnotations(self.mapa.annotations, animated: true)
            }
        }
        
    }
    
    //MARK: - CLLocationManagerDelegate
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .authorizedWhenInUse:
            let botao = Localizacao().configuraBotaoLocalizacaoAtual(mapa: mapa)
            mapa.addSubview(botao)
            gerenciadorDeLocalizacao.startUpdatingLocation()
        default:
            break
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(locations)
    }
    
}
