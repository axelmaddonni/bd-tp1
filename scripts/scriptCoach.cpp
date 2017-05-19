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
CREATE TABLE Coach (id_itf int(10) unsigned NOT NULL PRIMARY KEY);
ALTER TABLE Coach ADD CONSTRAINT fk_coach_participante
FOREIGN KEY (id_itf) REFERENCES Participante(id_itf);

id_itf

*/

int main(){

	string line;
	int tam;
	int i;

	string ouputF = "tablaCoachs.txt";
	ofstream ouputFile;
	ouputFile.open(ouputF.c_str());

	ifstream participantes;
	participantes.open("tablaParticipantes.txt");
	if(participantes.is_open()){

		if(ouputFile.is_open()){

			while(getline(participantes, line)){
				tam = line.size();
				if(line[tam - 1] == 'h'){
					i = 0;
					while(line[i] != '	'){
					ouputFile << line[i];
					i++;
					}
				ouputFile << endl;
				}

			}

		}
	}
	return 0;
}