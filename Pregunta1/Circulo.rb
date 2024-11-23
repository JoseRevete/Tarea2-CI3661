# Clase Circulo
# a)
class Circulo
  # c)
  def initialize(number)
    puts number
    if number < 0
      raise ArgumentError, 'Radio invalido'
    end
    @radio = number
  end

  # b)
  def radio
    @radio
  end

  def radio=(radio)
    if radio < 0
      raise ArgumentError, 'Radio invalido'
    end
    @radio = radio
  end

  # d)
  def area
    Math::PI * @radio * @radio
  end
end

# Clase Cilindro
# a)
class Cilindro < Circulo
  # c)
  def initialize(radio, altura)
    if radio < 0 
      raise ArgumentError, 'Radio invalido'
    elsif altura < 0
      raise ArgumentError, 'Altura invalida'
    end
    @radio = radio
    @altura = altura
  end

  # b)
  def altura
    @altura
  end

  def altura=(altura)
    if altura < 0
      raise ArgumentError, 'Altura invalida'
    end
    @altura = altura
  end

  # d)
  def volumen
    circulo = Circulo.new(@radio)
    circulo.area * @altura
  end
end


# Pruebas
  circulo = Circulo.new(5)
  puts circulo.radio
  puts circulo.area
  circulo.radio = 10
  puts circulo.radio
  puts circulo.area
  circulo.radio = -10 # Deberia lanzar una excepcion
  puts circulo.radio
  puts circulo.area
  puts '-------------------'

  cilindro = Cilindro.new(5, 10)
  puts cilindro.radio
  puts cilindro.altura
  puts cilindro.volumen
  cilindro.radio = 10
  cilindro.altura = 20
  puts cilindro.radio
  puts cilindro.altura
  puts cilindro.volumen
  cilindro.radio = -10 # Deberia lanzar una excepcion
  cilindro.altura = -20 # Deberia lanzar una excepcion
  puts cilindro.radio
  puts cilindro.altura
  puts cilindro.volumen
