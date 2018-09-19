//
//  ViewController.swift
//  JuanAPP
//
//  Created by Virtualizacion 05 on 8/16/18.
//  Copyright © 2018 Leo. All rights reserved.
//

import UIKit

//MARK: -Clase para darle formato a los UIButtons
@IBDesignable extension UIButton {

    @IBInspectable var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        set {
            guard let uiColor = newValue else { return }
            layer.borderColor = uiColor.cgColor
        }
        get {
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
    }
}

//clase nombre de clase:super clase
class JuanAppViewController: UIViewController {
    //declaraciones de las propiedades de esta clase
//    @IBOutlet weak var labelDePregunta: UILabel!
//    @IBOutlet weak var labelDeRespuesta: UILabel!
    
    @IBOutlet weak var botonAtras: UIButton!
    @IBOutlet weak var botonSiguiente: UIButton!
    
    @IBOutlet weak var labelPreguntas: UILabel!
    @IBOutlet weak var labelCategoria: UILabel!
    
    @IBOutlet weak var botonRespuesta1: UIButton!
    @IBOutlet weak var botonRespuesta2: UIButton!
    @IBOutlet weak var botonRespuesta3: UIButton!
    @IBOutlet weak var botonRespuesta4: UIButton!
    
    let modeloQuiz = Quiz();
    
    
    
    //metodos
    override func viewDidLoad() {
        super.viewDidLoad()
        botonAtras.isHidden = true;
        botonSiguiente.isHidden = true;
        labelCategoria.isHidden = true;
        // Do any additional setup after loading the view, typically from a nib.
    }
    //demasiada memoria
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

//    @IBAction func siguientePregunta() {
//        self.labelDePregunta.text = modeloQuiz.pregunta();
//        self.labelDeRespuesta.text = "¿?";
//    }
//
//    @IBAction func darRespuesta() {
//        self.labelDeRespuesta.text = modeloQuiz.respuesta();
//    }
    
    @IBAction func eligeCategoria(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            print("1");
            labelPreguntas.text = self.modeloQuiz.preguntas(numeroDeCategoria: 0);
        case 1:
            print("2");
        case 2:
            print("3");
        case 3:
            print("4");
        case 4:
            print("5");
        default:
            print("Esto no sucedera");
        }
        for j in 6...7{
            self.view.subviews[j].isHidden=false;
        }
//        botonAtras.isEnabled = false;
//        botonSiguiente.isEnabled = false;
        labelCategoria.isHidden = false;
        labelCategoria.text = sender.currentTitle;
        for i in 1...5{
            self.view.subviews[i].isHidden = true;
        }
    }
    
    @IBAction func regresaCategorias() {
        for i in 1...5{
            self.view.subviews[i].isHidden=false;
        }
        for j in 6...7{
            self.view.subviews[j].isHidden=true;
        }
        labelCategoria.isHidden = true;
    }
}

