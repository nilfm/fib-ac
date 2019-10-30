#include "CacheSim.h"

/* Posa aqui les teves estructures de dades globals
 * per mantenir la informacio necesaria de la cache
 * */


int tags[128];
int valid[128];
int dirty[128];

/* La rutina init_cache es cridada pel programa principal per
 * inicialitzar la cache.
 * La cache es inicialitzada al començar cada un dels tests.
 * */
void init_cache ()
{
	/* Escriu aqui el teu codi */
	for (int i = 0; i < 128; i++) {
		valid[i] = 0; //invalid
		dirty[i] = 0;
	}
}


/* La rutina reference es cridada per cada referencia a simular */ 
void reference (unsigned int address, unsigned int LE)
{
	unsigned int byte;
	unsigned int bloque_m; 
	unsigned int linea_mc;
	unsigned int tag;
	unsigned int miss;
	unsigned int lec_mp;
	unsigned int mida_lec_mp;
	unsigned int esc_mp;
	unsigned int mida_esc_mp;
	unsigned int replacement;
	unsigned int tag_out;

	/* Escriu aqui el teu codi */	
	// Descomponer direccion
	byte = address%32;
	bloque_m = address/32;
	linea_mc = bloque_m%128;
	tag = bloque_m/128;
	
	// Falla si accedemos a una linea no valida o con tag distinto
	miss = (!valid[linea_mc] || tags[linea_mc] != tag);
	
	// Se reemplaza si hay un fallo en una lectura o escritura de una linea valida
	replacement = valid[linea_mc] && miss;

	// Tag a reemplazar, si hay reemplazo
	tag_out = tags[linea_mc];
	
	// Se lee de MP si hay un miss y se escribe si hay un miss dirty
	lec_mp = miss;
	esc_mp = miss && dirty[linea_mc];
	
	// Las lecturas y escrituras son de 32 bytes
	mida_lec_mp = lec_mp*32;
	mida_esc_mp = esc_mp*32;

	// Actualizar la cache, el bit de validez y el bit de dirty
	tags[linea_mc] = tag;
	valid[linea_mc] = 1;
	dirty[linea_mc] = ((!miss) && dirty[linea_mc]) || LE;

	/* La funcio test_and_print escriu el resultat de la teva simulacio
	 * per pantalla (si s'escau) i comproba si hi ha algun error
	 * per la referencia actual
	 * */
	test_and_print (address, LE, byte, bloque_m, linea_mc, tag,
			miss, lec_mp, mida_lec_mp, esc_mp, mida_esc_mp,
			replacement, tag_out);
}

/* La rutina final es cridada al final de la simulacio */ 
void final ()
{
 	/* Escriu aqui el teu codi */ 
  
  
}
