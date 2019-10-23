#include "CacheSim.h"

/* Posa aqui les teves estructures de dades globals
 * per mantenir la informacio necesaria de la cache
 * */

int tags[64][2];
int lru[64];
int valid[64][2];

/* La rutina init_cache es cridada pel programa principal per
 * inicialitzar la cache.
 * La cache es inicialitzada al començar cada un dels tests.
 * */
void init_cache ()
{
    totaltime=0.0;
	/* Escriu aqui el teu codi */
	for (int i = 0; i < 64; i++) {
		lru[i] = 0;
		valid[i][0] = valid[i][1] = 0;
	}
}

/* La rutina reference es cridada per cada referencia a simular */ 
void reference (unsigned int address)
{
	unsigned int byte;
	unsigned int bloque_m; 
	unsigned int conj_mc;
	unsigned int via_mc;
	unsigned int tag;
	unsigned int miss;	   // boolea que ens indica si es miss
	unsigned int replacement;  // boolea que indica si es reemplaça una linia valida
	unsigned int tag_out;	   // TAG de la linia reemplaçada
	float t1,t2;		// Variables per mesurar el temps (NO modificar)
	
	t1=GetTime();
	/* Escriu aqui el teu codi */
	
	byte = address%32;
	bloque_m = address/32;
	conj_mc = bloque_m%64;
	tag = bloque_m/64;
	
	miss = 1;
	for (int i = 0; i < 2 && miss; i++) {
		if (valid[conj_mc][i] && tags[conj_mc][i] == tag) {
			miss = 0;
			via_mc = i;
			lru[conj_mc] = 1 - i;
		}
	}
	
	if (miss) via_mc = lru[conj_mc];
	replacement = miss && valid[conj_mc][via_mc];
	if (miss) {
		if (replacement) tag_out = tags[conj_mc][via_mc];
		tags[conj_mc][via_mc] = tag;
		lru[conj_mc] = 1 - via_mc;
	}
	valid[conj_mc][via_mc] = 1;

	/* La funcio test_and_print escriu el resultat de la teva simulacio
	 * per pantalla (si s'escau) i comproba si hi ha algun error
	 * per la referencia actual. També mesurem el temps d'execució
	 * */
	t2=GetTime();
	totaltime+=t2-t1;
	test_and_print2(address, byte, bloque_m, conj_mc, via_mc, tag,
			miss, replacement, tag_out);
}

/* La rutina final es cridada al final de la simulacio */ 
void final ()
{
 	/* Escriu aqui el teu codi */ 
  
  
}
