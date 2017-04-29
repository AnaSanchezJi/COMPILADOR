/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package analizadorlex;

import java.awt.Dimension;
import java.awt.Graphics;
import java.awt.Image;
import javax.swing.JPanel;

/**
 *
 * @author Camberos
 */

public class ImagenPanel extends JPanel {
    
    private Image imagen;
    public ImagenPanel(Image imagen){
        this.imagen=imagen;
        Dimension dimension = new Dimension(imagen.getWidth(null),imagen.getHeight(null));
        this.setPreferredSize(dimension);
        this.setMaximumSize(dimension);
        this.setMinimumSize(dimension);
        this.setSize(dimension);
        this.setLayout(null);
    }
    
    @Override
    protected void paintComponent(Graphics g){
     g.drawImage(imagen,0,0,null);
    }
    
}
