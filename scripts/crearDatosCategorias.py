import itertools as it

def writeRow(file, id_cat, l):
  if len(l) == 0:
    file.write(str(id_cat) + "\n")
  else:
    file.write(str(id_cat) + ", ")
    for i in xrange(len(l)):
      if i < len(l) - 1:
        file.write("'" + l[i] + "'" + ", ")
      else:
        file.write("'" + l[i] + "'" + "\n")

def main():
  catFile = open("datosCategoria.csv", "w")
  catIndFile = open("datosCategoriaIndividual.csv", 'w')
  catEqFile = open("datosCategoriaEquipo.csv", 'w')
  catCombIndFile = open("datosCategoriaCombateIndividual.csv", 'w')
  catFormIndFile = open("datosCategoriaFormasIndividual.csv", 'w')
  catRotIndFile = open("datosCategoriaRotura.csv", 'w')
  catSaltoIndFile = open("datosCategoriaSalto.csv", 'w')
  #catCombEqFile = open("datosCategoriaCombateEquipo.csv", 'w')
  #catFormEqFile = open("datosCategoriaFormasEquipo.csv", 'w')

  catFile.write("id_categoria, sexo, tipo, edadMin, edadMax\n")
  catIndFile.write("id_categoria, tipo\n")
  catEqFile.write("id_categoria, tipo\n")
  catCombIndFile.write("id_categoria, pesoMin, pesoMax\n")
  catFormIndFile.write("id_categoria, graduacion\n")
  catSaltoIndFile.write("id_categoria\n")
  catRotIndFile.write("id_categoria\n")

  id_categoria = 0
  sexo = ['M', 'F']
  subCat = ['I', 'E']
  subCatInd = ['C', 'F', 'S', 'R']
  subCatEq = ['C', 'F']
  edadRango = ["18', '25", "26', '31", "31', '35"]
  pesoRango = ["60', '70", "71', '80", "81', '100"]
  graduacion = ['1', '2', '3', '4', '5', '6']
  
  for x in it.product(sexo, subCat, edadRango):
    if x[1] == 'I':
        for s in subCatInd:
          if s == 'C':
            for p in pesoRango:
              writeRow(catFile, id_categoria, x)
              writeRow(catIndFile, id_categoria, [s])
              writeRow(catCombIndFile, id_categoria, [p])
              id_categoria += 1
          elif s == 'F':
            for g in graduacion:
              writeRow(catFile, id_categoria, x)
              writeRow(catIndFile, id_categoria, [s])
              writeRow(catFormIndFile, id_categoria, [g])
              id_categoria += 1
          elif s == 'S':
            writeRow(catFile, id_categoria, x)
            writeRow(catSaltoIndFile, id_categoria, [])
            id_categoria += 1
          elif s == 'R':
            writeRow(catFile, id_categoria, x)
            writeRow(catRotIndFile, id_categoria, [])
            id_categoria += 1
    elif x[1] == 'E':
      writeRow(catFile, id_categoria, x)
      writeRow(catEqFile, id_categoria, [s])
      id_categoria += 1

  catFile.close()
  catIndFile.close()
  catEqFile.close()
  catCombIndFile.close()
  catFormIndFile.close()
  catSaltoIndFile.close()
  catRotIndFile.close()


main()
