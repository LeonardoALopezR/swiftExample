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
//    let preguntasDeportes: Array<String> = ["¿Qué jugador ha disputado más partidos en la historia de la Champions League?","Después de Cristiano Ronaldo y Messi, ¿Quién ha marcado más goles en la Champions League?","¿En qué fase de Champions anotó Iniesta su famoso gol contra el Chelsea?","¿Cuántos títulos de Champions League tiene el Nottingham Forest?","Este equipo ganó la Final de la Champions League en su estadio"];
//    let respuestasCorrectasDeportes=["Iker Casillas","Raúl González","Semifinales","2", "Inter de Milán"];
//    let respuestasIncorrectasDeportes1=["Xavi Hernández","Ibrahimovic","Cuartos de final","0","Liverpool"];
//    let respuestasIncorrectasDeportes2=["Raúl González","Henry","Final","1","Barcelona"];
//    let respuestasIncorrectasDeportes3=["Gianluigi Buffon","Van Nistelrooy", "Octavos de final","3","Real Madrid"];
    
    struct Respuesta {
        var texto : String
        var correcto : Bool
    }
    
    
    struct Pregunta {
        var texto : String
        var respuestas : [Respuesta]
    }
    
    struct Categoria {
        var texto : String
        var preguntas : [Pregunta]
    }
    
    var numeroActual = -1;
    var numeroAnterior = -1;
    var numeroAnterior2 = -1;
    var numeroAnterior3 = -1;
    var preguntaActual = 0;
    var preguntaAnterior = 0;
    var numbers:[Int] = [0,0,0,0];
    //MARK: -Metodos del modelo
//    func pregunta() -> String{
//        //FIXME: Que la primer pregunta no sea la segunda del arreglo
//        self.preguntaActual += 1;
//        if (self.preguntaActual == self.preguntas.count){
//            self.preguntaActual = 0;
//        }
//        return self.preguntas[preguntaActual];
//    }
    func random() -> [Int]{
        for i in 0...3{
        numeroActual = Int(arc4random_uniform(4));
        while numeroAnterior == numeroActual || numeroAnterior2 == numeroActual || numeroAnterior3 == numeroActual {
            numeroActual = Int(arc4random_uniform(4));
        }
        numeroAnterior3 = numeroAnterior2;
        numeroAnterior2 = numeroAnterior;
        numeroAnterior = numeroActual;
        numbers[i] = numeroActual;
        }
        numeroAnterior3 = -1;
        numeroAnterior2 = -1;
        numeroAnterior = -1;
        return numbers;
}
    
    func iniciar() -> [Categoria]{
        let respuestasDeportes: [[Respuesta]]=[[
            Respuesta(texto:"Iker Casillas",correcto:true),
            Respuesta(texto:"Xavi Hernández",correcto:false),
            Respuesta(texto:"Raúl González",correcto:false),
            Respuesta(texto:"Gianluigi Buffon",correcto:false)
        ],[
            Respuesta(texto:"Raúl González",correcto:true),
            Respuesta(texto:"Ibrahimovic",correcto:false),
            Respuesta(texto:"Henry",correcto:false),
            Respuesta(texto:"Van Nistelrooy",correcto:false)
        ],[
            Respuesta(texto:"Semifinales",correcto:true),
            Respuesta(texto:"Cuartos de final",correcto:false),
            Respuesta(texto:"Final",correcto:false),
            Respuesta(texto:"Octavos de final",correcto:false)
        ],[
            Respuesta(texto:"2",correcto:true),
            Respuesta(texto:"0",correcto:false),
            Respuesta(texto:"1",correcto:false),
            Respuesta(texto:"3",correcto:false)
        ],[
            Respuesta(texto:"Inter de Milán",correcto:true),
            Respuesta(texto:"Liverpool",correcto:false),
            Respuesta(texto:"Barcelona",correcto:false),
            Respuesta(texto:"Real Madrid",correcto:false)
            ]
        ]
        
        let respuestasVideojuegos: [[Respuesta]]=[[
                Respuesta(texto:"Pong",correcto:true),
                Respuesta(texto:"Tetris",correcto:false),
                Respuesta(texto:"Pac-man",correcto:false),
                Respuesta(texto:"Donkey Kong",correcto:false)
            ],[
                Respuesta(texto:"Luigi",correcto:true),
                Respuesta(texto:"Mario Jr",correcto:false),
                Respuesta(texto:"Wario",correcto:false),
                Respuesta(texto:"Luis",correcto:false)
            ],[
                Respuesta(texto:"12",correcto:true),
                Respuesta(texto:"8",correcto:false),
                Respuesta(texto:"4",correcto:false),
                Respuesta(texto:"16",correcto:false)
            ],[
                Respuesta(texto:"4",correcto:true),
                Respuesta(texto:"6",correcto:false),
                Respuesta(texto:"2",correcto:false),
                Respuesta(texto:"1",correcto:false)
            ],[
                Respuesta(texto:"Madera",correcto:true),
                Respuesta(texto:"Hierro",correcto:false),
                Respuesta(texto:"Acero",correcto:false),
                Respuesta(texto:"Hueso",correcto:false)
            ]
        ]
        
        let respuestasSuperHeroes: [[Respuesta]]=[[
            Respuesta(texto:"Capitán América",correcto:true),
            Respuesta(texto:"Spider-Man",correcto:false),
            Respuesta(texto:"Wolverin",correcto:false),
            Respuesta(texto:"Cable",correcto:false)
            ],[
                Respuesta(texto:"Joe Chill",correcto:true),
                Respuesta(texto:"Slade Wilson",correcto:false),
                Respuesta(texto:"Selina Kyle",correcto:false),
                Respuesta(texto:"El Joker",correcto:false)
            ],[
                Respuesta(texto:"No se sabe",correcto:true),
                Respuesta(texto:"Jerome",correcto:false),
                Respuesta(texto:"Edward Coblepot",correcto:false),
                Respuesta(texto:"Jack Napier",correcto:false)
            ],[
                Respuesta(texto:"1 hora",correcto:true),
                Respuesta(texto:"1 semana",correcto:false),
                Respuesta(texto:"1 día",correcto:false),
                Respuesta(texto:"No se disuelve",correcto:false)
            ],[
                Respuesta(texto:"Ben Reilly",correcto:true),
                Respuesta(texto:"Ben Urich",correcto:false),
                Respuesta(texto:"Ben Parker",correcto:false),
                Respuesta(texto:"Timothy Drake",correcto:false)
            ]
        ]
        
        let respuestasPixar: [[Respuesta]]=[[
            Respuesta(texto:"Andy",correcto:true),
            Respuesta(texto:"Randy",correcto:false),
            Respuesta(texto:"Billy",correcto:false),
            Respuesta(texto:"Tony",correcto:false)
            ],[
                Respuesta(texto:"Cualquiera puede cocinar",correcto:true),
                Respuesta(texto:"El secreto de la gastronomía",correcto:false),
                Respuesta(texto:"Cocina para tontos",correcto:false),
                Respuesta(texto:"Como aprender a cocinar en 3 pasos",correcto:false)
            ],[
                Respuesta(texto:"Pez payaso",correcto:true),
                Respuesta(texto:"Pez anguila",correcto:false),
                Respuesta(texto:"Pez mariposa",correcto:false),
                Respuesta(texto:"Pez naranja",correcto:false)
            ],[
                Respuesta(texto:"P.Sherman, calle Wallaby way 42, Sydney",correcto:true),
                Respuesta(texto:"P.Sherman, calle Wallaby, 422, Sydney",correcto:false),
                Respuesta(texto:"P.Sherman, calle Wallaby, 242, Sydney",correcto:false),
                Respuesta(texto:"P.Sherman, calle Wallaby, 24, Sydney",correcto:false)
            ],[
                Respuesta(texto:"Monstrópolis",correcto:true),
                Respuesta(texto:"Villa Monstruo",correcto:false),
                Respuesta(texto:"Monster Town",correcto:false),
                Respuesta(texto:"Ciudad Monstruo",correcto:false)
            ]
        ]
        
        let respuestasDeTodo: [[Respuesta]]=[[
            Respuesta(texto:"Nueva Guinea",correcto:true),
            Respuesta(texto:"Borneo",correcto:false),
            Respuesta(texto:"Sumatra",correcto:false),
            Respuesta(texto:"Madagascar",correcto:false)
            ],[
                Respuesta(texto:"Etéreo",correcto:true),
                Respuesta(texto:"Solido",correcto:false),
                Respuesta(texto:"Plasmático",correcto:false),
                Respuesta(texto:"Gaseoso",correcto:false)
            ],[
                Respuesta(texto:"Canadá",correcto:true),
                Respuesta(texto:"Alemania",correcto:false),
                Respuesta(texto:"Suiza",correcto:false),
                Respuesta(texto:"Estados Unidos",correcto:false)
            ],[
                Respuesta(texto:"El cinematógrafo",correcto:true),
                Respuesta(texto:"La cámara fotográfica",correcto:false),
                Respuesta(texto:"El avión",correcto:false),
                Respuesta(texto:"El foco",correcto:false)
            ],[
                Respuesta(texto:"En la cama",correcto:true),
                Respuesta(texto:"En un enfrentamiento con bandidos",correcto:false),
                Respuesta(texto:"Se cae del caballo",correcto:false),
                Respuesta(texto:"No se sabe",correcto:false)
            ]
        ]
        
        let preguntas: [[Pregunta]]=[[
            Pregunta(texto: "¿Qué jugador ha disputado más partidos en la historia de la Champions League?", respuestas: respuestasDeportes[0]),
            Pregunta(texto: "Después de Cristiano Ronaldo y Messi, ¿Quién ha marcado más goles en la Champions League?", respuestas: respuestasDeportes[1]),
            Pregunta(texto: "¿En qué fase de Champions anotó Iniesta su famoso gol contra el Chelsea?", respuestas: respuestasDeportes[2]),
            Pregunta(texto: "¿Cuántos títulos de Champions League tiene el Nottingham Forest?", respuestas: respuestasDeportes[3]),
            Pregunta(texto: "Este equipo ganó la Final de la Champions League en su estadio", respuestas: respuestasDeportes[4])
        ],[
            Pregunta(texto: "¿Cuál fue primero?", respuestas: respuestasVideojuegos[0]),
            Pregunta(texto: "¿Cómo se llama el hermano de Mario Bros?", respuestas: respuestasVideojuegos[1]),
            Pregunta(texto: "¿Cuántos luchadores hay en Street Fighter II?", respuestas: respuestasVideojuegos[2]),
            Pregunta(texto: "¿Cuántas entradas para controles tiene la consola Nintendo 64?", respuestas: respuestasVideojuegos[3]),
            Pregunta(texto: "¿Cuál es el material de la primera espada que recibes en The Legend of Zelda?", respuestas: respuestasVideojuegos[4])
        ],[
            Pregunta(texto: "A pesar de su constante irreverencia, Deadpool admira y respeta a un superhéroe. ¿De quién hablamos?", respuestas: respuestasSuperHeroes[0]),
            Pregunta(texto: "¿Quién mató realmente a los padres de Bruce Wayne?", respuestas: respuestasSuperHeroes[1]),
            Pregunta(texto: "¿Cual es el auténtico nombre del Joker?", respuestas: respuestasSuperHeroes[2]),
            Pregunta(texto: "¿Cuánto tiempo dura la telaraña de Spiderman antes de disolverse?", respuestas: respuestasSuperHeroes[3]),
            Pregunta(texto: "¿Cómo se llamaba el clon de Peter Parker que tomó originalmente la identidad de 'Araña Escarlata'?", respuestas: respuestasSuperHeroes[4])
        ],[
                Pregunta(texto: "¿Cual es el nombre del dueño de Woody?", respuestas: respuestasPixar[0]),
                Pregunta(texto: "¿Cuál es el nombre del libro del chef Gusteau?", respuestas: respuestasPixar[1]),
                Pregunta(texto: "¿Que tipo de pez es Nemo?", respuestas: respuestasPixar[2]),
                Pregunta(texto: "¿Cual es la dirección donde está Nemo?", respuestas: respuestasPixar[3]),
                Pregunta(texto: "¿Cómo se llama el lugar donde viven los monstruos de Monsters, Inc.?", respuestas: respuestasPixar[4])
        ],[
                Pregunta(texto: "Hay alrededor de 6.000 lenguas en todo el mundo. Alrededor de 1.000 de ellas se hablan en una única isla. ¿Cuál es?", respuestas: respuestasDeTodo[0]),
                Pregunta(texto: "¿Cuál de los siguientes no es un estado de la materia?", respuestas: respuestasDeTodo[1]),
                Pregunta(texto: "¿Dónde queda el Parque Nacional de Banff?", respuestas: respuestasDeTodo[2]),
                Pregunta(texto: "¿Qué inventaron los hermanos Lumière?", respuestas: respuestasDeTodo[3]),
                Pregunta(texto: "¿Cómo muere don Quijote?", respuestas: respuestasDeTodo[4])
            ]
    ]
    
        let categorias : [Categoria] = [
        Categoria(texto: "Deportes", preguntas: preguntas[0]),
        Categoria(texto: "Videojuegos", preguntas: preguntas[1]),
        Categoria(texto: "Super Heroes", preguntas: preguntas[2]),
        Categoria(texto: "Pixar", preguntas: preguntas[3]),
        Categoria(texto: "De todo", preguntas: preguntas[4])
        ]
        
        return categorias;
}
    
    func preguntas(numeroDeCategoria: Int) -> (Pregunta,[Int]){
        var categorias = iniciar();
        let nums = random();
        let numeroDePregunta = aleatoreos();
        print(nums);
//        switch numeroDeCategoria {
//        case 0:
//            return preguntasDeportes[aleatoreos()];
        return (pregunta: categorias[numeroDeCategoria].preguntas[numeroDePregunta],numeros: nums);
//        default:
//            print("Esto no sucedera");
//        }
//        return "Error faltal";
    }
    
//    func respuestas(numeroDeCategoria: Int,numeroDeBoton: Int) -> String{
//        switch numeroDeCategoria {
//        case 0:
//            switch numeroDeBoton{
//            case 1:
//                return respuestasCorrectasDeportes[preguntaAnterior];
//            case 2:
//                return respuestasIncorrectasDeportes1[preguntaAnterior];
//            case 3:
//                return respuestasIncorrectasDeportes2[preguntaAnterior];
//            case 4:
//                return respuestasIncorrectasDeportes3[preguntaAnterior];
//            default:
//                print("Esto no sucedera");
//            }
//        default:
//            print("Esto no sucedera");
//        }
//        return "Algo";
//    }
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
