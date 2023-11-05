import aves.*

class Isla{
	var aves= []
	var alpiste = 10
	var maiz =10
		method alpiste(cant){
		alpiste= 0.max(alpiste-cant)
		}
		method maiz(cant){
		maiz= 0.max(maiz-cant)
		}
		method maiz() = maiz
		method alpiste() = alpiste
		
		
		method agregarAve(nuevaAve) {
			aves.add(nuevaAve)
		}
		//consulta directa
		
		method avesDebiles(){return
			aves.filter({ave=>ave.esDebil()})
		}
		method fuerzaTotal(){return
			aves.sum {ave=>ave.fuerza()}
		}
		method esRobusta() {return
			aves.all{ave=>ave.fuerza()>300}
		}
		method terremoto() {return
		aves.forEach{ave=>ave.disgusto()}
		}
		method tormenta() {return
		self.avesDebiles().forEach({
			ave=>ave.disgusto()})
		
		}
		method candidataCapitana(min,max){return
			aves.filter({ave=>ave.esCandidata(min,max)})
		}
		method capitana() {
			const candidatas= self.candidataCapitana(1000,3000)
			if(candidatas.isEmpty()){
				self.error("no hay candidatas para ser capitanas")
				}
				return candidatas.max{ave=>ave.fuerza() }
		}
		method estaEnPaz(){return
			aves.all({ave=>ave.estaConforme(self)})
		}
		method avesConmasFuerza(fuerza){return
			aves.count({ave=>ave.fuerza()> fuerza})
		}
}