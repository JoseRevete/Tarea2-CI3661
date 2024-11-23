# Clase Moneda
class Moneda
  def initialize(number)
    if number < 0
      raise ArgumentError, 'Numero invalido'
    end
    @number = number
  end

  # Metodo que convierte una moneda a otra
  def en(clase)
    case clase
    when :dolares
      Dolar.new(@number)
    when :yens
      Yen.new(@number)
    when :euros
      Euro.new(@number)
    when :bolivares
      Bolivar.new(@number)
    when :bitcoins
      Bitcoin.new(@number)
    else
      raise ArgumentError, 'Clase invalida'
    end
  end

# Metodo que compara dos monedas
def comparar(otra_moneda)
  # Determinar la clase actual como símbolo
  clase_actual = case self.class.name
                 when "Yen" then :yens
                 when "Euro" then :euros
                 when "Bitcoin" then :bitcoins
                 when "Bolivar" then :bolivares
                 when "Dolar" then :dolares
                 else
                   raise ArgumentError, 'Clase invalida'
                 end

  moneda_convertida = otra_moneda.en(clase_actual)

  # Comparar los valores de las monedas
  if @number > moneda_convertida.number
    :mayor
  elsif @number < moneda_convertida.number
    :menor
  else
    :igual
  end
end


  def number
    @number
  end

  def to_s
    "#{@number}"
  end
end

# Clases de las monedas
# Los datos de conversion son actuales
class Dolar < Moneda
  def en(clase)
    case clase
    when :dolares
      Dolar.new(@number)
    when :yens
      Yen.new(@number * 154.46)
    when :euros
      Euro.new(@number * 0.95)
    when :bolivares
      Bolivar.new(@number * 45.98)
    when :bitcoins
      Bitcoin.new(@number * 0.00001)
    else
      raise ArgumentError, 'Clase invalida'
    end
  end

  def to_s
    "#{@number} Dolares"
  end
end

class Yen < Moneda
  def en(clase)
    case clase
    when :dolares
      Dolar.new(@number * 0.0065)
    when :yens
      Yen.new(@number)
    when :euros
      Euro.new(@number * 0.0062)
    when :bolivares
      Bolivar.new(@number * 0.29850)
    when :bitcoins
      Bitcoin.new(@number * 0.000000022)
    else
      raise ArgumentError, 'Clase invalida'
    end
  end

  def to_s
    "#{@number} Yenes"
  end
end

class Euro < Moneda
  def en(clase)
    case clase
    when :dolares
      Dolar.new(@number * 1.05)
    when :yens
      Yen.new(@number * 161.72)
    when :euros
      Euro.new(@number)
    when :bolivares
      Bolivar.new(@number * 48.28)
    when :bitcoins
      Bitcoin.new(@number * 0.0000105)
    else
      raise ArgumentError, 'Clase invalida'
    end
  end

  def to_s
    "#{@number} Euros"
  end
end

class Bolivar < Moneda
  def en(clase)
    case clase
    when :dolares
      Dolar.new(@number * 0.0217)
    when :yens
      Yen.new(@number * 3.35)
    when :euros
      Euro.new(@number * 0.0206)
    when :bolivares
      Bolivar.new(@number)
    when :bitcoins
      Bitcoin.new(@number * 0.000000217)
    else
      raise ArgumentError, 'Clase invalida'
    end
  end

  def to_s
    "#{@number} Bolivares"
  end
end

class Bitcoin < Moneda
  def en(clase)
    case clase
    when :dolares
      Dolar.new(@number * 99170.55)
    when :yens
      Yen.new(@number * 15237248.87)
    when :euros
      Euro.new(@number * 94192.49)
    when :bolivares
      Bolivar.new(@number * 4559861.89)
    when :bitcoins
      Bitcoin.new(@number)
    else
      raise ArgumentError, 'Clase invalida'
    end
  end

  def to_s
    "#{@number} Bitcoins"
  end
end

# Clase Float, para agregar metodos a los numeros
class Float
  def dolares
    Dolar.new(self)
  end

  def yens
    Yen.new(self)
  end

  def euros
    Euro.new(self)
  end

  def bolivares
    Bolivar.new(self)
  end

  def bitcoins
    Bitcoin.new(self)
  end
end

# Pruebas
puts 1.0.dolares.en(:yens)
puts 2.0.yens.en(:dolares)
puts 3.0.euros.en(:bolivares)
puts 8.0.euros.en(:euros)
puts 9.0.bolivares.en(:bolivares)
puts 10.0.bitcoins.en(:bitcoins)
puts 15.0.dolares.en(:euros)
puts 50.0.bolivares.comparar(2.0.dolares)