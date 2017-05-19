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

//CREATE TABLE Escuela (id_escuela int2 unsigned NOT NULL auto_increment PRIMARY KEY, nombre varchar(64) NOT NULL, placa_maestro int2 unsigned NOT NULL);
//ALTER TABLE Escuela ADD CONSTRAINT fk_escuela_maestro
//FOREIGN KEY (placa_maestro) REFERENCES Maestro(placa);

//id_escuela nombre placa_maestro 

int main(){
	int placa_maestro = 0;
	int id_escuela = 0;
	string lineEscuela;

	string ouputF = "tablaEscuelas.txt";
	ofstream ouputFile;
	ouputFile.open(ouputF.c_str());

	ifstream escuelas;
	escuelas.open("escuelas.txt");
	if(escuelas.is_open()){
		if(ouputFile.is_open()){

			while(getline(escuelas, lineEscuela)) {
				ouputFile << id_escuela;
				ouputFile << "	";

				ouputFile << lineEscuela;
				ouputFile << "	";

				ouputFile << placa_maestro;
				
				ouputFile << endl;

				id_escuela++;
				placa_maestro++;
			}
		}
	}
}