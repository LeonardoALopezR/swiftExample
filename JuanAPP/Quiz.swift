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
    let preguntasDeportes: Array<String> = ["¿Qué jugador ha disputado más partidos en la historia de la Champions League?","Después de Cristiano Ronaldo y Messi, ¿Quién ha marcado más goles en la Champions League?","¿En qué fase de Champions anotó Iniesta su famoso gol contra el Chelsea?","¿Cuántos títulos de Champions League tiene el Nottingham Forest?","Este equipo ganó la Final de la Champions League en su estadio"];
    let respuestasCorrectasDeportes=["Iker Casillas","Raúl González","Semifinales","2", "Inter de Milán"];
    let respuestasIncorrectasDeportes1=["Xavi Hernández","Ibrahimovic","Cuartos de final","0","Liverpool"];
    let respuestasIncorrectasDeportes2=["Raúl González","Henry","Final","1","Barcelona"];
    let respuestasIncorrectasDeportes3=["Gianluigi Buffon","Van Nistelrooy", "Octavos de final","3","Real Madrid"];
    
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
        switch numeroDeCategoria {
        case 0:
            return preguntasDeportes[aleatoreos()];
        default:
            print("Esto no sucedera");
        }
        return "Error faltal";
    }
    
    func respuestas(numeroDeCategoria: Int,numeroDeBoton: Int) -> String{
        switch numeroDeCategoria {
        case 0:
            switch numeroDeBoton{
            case 1:
                return respuestasCorrectasDeportes[preguntaAnterior];
            case 2:
                return respuestasIncorrectasDeportes1[preguntaAnterior];
            case 3:
                return respuestasIncorrectasDeportes2[preguntaAnterior];
            case 4:
                return respuestasIncorrectasDeportes3[preguntaAnterior];
            default:
                print("Esto no sucedera");
            }
        default:
            print("Esto no sucedera");
        }
        return "Algo";
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
