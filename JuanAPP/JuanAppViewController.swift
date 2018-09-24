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
	
	//MARK: -Botones para ir a la siguiente pregunta o regresar a las categorias
    @IBOutlet weak var botonAtras: UIButton!
    @IBOutlet weak var botonSiguiente: UIButton!
	
	//MARK: -Labels que muestran el marcador, las preguntas, las categorias y el mensaje de correcto e incorrecto
	@IBOutlet weak var labelMensaje: UILabel!
	@IBOutlet weak var labelPreguntas: UILabel!
    @IBOutlet weak var labelCategoria: UILabel!
    @IBOutlet weak var labelAciertos: UILabel!
    @IBOutlet weak var labelErrores: UILabel!
	
	//MARK: -Los botones de respuesta
    @IBOutlet weak var botonRespuesta1: UIButton!
    @IBOutlet weak var botonRespuesta2: UIButton!
    @IBOutlet weak var botonRespuesta3: UIButton!
    @IBOutlet weak var botonRespuesta4: UIButton!
	
	//MARK: -Variable que hace referencia a la clase del modelo
    let modeloQuiz = Quiz();
	//MARK: -Variables de apoyo para las categorias y las respuestas correctas
    var categoria = -1;
	var respuestasCorrectas:[Bool] = [false,false,false,false] ;
    
    
    
    //metodos
	//MARK: -Este método precarga algunas acciones que los elementos de la vista van a realizar
    override func viewDidLoad() {
        super.viewDidLoad()
        botonAtras.isHidden = true;
        botonSiguiente.isHidden = true;
        labelCategoria.isHidden = true;
        botonRespuesta1.isHidden = true;
        botonRespuesta2.isHidden = true;
        botonRespuesta3.isHidden = true;
        botonRespuesta4.isHidden = true;
        labelAciertos.text = String((self.modeloQuiz.obtenerMarcador()).0);
        labelErrores.text = String((self.modeloQuiz.obtenerMarcador()).1);
        // Do any additional setup after loading the view, typically from a nib.
    }
    //demasiada memoria
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	//MARK: -Método que muestra las preguntas y respuestas dependiendo de la categoria que se eligio
    @IBAction func eligeCategoria(_ sender: UIButton) {
		//MARK: -Tag del botón que nos permite saber cual es el botón que se presiono
			categoria = sender.tag;
		//MARK: -La variable pregunta es una tupla que contiene la variable tipo pregunta que a su vez contiene las respuestas y un arreglo de números aleatoreos
			let pregunta = self.modeloQuiz.preguntas(numeroDeCategoria: sender.tag);
		let posicion = pregunta.1;
			labelPreguntas.text = pregunta.0.texto;
            estiloBoton();
		
		//MARK: -Se ingresan las respuestas aleatoreamente en los botones
		botonRespuesta1.setTitle(pregunta.0.respuestas[posicion[0]].texto, for: .normal);
		botonRespuesta2.setTitle(pregunta.0.respuestas[posicion[1]].texto, for: .normal);
		botonRespuesta3.setTitle(pregunta.0.respuestas[posicion[2]].texto, for: .normal);
		botonRespuesta4.setTitle(pregunta.0.respuestas[posicion[3]].texto, for: .normal);
		
		//MARK: -Se crea un arreglo para saber en que posicion se encuentra la respuesta correcta
		for k in 0...3{
			respuestasCorrectas[k] = pregunta.0.respuestas[posicion[k]].correcto;
		}
		
		//MARK: -Se esconden los botones de categoria
        for j in 6...7{
            self.view.subviews[j].isHidden=false;
        }
        botonAtras.isEnabled = false;
        botonSiguiente.isEnabled = false;
        labelCategoria.isHidden = false;
        labelCategoria.text = sender.currentTitle;
		//MARK: -Se habilitan los demas botones
        for i in 1...5{
            self.view.subviews[i].isHidden = true;
        }
        botonRespuesta1.isHidden = false;
        botonRespuesta2.isHidden = false;
        botonRespuesta3.isHidden = false;
        botonRespuesta4.isHidden = false;
    }
	
	//MARK: -Método que muestra la siguiente pregunta
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
        desblockeaBotones();
        botonSiguiente.isEnabled = false;
        botonAtras.isEnabled = false;
		labelMensaje.text = "";
    }
	
	//MARK: -Método que te regresa a elgir las categorias
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
	
	//MARK: -Muestra si la respuesta que se eligio es correcta o no
	@IBAction func BotonRespuestaIncorrecta(_ sender: UIButton) {
        switch sender.tag {
        case 5:
            if (respuestasCorrectas[0]){
                botonRespuesta1.backgroundColor = UIColor(red: 0, green: 1, blue: 0, alpha: 1);
                    labelMensaje.text = "¡Correcto!";
                labelAciertos.text = String(self.modeloQuiz.aumentarMarcador(erroresAciertos: true));
            }else{
                botonRespuesta1.backgroundColor = UIColor(red: 1, green: 0, blue: 0, alpha: 1);
                labelMensaje.text = "¡Incorrecto!";
                labelErrores.text = String(self.modeloQuiz.aumentarMarcador(erroresAciertos: false));
            }
        case 6:
            if (respuestasCorrectas[1]){
                botonRespuesta2.backgroundColor = UIColor(red: 0, green: 1, blue: 0, alpha: 1);
                labelMensaje.text = "¡Correcto!";
                labelAciertos.text = String(self.modeloQuiz.aumentarMarcador(erroresAciertos: true));
            }else{
                botonRespuesta2.backgroundColor = UIColor(red: 1, green: 0, blue: 0, alpha: 1);
                labelMensaje.text = "¡Incorrecto!";
                labelErrores.text = String(self.modeloQuiz.aumentarMarcador(erroresAciertos: false));
            }
        case 7:
            if (respuestasCorrectas[2]){
                botonRespuesta3.backgroundColor = UIColor(red: 0, green: 1, blue: 0, alpha: 1);
                labelMensaje.text = "¡Correcto!";
                labelAciertos.text = String(self.modeloQuiz.aumentarMarcador(erroresAciertos: true));
            }else{
                botonRespuesta3.backgroundColor = UIColor(red: 1, green: 0, blue: 0, alpha: 1);
                labelMensaje.text = "¡Incorrecto!";
                labelErrores.text = String(self.modeloQuiz.aumentarMarcador(erroresAciertos: false));
            }
        case 8:
            if (respuestasCorrectas[3]){
                botonRespuesta4.backgroundColor = UIColor(red: 0, green: 1, blue: 0, alpha: 1);
                labelMensaje.text = "¡Correcto!";
                labelAciertos.text = String(self.modeloQuiz.aumentarMarcador(erroresAciertos: true));
            }else{
                botonRespuesta4.backgroundColor = UIColor(red: 1, green: 0, blue: 0, alpha: 1);
                labelMensaje.text = "¡Incorrecto!";
                labelErrores.text = String(self.modeloQuiz.aumentarMarcador(erroresAciertos: false));
            }
        default:
            print("Esto no sucedera");
        }
        botonAtras.isEnabled = true;
        botonSiguiente.isEnabled = true;
        blockeaBotones();
	}
	
	//MARK: -Estilos para los botones
	
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
        self.modeloQuiz.reiniciarMarcador();
    }
}

