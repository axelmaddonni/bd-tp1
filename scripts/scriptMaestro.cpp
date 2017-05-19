#include <string>
#include <set>
#include <iterator>
#include <stdio.h>      // printf fopen fclose fputs 
#include <stdlib.h>     //
#include <vector>
#include <algorithm>    // std::sort
#include <set>
#include <iostream>
#include <fstream>
using namespace std;

//CREATE TABLE Maestro (placa int2 unsigned NOT NULL PRIMARY KEY, nombre varchar(64) NOT NULL, apellido varchar(64) NOT NULL, graduacion (del 1 al 6) int1 unsigned NOT NULL, codigo_pais char(2) NOT NULL);


//placa	nombre	apellido	graduacion	codigo_pais

int randombis() {
	return rand() % 1000 + (rand() % 1000) * 1000 + (rand() % 1000) * 1000000;
}
//rand = randombis() %  (max - min + 1) + min; 
int main(){
	string lineNombre;
	string lineaApellido;
	string lineaPais;
	string codPais;

	bool seLee;
	int pos;

	int placa = 0;
	int graduacion;
	
	string ouputF = "tablaMaestro.txt";
	ofstream ouputFile;
	ouputFile.open(ouputF.c_str());

	ifstream nombres;
	nombres.open("nombres.txt");
	if(nombres.is_open()){
		
		ifstream apellidos;
		apellidos.open("apellidos.txt");
		
		if(apellidos.is_open()){
			
			ifstream paises;
			paises.open("tablaPais.txt");
			if(paises.is_open()){
	
				if(ouputFile.is_open()){

					while(getline(nombres, lineNombre) && getline(apellidos, lineaApellido)) {
						ouputFile << placa;
						ouputFile << "	";

						ouputFile << lineNombre;
						ouputFile << "	";

						ouputFile << lineaApellido;
						ouputFile << "	";

						graduacion = randombis() %  (6 - 1 + 1) + 1;
						ouputFile << graduacion;
						ouputFile << "	";

						seLee = getline(paises, lineaPais);
						pos = lineaPais.find("	");
						codPais = lineaPais.substr(0, pos);
						ouputFile << codPais;

						ouputFile << endl;

						placa++;	


					}
				}
			}
		}
	}
}
