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
    let preguntas : Array<String> = ["¿Cuanto es dos mas dos?","Capital de Bukina Faso","¿Como se apellida juan?"];
    let respuestas=["Cuatro","Ouagadougou","Topo"];
    var preguntaActual = -1;
    
    //MARK: -Metodos del modelo
    func pregunta() -> String{
        //FIXME: Que la primer pregunta no sea la segunda del arreglo
        self.preguntaActual += 1;
        if (self.preguntaActual == self.preguntas.count){
            self.preguntaActual = 0;
        }
        return self.preguntas[preguntaActual];
    }
    
    func preguntas() -> String{
        
    }
    
    func respuesta() -> String{
        if (self.preguntaActual == -1){
            return "Haga clic en el boton siguiente pregunta";
        }else{
            return self.respuestas[preguntaActual];
        }
    }
    //TODO: Que el usuario defina sus preguntas
}
