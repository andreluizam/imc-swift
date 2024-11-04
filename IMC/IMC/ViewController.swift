//
//  ViewController.swift
//  Meu Dog
//
//  Created by André Luiz Alves Martins on 03/11/24.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var btnCalcularImc: UIButton!
    @IBOutlet weak var txtPeso: UITextField!
    @IBOutlet weak var txtAltura: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnCalcularImc.addTarget(self, action: #selector(calcularIMC), for: .touchUpInside)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    
    @objc func calcularIMC(){
        if(txtPeso.text?.isEmpty == true){
            showAlert("Erro", "Por favor, insira seu peso.")
            return
        }
        
        if(txtAltura.text?.isEmpty == true){
            showAlert("Erro", "Por favor, insira sua altura.")
            return
        }
        
        let pesoTexto = String(txtPeso.text!).replacingOccurrences(of: ",", with: ".")
        let alturaTexto = String(txtAltura.text!).replacingOccurrences(of: ",", with: ".")
        
        let peso = Double(pesoTexto)
        let altura = Double(alturaTexto)
        
        let imc:Double = peso! / (altura! * altura!)
        
        showAlert("Resultado", verificarImc(imc))
        
    }
    
    func verificarImc(_ imc: Double) -> String{
        if imc < 18.5{
            return "Abaixo do peso"
        }else if imc >= 18.5 && imc < 25{
            return "Peso normal"
        }else if imc >= 25 && imc < 30{
            return "Acima do peso"
        }else{
            return "Obeso"
        }
    }
    
    func showAlert(_ title: String, _ message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
}

