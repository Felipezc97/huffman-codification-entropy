import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;

public class Principal {

	public static void main(String[] args) throws IOException {
		// TODO Auto-generated method stub
		FileReader texto=new FileReader("Texto.txt");
		int asciiLetra = 0;
		int numLetras=0;
		int contadorVeces=0;
		double proba=0;
		double entropia=0;
		ArrayList<Integer> textoOriginal = new ArrayList<Integer>();
		ArrayList<Integer> textoOrdenado = new ArrayList<Integer>();
		ArrayList<Integer> diccionario = new ArrayList<Integer>();
		ArrayList<Integer> repeticiones = new ArrayList<Integer>();
		ArrayList<Double> probabilidad = new ArrayList<Double>();
		//GUARDAMOS TODO EL TEXTO EN UN ARRAYLIST
		asciiLetra=texto.read();
		while(asciiLetra != -1) {
			if(asciiLetra==10||asciiLetra==13) {
				//PARA DESCARTAR LOS ENTER
			}else {
				textoOriginal.add(asciiLetra);
				numLetras++;
			}
		    asciiLetra = texto.read();
		}
		System.out.println("El tamaño del texto es: "+numLetras);
		/**********************************/
		/**********************************/
		//ORDENAMOS EL TEXTO
		textoOrdenado=textoOriginal;
		Collections.sort(textoOrdenado);
		//SACAMOS LOS VALORES DE LAS REPETICIONES DE CADA CARACTER EN EL TEXTO
		int primero=textoOrdenado.get(0);
		for(int i=0;i<textoOrdenado.size();i++) {
			if(primero==textoOrdenado.get(i)){
				contadorVeces++;
			}else {
				diccionario.add(primero);
				repeticiones.add(contadorVeces);
				proba=(double)contadorVeces/(double)numLetras;
				probabilidad.add(proba);
				primero=textoOrdenado.get(i);
				contadorVeces=0;
				i=i-1;
			}
		/**********************************/
		}
		/******************************/
		//PROBABILIDAD DEL ÚLTIMO TÉRMINO
		diccionario.add(primero);
		repeticiones.add(contadorVeces);
		proba=(double)contadorVeces/(double)numLetras;
		probabilidad.add(proba);
		/******************************/
		System.out.println("REPETICIONES");
		for(int i=0;i<diccionario.size();i++) {
			System.out.print("El caracter ");
			System.out.print(Character.toChars(diccionario.get(i)));
			double probaformat = Math.round(probabilidad.get(i)*100000.0)/100000.0;
			System.out.println(" se repite "+repeticiones.get(i)+" veces, probabilidad = "+probaformat);
		}
		/*CÁLCULO DE LA ENTROPÍA DE LA FUENTE*/
		for(int i=0;i<probabilidad.size();i++) {
			entropia=entropia+probabilidad.get(i)*log(1/probabilidad.get(i));
		}
		double entropiaformat = Math.round(entropia*100000.0)/100000.0;
		System.out.println("\nLa entropía de la fuente es: "+entropiaformat+" bits/simbolo");
	}
	
	private static double log(double num){
		return (Math.log10(num) / Math.log10(2));
		}
	
}