//
//  Mensagem.swift
//  Agenda
//
//  Created by Felipe Weber on 30/01/20.
//  Copyright © 2020 Alura. All rights reserved.
//

import UIKit
import MessageUI

class Mensagem: NSObject, MFMessageComposeViewControllerDelegate {
    
    
    // MARK: - Metodos
    func configuraSMS(_ aluno: Aluno)-> MFMessageComposeViewController?{
        if MFMessageComposeViewController.canSendText(){
            let componenteMensagem = MFMessageComposeViewController()
            guard let numeroDoAluno = aluno.telefone else { return componenteMensagem }
            componenteMensagem.recipients = [numeroDoAluno]
            componenteMensagem.messageComposeDelegate = self
            return componenteMensagem
        }
        return nil
    }
    
    // MARK: - Message Compose Delegate
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        controller.dismiss(animated: true, completion: nil)
    }
    

}
