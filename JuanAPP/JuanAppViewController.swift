//
//  ViewController.swift
//  JuanAPP
//
//  Created by Virtualizacion 05 on 8/16/18.
//  Copyright © 2018 Leo. All rights reserved.
//

import UIKit

//clase nombre de clase:super clase
class JuanAppViewController: UIViewController {
    //declaraciones de las propiedades de esta clase
    @IBOutlet weak var labelDePregunta: UILabel!
    @IBOutlet weak var labelDeRespuesta: UILabel!
    
//    let preguntas : Array<String> = ["¿Cuanto es dos mas dos?","Capital de Bukina Faso","¿Como se apellida juan?"];
//    let respuestas=["Cuatro","Ouagadougou","Topo"];
//    var preguntaActual = -1;
    let modeloQuiz = Quiz();
    
    //metodos
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    //demasiada memoria
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

//    @IBAction func botonAplastado(_ sender: UIButton) {
//        print("Hola Mundo!");
//    }
    @IBAction func siguientePregunta() {
        self.labelDePregunta.text = modeloQuiz.pregunta();
        self.labelDeRespuesta.text = "¿?";
    }
    
    @IBAction func darRespuesta() {
        self.labelDeRespuesta.text = modeloQuiz.respuesta();
    }
}

