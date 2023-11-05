import islas.*

class Aves {
	//para heredar se escribe el nombre sin llaves
	method fuerza()
	method disgusto()
	method esDebil () = self.fuerza() <1000
	method esCandidata(min,max) {self.fuerza().beetwen(min,max)}
	method estaConforme(isla)
	method relax()
	method alimentarse(isla)
 
}

class Aguilucho inherits Aves{
	//cuando habla inicialmente pero puede aumentar.Var y un metodo con su var.
	var  velocidad=20 
	method velocidad() =velocidad
	override	method fuerza(){
		return if (velocidad<60) {
			180
		}else{velocidad *3}
	}
	override method disgusto() {
	velocidad *= 2
	}
	// cuando aumenta su velocidad y no puede superarse min()
override method relax() =
	velocidad== 150.min(velocidad+10)
 override method estaConforme(isla){ return
 	isla.alpiste() >= 8
 }
 override method alimentarse(isla){
 	isla.alpiste(3) 
 	velocidad +=15
 }
}

class Albatro inherits Aves{
	
	var peso = 4000
	var masaMuscular = 600
	
	override method fuerza(){return 
		if (peso<6000){
			masaMuscular
		}else{masaMuscular/2}
	}
	method peso()= peso	
	override method disgusto() {
	peso += 800
	}
	method irAlGym() {
	peso +=500
	masaMuscular += 500
	}
 override method relax(){
 	peso = (peso-300)
 }
 override method estaConforme(isla) { return
 	isla.aveConMasFuerza() >=2
 	}
 override method alimentarse(isla){
 	isla.maiz(4)
 	peso +=700
 	masaMuscular +=700
 }
}




class Palomas inherits Aves{
	
	var ira= 200
	method  ira() = ira
override method fuerza() = ira * 2
override method disgusto() {
		ira += 300}
override method estaConforme(isla){
return isla.aves().count( { ave => ave.esDebil() and ave != self}) >=1}
	method equilibrarse() {
		return if (self.fuerza()=<700){
			self.disgusto()
		}else{self.relax()}
	}

}

	
class AguiluchoColorado inherits Aguilucho{
	override method fuerza() = super() + 400
}
class PalomaTorcaza inherits Palomas{
	var huevos = 3
	override method fuerza() = super() + huevos *100
	method  huevos() = huevos
	override method disgusto() { super() 
	huevos +=1
	}
	//rampdomUpto para elegir un numero aleatorio 25 y 50 y truncate para
	//q no baje de 0
	override method relax(){
		ira = 0.max( ira - 25.randomUpTo(50).truncate(0))
	}
}
class PalomaMontera inherits Palomas{
	const tope = topeDeFuerza 
override method fuerza()= tope.topeDeValor().min (super())
}

object topeDeFuerza{
	var property topeValor=2000
}



class PalomaManchada inherits Palomas{
	var property nido= [] 
	
override method disgusto(){
	super()
	nido.add(new Nido())
	}
	
override method relax() {
		super()
		if (nido.size() > 2){
			nido.forEach { n => n.aumentarGrosor(1)}
		}
	}
		method potencia() {
		return nido.sum { n => n.potencia() }
	}
	
override method ira(){return

	super() + self.potencia()
}

class Nido {
	var grosor = 5
	var material = 3
	method grosor() = grosor
	method material() = material
	method Aumentargrosor(nuevoG){
		grosor +=nuevoG
	}
	method potencia() {return
	(grosor * material )+ 20
}
}