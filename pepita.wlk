object pepita {
	var property energia = 100
	
	method comer(comida) {
		energia += comida.energiaQueAporta()
	}
	
	method energiaParaVolar(distancia) = 10 + distancia
	
	method puedeVolar(distancia) = energia >= self.energiaParaVolar(distancia)
	
	method volar(distancia) {
		self.validarVolar(distancia)
		energia -= self.energiaParaVolar(distancia)
	}
	
	method validarVolar(distancia) {
		if (not self.puedeVolar(distancia)) {self.error("No puede volar.")}
	}
}

object pepon {
	var property energia = 30
	var ultimaComida = manzana
	
	method energiaParaVolar(distancia) = 20 + (2 * distancia)

	method comidaQueAprovecha(comida) = comida.energiaQueAporta() / 2
	
	method ultimaComida() = ultimaComida

	method puedeVolar(distancia) = energia >= self.energiaParaVolar(distancia)
	
	method puedeComer(comida) = not (ultimaComida == comida)
	
	method comer(comida) {
		self.validarComer(comida)
		ultimaComida = comida
		energia += self.comidaQueAprovecha(comida)
	}
	
	method volar(distancia) {
		self.validarVolar(distancia)
		energia -= self.energiaParaVolar(distancia)
	}

	method validarComer(comida) {
		if (not self.puedeComer(comida)) {self.error("No puede comer.")}
	}
	
	method validarVolar(distancia) {
		if (not self.puedeVolar(distancia)) {self.error("No puede volar.")}
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

object milena {
	const property aves = []

	method movilizar(distancia) {
		self.validarSiPuedeMovilizarlas(distancia)
		aves.forEach({ave => ave.volar(distancia)})
	}

	method agregarAve(ave) {
		aves.add(ave)
	}

	method validarSiPuedeMovilizarlas(distancia) {
		if (not self.puedeMovilizarlas(distancia)) {
			self.error("Milena no puede movilizar a sus aves esa distancia.")
		}
	}

	method puedeMovilizarlas(distancia) {
		return aves.all({ave => ave.puedeVolar(distancia)})
	}
}