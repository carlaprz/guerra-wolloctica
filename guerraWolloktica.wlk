object luke {
  var poder = 5
  var salud = 75
  var sableEnUso = sableVerde
  
  method nombre() = "Luke Skywalker"
  
  method poder() = poder
  
  method salud() = salud
  
  method entrenar() {
    salud += 25
    poder += sableEnUso.poder()
  }
  
  method cambiarSable() {
    sableEnUso = sableEnUso.cambiar()
  }
  
  method esCampeon() = poder >= 30
}

object sableVerde {
  method poder() = 15
  
  method cambiar() = sableAzul
}

object sableAzul {
  method poder() = 25
  
  method cambiar() = sableVerde
}

object yoda {
  var salud = 30
  var poder = 50
  var estaUsandoLafuerza = false
  
  method nombre() = "Din Grogu"
  
  method poder() = poder
  
  method salud() = salud
  
  method entrenar() {
    salud += if (!estaUsandoLafuerza) 25 else 0
    poder = if (estaUsandoLafuerza) poder * 2 else poder
  }
  
  method cambiarEstaUsandoLafuerza() {
    estaUsandoLafuerza = !estaUsandoLafuerza
  }
  
  method estaUsandoLafuerza() = estaUsandoLafuerza
  
  method esCampeon() = true
}

object arturito {
  var salud = 50
  var reparaciones = 0
  
  method nombre() = "Arturito"
  
  method salud() = salud
  
  method poder() = 80 - (reparaciones * 2)
  
  method entrenar() {
    salud += 10
    reparaciones += 1
  }
  
  method esCampeon() = (reparaciones % 2) == 0
}

object c3po {
  var capacidadReparacion = 3
  
  method nombre() = "C-3PO"
  
  method poder() = 30
  
  method salud() = 80
  
  method entrenar() {
    capacidadReparacion += 1
  }
  
  method esCampeon() = capacidadReparacion > (self.poder() * 0.1)
  
  method repararhalconMilenario() {
    halconMilenario.reparar(self.cantidadAAumentar())
  }
  
  method cantidadAAumentar() = if (self.esCampeon()) 100 * capacidadReparacion
                               else 200
}

object halconMilenario {
  var velocidad = 500
  var blindaje = 1000
  
  method reparar(cantidadAAumentar) {
    velocidad += cantidadAAumentar
    blindaje += cantidadAAumentar
  }
  
  method velocidad() = velocidad
  
  method blindaje() = blindaje
}

object laAlianza {
  const ejercito = #{}
  
  method puseSerReclutado(
    guerrero
  ) = (guerrero.salud() > 50) and (guerrero.poder() >= 25)
  
  method reclutar(guerrero) {
    if (self.puseSerReclutado(guerrero)) ejercito.add(guerrero)
  }
  
  method entrenarGuerrero(unGuerrero) {
    unGuerrero.entrenar()
  }
  
  method entrenarTodoElEjercito() {
    ejercito.foreach({ guerrero => guerrero.entrenar() })
  }
  
  method numeroDeGuerreros() = ejercito.size()
  
  method poder() = ejercito.sum({ guerrero => guerrero.poder() + 25 })
  
  method esInvencible() = self.tieneEjercitoPoderoso() or self.tieneAlmenosUnCampeon()
  
  method tieneEjercitoPoderoso() = ejercito.all(
    { guerrero => guerrero.poder() > 50 }
  )
  
  method tieneAlmenosUnCampeon() = ejercito.any(
    { guerrero => guerrero.esCampeon() }
  )
  
  method guerrerosDebiles(unaCantidad) = ejercito.filter(
    { g => g.salud() <= unaCantidad }
  )
  
  method ganaBatalla(unValor) = self.poder() > unValor
  
  method pocaSaludyMuchoPoder() = self.guerreroConMenorSalud().poder() > self.guerreroConMayorSalud().poder()
  
  method guerreroConMenorSalud() = ejercito.min(
    { guerrero => guerrero.salud() }
  )
  
  method guerreroConMayorSalud() = ejercito.max(
    { guerrero => guerrero.salud() }
  )
  
  method nombresDeCampeones() {
    const campeones = ejercito.filter({ soldado => soldado.esCampeon() })
    
    return campeones.map({ campeon => campeon.nombre() })
  }
  
  method guerreros() = ejercito
}
