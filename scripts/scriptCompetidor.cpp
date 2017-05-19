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
CREATE TABLE Competidor (id_itf int(10) unsigned NOT NULL PRIMARY KEY, dni int2 unsigned NOT NULL, genero char(1) NOT NULL, fecha_nacimiento date NOT NULL, peso int1 unsigned NOT NULL);
ALTER TABLE Competidor ADD CONSTRAINT fk_competidor_participante
FOREIGN KEY (id_itf) REFERENCES Participante(id_itf);

id_itf dni genero fecha_nacimiento peso(70-90)
*/
//rand = randombis() %  (max - min + 1) + min; 

int randombis() {
	return rand() % 1000 + (rand() % 1000) * 1000 + (rand() % 1000) * 1000000;
}

int main(){
	int id_itf = 0;
	//int dni; //8 randoms del 1 al 9
	//string doc;
	int a;
	int peso;
	int cantFilas = 64;
	int dnis [] = {36382644, 38474943, 39574938, 34914785, 31472383, 37483931, 31947492, 39025385, 31749253, 32854037, 31482749, 36294729, 39173921, 37162847, 39375916, 39173638, 31728372, 38162834, 37192739, 37163905, 38193056, 38263917, 36382600, 38474901, 39574902, 34914703, 31472304, 37483905, 31947406, 39025807, 31749208, 32854009, 36382610, 38474911, 35749312, 34914713, 31472314, 37439315, 31947416, 39025317, 31749218, 32854019, 36382620, 38474941, 39574932, 34914783, 31472384, 37483935, 31947496, 39025387, 31749258, 32854039, 36382630, 38474931, 39574932, 34914733, 31472334, 37483935, 31947436, 39025337, 31749238, 32854039, 31749240, 32854041};
	// YYYY/MM/DD
	string fechas [] = {"1990/05/10", "1985/02/14", "1986/03/23", "1991/01/30", "1984/10/29", "1986/12/26", "1989/05/16", "1983/07/10", "1987/11/19", "1988/06/22", "1984/04/10", "1982/05/12","1981/10/06","1989/12/18","1986/02/11","1983/02/01","1985/03/01","1987/06/29","1981/10/31","1983/11/02","1984/07/15","1989/07/16", "1990/05/10", "1985/02/14", "1986/03/23", "1991/01/30", "1984/10/29", "1986/12/26", "1989/05/16", "1983/07/10", "1987/11/19", "1988/06/22", "1990/05/10", "1985/02/14", "1986/03/23", "1991/01/30", "1984/10/29", "1986/12/26", "1989/05/16", "1983/07/10", "1987/11/19", "1988/06/22", "1990/05/10", "1985/02/14", "1986/03/23", "1991/01/30", "1984/10/29", "1986/12/26", "1989/05/16", "1983/07/10", "1987/11/19", "1988/06/22", "1990/05/10", "1985/02/14", "1986/03/23", "1991/01/30", "1984/10/29", "1986/12/26", "1989/05/16", "1983/07/10", "1987/11/19", "1988/06/22","1989/07/16", "1990/05/10"};
	

	string ouputF = "tablaCompetidores.txt";
	ofstream ouputFile;
	ouputFile.open(ouputF.c_str());
	
		
	if(ouputFile.is_open()){

		for(int i = 0; i < cantFilas; i++){

			ouputFile << id_itf;
			ouputFile << "	";
			a = randombis() %  (1 - 0 + 1);
			
			ouputFile << dnis[i];
			ouputFile << "	";


			if(i % 16 < 8){
				ouputFile << "F"; //femenino
			} else {
				ouputFile << "M"; //masculino
			}
			ouputFile << "	";

			//fechaNac YYYY/MM/DD
			ouputFile << fechas[i];
			ouputFile << "	";

			peso = randombis() %  (95 - 70 + 1) + 70; 
			ouputFile << peso;

			id_itf++;
			ouputFile << endl;

		}
	}

	return 0;
}