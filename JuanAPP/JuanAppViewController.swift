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
    
	@IBOutlet weak var labelMensaje: UILabel!
	@IBOutlet weak var labelPreguntas: UILabel!
    @IBOutlet weak var labelCategoria: UILabel!
    @IBOutlet weak var labelAciertos: UILabel!
    @IBOutlet weak var labelErrores: UILabel!
    
    @IBOutlet weak var botonRespuesta1: UIButton!
    @IBOutlet weak var botonRespuesta2: UIButton!
    @IBOutlet weak var botonRespuesta3: UIButton!
    @IBOutlet weak var botonRespuesta4: UIButton!
    
    let modeloQuiz = Quiz();
    var categoria = -1;
	var respuestasCorrectas:[Bool] = [false,false,false,false] ;
    
    
    
    //metodos
    override func viewDidLoad() {
        super.viewDidLoad()
        botonAtras.isHidden = true;
        botonSiguiente.isHidden = true;
        labelCategoria.isHidden = true;
        botonRespuesta1.isHidden = true;
        botonRespuesta2.isHidden = true;
        botonRespuesta3.isHidden = true;
        botonRespuesta4.isHidden = true;
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
			categoria = sender.tag;
			let pregunta = self.modeloQuiz.preguntas(numeroDeCategoria: sender.tag);
		let posicion = pregunta.1;
			labelPreguntas.text = pregunta.0.texto;
            estiloBoton();
            mostrarEnBotones();

//		print(pregunta.0.respuestas[posicion[0]]);
		botonRespuesta1.setTitle(pregunta.0.respuestas[posicion[0]].texto, for: .normal);
		botonRespuesta2.setTitle(pregunta.0.respuestas[posicion[1]].texto, for: .normal);
		botonRespuesta3.setTitle(pregunta.0.respuestas[posicion[2]].texto, for: .normal);
		botonRespuesta4.setTitle(pregunta.0.respuestas[posicion[3]].texto, for: .normal);
		
		for k in 0...3{
			respuestasCorrectas[k] = pregunta.0.respuestas[posicion[k]].correcto;
		}
		
        for j in 6...7{
            self.view.subviews[j].isHidden=false;
        }
        botonAtras.isEnabled = false;
        botonSiguiente.isEnabled = false;
        labelCategoria.isHidden = false;
        labelCategoria.text = sender.currentTitle;
        for i in 1...5{
            self.view.subviews[i].isHidden = true;
        }
        botonRespuesta1.isHidden = false;
        botonRespuesta2.isHidden = false;
        botonRespuesta3.isHidden = false;
        botonRespuesta4.isHidden = false;
    }
    
    @IBAction func siguienteCategoria() {
		let pregunta = self.modeloQuiz.preguntas(numeroDeCategoria: categoria);
		let posicion = pregunta.1;
		labelPreguntas.text = pregunta.0.texto;
		botonRespuesta1.setTitle(pregunta.0.respuestas[posicion[0]].texto, for: .normal);
		botonRespuesta2.setTitle(pregunta.0.respuestas[posicion[1]].texto, for: .normal);
		botonRespuesta3.setTitle(pregunta.0.respuestas[posicion[2]].texto, for: .normal);
		botonRespuesta4.setTitle(pregunta.0.respuestas[posicion[3]].texto, for: .normal);
            estiloBoton();
        for k in 0...3{
            respuestasCorrectas[k] = pregunta.0.respuestas[posicion[k]].correcto;
        }
        print(respuestasCorrectas);
        mostrarEnBotones();
        desblockeaBotones();
        botonSiguiente.isEnabled = false;
        botonAtras.isEnabled = false;
		labelMensaje.text = "";
    }
    
    @IBAction func regresaCategorias() {
        for i in 1...5{
            self.view.subviews[i].isHidden=false;
        }
        for j in 6...7{
            self.view.subviews[j].isHidden=true;
        }
        labelCategoria.isHidden = true;
        botonRespuesta1.isHidden = true;
        botonRespuesta2.isHidden = true;
        botonRespuesta3.isHidden = true;
        botonRespuesta4.isHidden = true;
        labelPreguntas.text = "Elige una categoría";
		labelMensaje.text = "";
		desblockeaBotones();
    }
    
//    @IBAction func BotonRespuestaCorrecta(_ sender: Any) {
//        botonRespuesta1.backgroundColor = UIColor(red: 0, green: 1, blue: 0, alpha: 1);
//        botonAtras.isEnabled = true;
//        botonSiguiente.isEnabled = true;
//        blockeaBotones();
//        labelMensaje.text = "¡Correcto!";
//    }
	
	
	@IBAction func BotonRespuestaIncorrecta(_ sender: UIButton) {
        switch sender.tag {
        case 5:
            if (respuestasCorrectas[0]){
                botonRespuesta1.backgroundColor = UIColor(red: 0, green: 1, blue: 0, alpha: 1);
                    labelMensaje.text = "¡Correcto!";
            }else{
                botonRespuesta1.backgroundColor = UIColor(red: 1, green: 0, blue: 0, alpha: 1);
                labelMensaje.text = "¡Incorrecto!";
            }
        case 6:
            if (respuestasCorrectas[1]){
                botonRespuesta2.backgroundColor = UIColor(red: 0, green: 1, blue: 0, alpha: 1);
                labelMensaje.text = "¡Correcto!";
            }else{
                botonRespuesta2.backgroundColor = UIColor(red: 1, green: 0, blue: 0, alpha: 1);
                labelMensaje.text = "¡Incorrecto!";
            }
        case 7:
            if (respuestasCorrectas[2]){
                botonRespuesta3.backgroundColor = UIColor(red: 0, green: 1, blue: 0, alpha: 1);
                labelMensaje.text = "¡Correcto!";
            }else{
                botonRespuesta3.backgroundColor = UIColor(red: 1, green: 0, blue: 0, alpha: 1);
                labelMensaje.text = "¡Incorrecto!";
            }
        case 8:
            if (respuestasCorrectas[3]){
                botonRespuesta4.backgroundColor = UIColor(red: 0, green: 1, blue: 0, alpha: 1);
                labelMensaje.text = "¡Correcto!";
            }else{
                botonRespuesta4.backgroundColor = UIColor(red: 1, green: 0, blue: 0, alpha: 1);
                labelMensaje.text = "¡Incorrecto!";
            }
        default:
            print("Esto no sucedera");
        }
        botonAtras.isEnabled = true;
        botonSiguiente.isEnabled = true;
        blockeaBotones();
	}
	
    
    func estiloBoton(){
        botonRespuesta1.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2);
        botonRespuesta1.borderWidth = 3;
        botonRespuesta2.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2);
        botonRespuesta2.borderWidth = 3;
        botonRespuesta3.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2);
        botonRespuesta3.borderWidth = 3;
        botonRespuesta4.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2);
        botonRespuesta4.borderWidth = 3;
    }
    
    func blockeaBotones(){
        botonRespuesta1.isEnabled = false;
        botonRespuesta2.isEnabled = false;
        botonRespuesta3.isEnabled = false;
        botonRespuesta4.isEnabled = false;
    }
    
    func desblockeaBotones(){
        botonRespuesta1.isEnabled = true;
        botonRespuesta2.isEnabled = true;
        botonRespuesta3.isEnabled = true;
        botonRespuesta4.isEnabled = true;
    }
    
    @IBAction func reiniciarMarcador() {
        labelAciertos.text = "-";
        labelErrores.text = "-";
    }
    
    func mostrarEnBotones(){
//        botonRespuesta1.setTitle(self.modeloQuiz.respuestas(numeroDeCategoria: categoria, numeroDeBoton: 1), for: .normal);
//        botonRespuesta2.setTitle(self.modeloQuiz.respuestas(numeroDeCategoria: categoria, numeroDeBoton: 2), for: .normal);
//        botonRespuesta3.setTitle(self.modeloQuiz.respuestas(numeroDeCategoria: categoria, numeroDeBoton: 3), for: .normal);
//        botonRespuesta4.setTitle(self.modeloQuiz.respuestas(numeroDeCategoria: categoria, numeroDeBoton: 4), for: .normal);
    }
}

