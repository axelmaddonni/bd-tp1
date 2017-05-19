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

/*
CREATE TABLE `Participante` (
  id_itf int(10) unsigned NOT NULL,
  nombre varchar(45) NOT NULL,
  apellido varchar(45) NOT NULL,
  graduacion varchar(45) NOT NULL,
  foto longblob,
  id_escuela smallint(5) unsigned DEFAULT NULL,
  tipo varchar(1) DEFAULT NULL,
  PRIMARY KEY (id_itf),
  KEY id_escuela_idx (id_escuela),
  CONSTRAINT fk_participante_escuela FOREIGN KEY (id_escuela) REFERENCES Escuela (id_escuela) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
*/

//id_itf nombre apellido graduacion foto id_escuela tipo (coach o competidor)

int randombis() {
	return rand() % 1000 + (rand() % 1000) * 1000 + (rand() % 1000) * 1000000;
}

int main(){
	int idtf = 0;
	string lineaNombre;
	string lineaApellido;
	int graduacion;
	int k = 0;
	//string lineaEscuelas;

	string ouputF = "tablaParticipantes.txt";
	ofstream ouputFile;
	ouputFile.open(ouputF.c_str());

	int i = 0;
	string tipo;
	int vanDeEscuela = 0;

	ifstream nombres;
	nombres.open("nombresCoachsParticipantes.txt");
	if(nombres.is_open()){

		ifstream apellidos;
		apellidos.open("apellidosCoachsParticipantes.txt");
		if(apellidos.is_open()){

			ifstream escuelas;
			escuelas.open("escuelas.txt");
			if(escuelas.is_open()){
				
				if(ouputFile.is_open()){

					while(getline(nombres, lineaNombre) && getline(apellidos, lineaApellido)) {
						ouputFile << idtf;
						ouputFile << "	";

						ouputFile << lineaNombre;
						ouputFile << "	";

						ouputFile << lineaApellido;
						ouputFile << "	";


						graduacion = randombis() %  (6 - 1 + 1) + 1;
						ouputFile << graduacion;
						ouputFile << "	";

						ouputFile << "NULL";
						ouputFile << "	";

						tipo = "p";
						if(i == 0){
							tipo = "h";
						} else {
							if (i == 5){
								i = -1;
								k++;
							}
						}
						i++;

						//idEscuela
						ouputFile << k;
						ouputFile << "	";


						//tipo
						ouputFile << tipo;

						
						ouputFile << endl;

						idtf++;
					}
				}
			}
		}
	}
	return 0;
}
