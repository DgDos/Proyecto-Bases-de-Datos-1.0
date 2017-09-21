/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.RandomAccessFile;

/**
 *
 * @author LabingXEON
 */
public class Empresa {

    public String guardar(String trabajo, String hora, String empresa) throws FileNotFoundException, IOException {
        RandomAccessFile ra = new RandomAccessFile("sustentacion", "rw");
        File file = new File("sustentacion.txt");
        System.out.println(file.getAbsolutePath());
        if (ra.length() == 0) {
            ra.writeInt(1);
        } else {
            int cantidadDatos = ra.readInt();
            ra.seek(4 + cantidadDatos * 120);
        }
        String retorno = destruir(ra.getFilePointer(), trabajo, hora, empresa, "sustentacion");
        if (retorno.equals("guardado")) {
            ra.seek(0);
            int cantidadDatos = ra.readInt();
            ra.seek(0);
            ra.writeInt(cantidadDatos + 1);
        }
        return retorno;

    }

    private String destruir(long filePointer, String trabajo, String hora, String empresa, String sustentacion) {
        try {
            RandomAccessFile raf = new RandomAccessFile(sustentacion, "rw");
            char[] palabra1 = trabajo.toCharArray();
            raf.seek(filePointer);
            if (trabajo.length() > 19 || hora.length() > 19 || empresa.length() > 19) {
                return "No se pudo guardar";
            }
            int cont = 0;
            for (char a : palabra1) {
                raf.writeChar(a);
                cont++;
            }
            raf.writeChar('.');
            raf.seek(filePointer + 40);
            char[] palabra2 = hora.toCharArray();
            cont = 0;
            for (char a : palabra2) {
                raf.writeChar(a);
                cont++;
            }
            raf.writeChar('.');
            raf.seek(filePointer + 80);
            char[] palabra3 = empresa.toCharArray();
            cont = 0;
            for (char a : palabra3) {
                raf.writeChar(a);
                cont++;
            }
            raf.writeChar('.');
            return "guardado";

        } catch (IOException ex) {
            ex.printStackTrace();
        }
        return "";
    }

    public String consulta(String hora) throws FileNotFoundException, IOException {
        RandomAccessFile ra = new RandomAccessFile("sustentacion", "rw");
        String guardado = "";
        hora += ".";
        char[] h = hora.toCharArray();
        ra.seek(0);
        int cantidadDatos = ra.readInt();
        for (int i = 1; i <= cantidadDatos; i++) {
            ra.skipBytes(40);
            int cont = 0;
            boolean t = true;
            while (true) {
                char a = ra.readChar();
                if (h[cont] == '.' && '.' == a) {
                    break;
                } else {
                    if (h[cont] == '.' || a == '.') {
                        t = false;
                        break;
                    } else {
                        if (h[cont] != a) {
                            t = false;
                            break;
                        }
                    }
                }
                cont++;
            }
            if (t == true) {
                ra.seek(4 + (i - 1) * 120);
                while (true) {
                    char a = ra.readChar();
                    if (a != '.') {
                        guardado += a;
                    } else {
                        break;
                    }
                }
                guardado+=" ,";
                ra.seek(4 + (i - 1) * 120+40);
                while (true) {
                    char a = ra.readChar();
                    if (a != '.') {
                        guardado += a;
                    } else {
                        break;
                    }
                }
                guardado+=" ,";
                ra.seek(4 + (i - 1) *120+ 80);
                while (true) {
                    char a = ra.readChar();
                    if (a != '.') {
                        guardado += a;
                    } else {
                        break;
                    }
                }
                guardado+=".";
            }
            ra.seek(4 + i * 120);
            guardado += "<br>";
        }
        return guardado;
    }
}
