object pepita {
	var energia = 100
	
	method comer(comida) {
		energia += comida.energiaQueAporta()
	}
	
	method energiaParaVolar(distancia) = 10 + distancia
	
	method puedeVolar(distancia) = energia >= self.energiaParaVolar(distancia)
	
	method volar(distancia) {
		if (not self.puedeVolar(distancia)) self.error("no puede volar")
		energia -= self.energiaParaVolar(distancia)
	}
	
	method energia() = energia
}

object alpiste {
	method energiaQueAporta() = 20
}

object manzana {
	var madurez = 1
	const base = 5
	
	method madurez() = madurez
	
	method madurez(_madurez) {
		madurez = _madurez
	}
	
	method madurar() {
		self.madurez(madurez + 1)
	}
	
	method energiaQueAporta() = base * madurez
}

object pepon {
	var energia = 30
	
	method energia() = energia
	
	method energiaParaVolar(distancia) = 20 + (2 * distancia)
	
	method puedeVolar(distancia) = energia >= self.energiaParaVolar(distancia)
	
	method comer(comida) {
		energia += comida.energiaQueAporta() / 2
	}
	
	method volar(distancia) {
		if (not self.puedeVolar(distancia)) self.error("no puede volar")
		energia -= self.energiaParaVolar(distancia)
	}
}

object roque {
	var ave = pepita
	var cenas = 0
	
	method ave(_ave) {
		ave = _ave
		cenas = 0
	}
	
	method alimentar(alimento) {
		ave.comer(alimento)
		cenas += 1
	}
	
	method cenas() = cenas
}