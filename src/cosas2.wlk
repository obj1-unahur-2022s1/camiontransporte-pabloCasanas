object knightRider {
	const property peso = 500
	const property nivelPeligrosidad = 10

}

object bumblebee {
	const property peso = 800
	var modoAuto = true
	
	method nivelPeligrosidad() = if(modoAuto){15}else{30}
	method cambiarDeModo() {modoAuto = !modoAuto} 
	

}

object paqueteLadrillos{
	var property cantidadLadrillos
	const property nivelPeligrosidad = 2
	
	method peso() = cantidadLadrillos * 2

}


object arena {
	var property peso
	const property nivelPeligrosidad = 1
	
}

object bateriaAntiaerea {
	var conMisiles = true
	
	method peso() = if(conMisiles){300}else{200}
	method cambiarEstado() {conMisiles = !conMisiles}
	method nivelPeligrosidad() = if(conMisiles){100}else{0}

}

object contenedor {
	var peso = 100
	var cosasAdentro = []
	var nivelPeligrosidad = 0
	
	method peso() = peso + cosasAdentro.sum({ e => e.peso() })
	method nivelDeCosasAdentro() = cosasAdentro.map({ e => e.nivelPeligrosidad()})
	method nivelPeligrosidad() = nivelPeligrosidad + self.nivelDeCosasAdentro().max()
	method ponerAdentro(cosa) {cosasAdentro.add(cosa)}

}

object residuosRadioactivos {
	var property peso
	const property nivelPeligrosidad = 200

}

object embalajeSeguridad {
	var cosasEnvueltas = []
	
	method envolver(cosa) {cosasEnvueltas.add(cosa)}
	method peso() = cosasEnvueltas.sum({ e => e.peso()})
	method nivelPeligrosidad() = cosasEnvueltas.sum({ e => e.nivelPeligrosidad()}) / 2
	
	

}
