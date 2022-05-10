object knightRider {
	const property peso = 500
	const property nivelPeligrosidad = 10
	const property bultos = 1
	
	method consecuenciaDeCarga(){}
}

object bumblebee {
	const property peso = 800
	var modoAuto = true
	const property bultos = 2
	
	method nivelPeligrosidad() = if(modoAuto){15}else{30}
	method cambiarDeModo() {modoAuto = !modoAuto} 
	method consecuenciaDeCarga(){modoAuto = false}

}

object paqueteLadrillos{
	var property cantidadLadrillos
	const property nivelPeligrosidad = 2
	
	method peso() = cantidadLadrillos * 2
	method bultos() = if(cantidadLadrillos <= 100){1}
					  else if(cantidadLadrillos <=300){2}
					  else{3}
	method consecuenciaDeCarga(){cantidadLadrillos += 12}
}


object arena {
	var property peso
	const property nivelPeligrosidad = 1
	const property bultos = 1
	
	method consecuenciaDeCarga(){peso += 20}
}

object bateriaAntiaerea {
	var conMisiles = true
	
	method peso() = if(conMisiles){300}else{200}
	method cambiarEstado() {conMisiles = !conMisiles}
	method nivelPeligrosidad() = if(conMisiles){100}else{0}
	method bultos() = if(conMisiles){2}else{1}
	method consecuenciaDeCarga(){conMisiles = true}
}

object contenedor {
	var peso = 100
	var cosasAdentro = []
	var nivelPeligrosidad = 0
	
	method peso() = peso + cosasAdentro.sum({ e => e.peso() })
	method nivelDeCosasAdentro() = cosasAdentro.map({ e => e.nivelPeligrosidad()})
	method nivelPeligrosidad() = nivelPeligrosidad + self.nivelDeCosasAdentro().max()
	method ponerAdentro(cosa) {cosasAdentro.add(cosa)}
	method bultos() = 1 + cosasAdentro.sum({e => e.bultos()})
	method consecuenciaDeCarga(){cosasAdentro.forEach({e => e.consecuenciaDeCarga()})}

}

object residuosRadioactivos {
	var property peso
	const property nivelPeligrosidad = 200
	const property bultos = 1
	
	method consecuenciaDeCarga(){peso += 15}
}

object embalajeSeguridad {
	var cosasEnvueltas = []
	const property bultos = 2
	method envolver(cosa) {cosasEnvueltas.add(cosa)}
	method peso() = cosasEnvueltas.sum({ e => e.peso()})
	method nivelPeligrosidad() = cosasEnvueltas.sum({ e => e.nivelPeligrosidad()}) / 2
	method consecuenciaDeCarga(){}
	
	

}
