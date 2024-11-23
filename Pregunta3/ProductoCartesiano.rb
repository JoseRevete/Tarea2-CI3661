# Función que recibe dos arreglos y devuelve el producto cartesiano de ambos arreglos.
def producto_cartesiano(arreglo1, arreglo2)
  for i in 0..arreglo1.length-1
    for j in 0..arreglo2.length-1
      puts "[:#{arreglo1[i]}, #{arreglo2[j]}]"
    end
  end
end

# Pruebas
arreglo1 = [:a, :b, :c]
arreglo2 = [4, 5]
producto_cartesiano(arreglo1, arreglo2)