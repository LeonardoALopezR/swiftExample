//
//  Quiz.swift
//  JuanAPP
//
//  Created by Virtualizacion 05 on 8/22/18.
//  Copyright © 2018 Leo. All rights reserved.
//

import Foundation

class Quiz {
    
    //MARK: -Propiedades del modelo
    let preguntasDeportes: Array<String> = ["¿Cuanto es dos mas dos?","Capital de Bukina Faso","¿Como se apellida juan?","¿Por que?","¿Que?"];
    let respuestasDeportes=["Cuatro","Ouagadougou","Topo","Kha","Na"];
    
    var numeroActual = 0;
    var preguntaActual = 0;
    var preguntaAnterior = 0;
    //MARK: -Metodos del modelo
//    func pregunta() -> String{
//        //FIXME: Que la primer pregunta no sea la segunda del arreglo
//        self.preguntaActual += 1;
//        if (self.preguntaActual == self.preguntas.count){
//            self.preguntaActual = 0;
//        }
//        return self.preguntas[preguntaActual];
//    }
    
    func preguntas(numeroDeCategoria: Int) -> String{
        numeroActual = aleatoreos();
        switch numeroDeCategoria {
        case 0:
            return preguntasDeportes[numeroActual];
        default:
            print("Esto no sucedera");
        }
        return "Error faltal";
    }
    
//    func respuesta() -> String{
//        if (self.preguntaActual == -1){
//            return "Haga clic en el boton siguiente pregunta";
//        }else{
//            return self.respuestas[preguntaActual];
//        }
//    }
    //TODO: Que el usuario defina sus preguntas
    func aleatoreos() -> Int{
        preguntaActual = Int(arc4random_uniform(5));
        while preguntaAnterior == preguntaActual {
            preguntaActual = Int(arc4random_uniform(5));
        }
        preguntaAnterior = preguntaActual;
        return preguntaActual
    }
}
