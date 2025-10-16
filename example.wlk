import mensajerosdepelicula-agusfmartinez.destinos.*
class Corsa {
  var color
  
  method pasajeros() = 4
  
  method velocidad() = 150
  
  method peso() = 1300
  
  method pintar(unColor) {
    color = unColor
  }

  method color() = color 
}

class Kwid {
  var tieneGas = false
  
  method cambiarTanque() {
    tieneGas = !tieneGas
  }
  
  method pasajeros() = if (tieneGas) 3 else 4
  
  method velocidad() = if (tieneGas) 110 else 120
  
  method peso() = if (tieneGas) 1350 else 1200
  
  method color() = "azul"
}

object trafic {
  var interior = comodo
  var motor = pulenta
  
  method cambiarInterior(nuevoInterior) {
    interior = nuevoInterior
  }

  method cambiarMotor(nuevoMotor) {
    motor = nuevoMotor
  }

  method pasajeros() = interior.capacidad()
  
  method velocidad() = motor.velocidad()
  
  method peso() = 4000 + interior.peso() + motor.peso()
  
  method color() = "blanco"
}

object comodo {
  method capacidad() = 5
  
  method peso () = 700
}

object popular {
  method capacidad() = 12
  
  method peso () = 1000
}

object pulenta {

  method peso() = 800
  method velocidad() = 130 
}

object bataton {

  method peso() = 500
  method velocidad() = 80 

}

class Especial {

  const property pasajeros
  const property velocidad
  const property peso
  const property color 
  
}

class Dependencia {
  const property rodados = new List()
  var property empleados

  method agregarAFlota(rodado) {
    rodados.add(rodado)
  }
  method quitarDeFlota(rodado){
    rodados.remove(rodado)
  }
  method pesoTotalFlota() = rodados.sum({r=>r.peso()})

  method estaBienEquipada() = rodados.size()>=3 and rodados.all({r=>r.velocidad()>=100})
  
  method capacidadTotalEnColor(color) = self.rodadosDeUnColor(color).sum({r => r.pasajeros()})

  method rodadosDeUnColor(color) = rodados.filter({r=> r.color()==color})  

  method colorDelRodadoMasRapido() = rodados.max({r=>r.velocidad()}).color()

  method capacidadFaltante() = (empleados - self.capacidadTotal()).max(0)

  method capacidadTotal() = rodados.sum({r=>r.pasajeros()})

  method esGrande() = empleados >= 40 and rodados.size() == 5
}

class Pedido {
  var property distancia

  var property tiempoMaximo 

  var property cantPasajeros

  const coloresIncompatibles = #{}

  method coloresIncompatibles() = coloresIncompatibles

  method velocidadRequerida() {
    return distancia / tiempoMaximo
    
  }

  method autoPuedeSatisfacer(unAuto){
    return self.autoCumpleCapacidadRequerida(unAuto) 
      and self.autoCumpleVelocidadRequerida(unAuto)
      and self.autoNoSeaColorIncompatible(unAuto)
  }

  method autoCumpleVelocidadRequerida(unAuto) {
    return (unAuto.velocidad() - self.velocidadRequerida()).max(0) >= 10    
  }

  method autoCumpleCapacidadRequerida(unAuto) {
    return unAuto.pasajeros() >= self.cantPasajeros()
    
  }

  method autoNoSeaColorIncompatible(unAuto) {
    return !coloresIncompatibles.any({c => c == unAuto.color()})
    
  }

  method agregarColor(unColor){
    coloresIncompatibles.add(unColor)
  }
  method quitarColor(unColor){
    coloresIncompatibles.remove(unColor)
  }

  method acelerar() {
    tiempoMaximo = (tiempoMaximo -1).max(0)
  }

  method relajar() {
    tiempoMaximo = tiempoMaximo +1
  }

  
}