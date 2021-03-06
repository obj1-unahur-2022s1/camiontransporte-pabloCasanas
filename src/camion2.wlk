import cosas2.*

object camion {
	const property pesoTara = 1000
	var carga = []
	
	method totalBultos() = carga.sum({e => e.bultos()})
	method cargar(cosa){
		carga.add(cosa)
		cosa.consecuenciaDeCarga()
	}
	method descargar(cosa){carga.remove(cosa)}
	method todoPesoPar() = carga.all({ e => e.peso().even() })
	method hayAlgunoQuePesa(peso) = carga.any({ e => e.peso() == peso })
	method elDeNivel(nivel) = carga.find({ e => e.nivelPeligrosidad() == nivel})
	method pesoTotal() = pesoTara + carga.sum({ e => e.peso()})
	method exedidoDePeso() = self.pesoTotal() > 2500
	method objetosQueSuperanPeligrosidad(nivel) = carga.filter({ e => e.nivelPeligrosidad() > nivel })
	method objetosMasPeligrososQue(cosa) = carga.filter({ e => e.nivelPeligrosidad() > cosa.nivelPeligrosidad()})
	method puedeCircularEnRuta(nivelMaximoPeligrosidad) = !self.exedidoDePeso() and carga.all({e => e.nivelPeligrosidad() < nivelMaximoPeligrosidad })
	method tieneAlgoQuePesaEntre(min, max) = carga.any({ e => e.peso().between(min, max)})
	method cosaMasPesada() = carga.max({ e => e.peso()})
	method pesos() = carga.map({ e => e.peso()})
	
}
