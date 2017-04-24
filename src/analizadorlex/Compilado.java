/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package analizadorlex;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Pablo
 */
public class Compilado {
     public void cargaLexemas(int opcion){
        
            System.out.println("Seleccione una opción:");
            System.out.println("1) Generar");
            System.out.println("2) Ejecutar");
            System.out.println("3) Salir");
            System.out.print("Opcion: ");
            switch (opcion) {
                case 1: {
                    System.out.println("\n*** Generando ***\n");
                    String archLex = "";
                    //if(args.length > 0){
                        System.out.println("\n*** Procesando archivo custom ***\n");
                        //archLex = args[0];
                      //  archLex = "alexico.flex";
                        System.out.println("Lince esto buscas:"+archLex);
                    //}else{
                        System.out.println("\n*** Procesando archivo default ***\n");
                        archLex = "alexico.flex";
                    //}
                    String[] entrada = {archLex};
                    jflex.Main.main(entrada);
                    //Movemos el archivo generado al directorio src
                    File arch = new File("AnalizadorLexico.java");
                    if(arch.exists()){
                        System.out.println("" + arch);
                        Path currentRelativePath = Paths.get("");
                        String nuevoDir = currentRelativePath.toAbsolutePath().toString()
                                + File.separator + "src" + File.separator 
                                + "analizadorlex" + File.separator+arch.getName();
                        File archViejo = new File(nuevoDir);
                        archViejo.delete();
                        if(arch.renameTo(new File(nuevoDir))){
                            System.out.println("\n*** Generado ***\n");
                            System.out.println("\n*** Saliendo automaticamente ***\n");
                            System.exit(0);
                        }else{
                            System.out.println("\n*** No generado ***\n");
                        }
                    }else{
                        System.out.println("\n*** Codigo no existente ***\n");
                    }
                    break;
                }
                case 2: {
                    String entrada = "";
                    System.out.println("\n*** Ejecutando ***\n");
                    //if(args.length > 0){
                        System.out.println("\n*** Procesando archivo custom ***\n");
                      //  entrada = args[0];
                    //}else{
                        System.out.println("\n*** Procesando archivo default ***\n");
                        entrada = "entrada.txt";
                    //}
                    BufferedReader bf = null;
                    try {
                        System.out.println("\n*** Entrando a try ***\n");
                        bf = new BufferedReader(new FileReader(entrada));
                        System.out.println("\n*** Buffer ***\n");
                        AnalizadorLexico a = new AnalizadorLexico(bf);
                        System.out.println("\n*** Analizador lexico ***\n");
                        Yytoken token = null;
                        do {
                            System.out.println("\n*** Estoy en el do ***\n");
                            token = a.nextToken();
                            //componente=a.nextToken().toString();
                        } while (token != null);System.out.println("\n*** Salí del do ***\n");
                    } catch (Exception ex) {
                        Logger.getLogger(Main.class.getName()).log(Level.SEVERE, null, ex);
                    }
                    
                    /*finally {
                        try {
                            //bf.close();
                        } catch (IOException ex) {
                            Logger.getLogger(Main.class.getName()).log(Level.SEVERE, null, ex);
                        }
                    }*/
                    
                    //System.out.println(componente);
                    //System.out.println("\n*** Ejecucion finalizada ***\n");
                      
                    break;
                }
                case 3: {
                    System.out.println("Programa finalizado!\nVuelva pronto.");
                    break;
                }
                default: {
                    System.out.println("Opcion no valida.");
                    break;
                }
            }
        
    
    
    
    
    }
     
    public void generarArchivo(String nombre,String texto){
        File f;
        FileWriter w;
        BufferedWriter bw;
        PrintWriter wr;
        
         try {
            f=new File(nombre);
            w=new FileWriter(f);
            bw=new BufferedWriter(w);
            wr=new PrintWriter(bw);
        
            wr.append("\n"+texto);
            wr.close();
            bw.close();
         } catch (IOException ex) {
             Logger.getLogger(Compilado.class.getName()).log(Level.SEVERE, null, ex);
         }
        
    }
     
}
