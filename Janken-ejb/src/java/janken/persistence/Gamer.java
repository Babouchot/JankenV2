/*
* To change this template, choose Tools | Templates
* and open the template in the editor.
*/
package janken.persistence;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.Id;

/**
*
* @author maureill
*/
@Entity
public class Gamer implements Serializable {
    
    public enum Etat {CONNECTE, ABSENT, INGAME};
    
    @Id
    private String mail;
    private String pseudo;
    private String mdp;
    private Etat etat;
    private int victoires;
    private int defaites;
    
    
    private static final long serialVersionUID = 1L;
    /*@Id
@GeneratedValue(strategy = GenerationType.AUTO)
private Long id;*/

    public Gamer() {
        
    }

    public Gamer(String mail, String pseudo, String mdp, Etat etat, int victoires, int defaites) {
        this.mail = mail;
        this.pseudo = pseudo;
        this.mdp = mdp;
        this.etat = etat;
        this.victoires = victoires;
        this.defaites = defaites;
    }
    
    public Gamer(String mail, String pseudo, String mdp) {
        this.mail = mail;
        this.pseudo = pseudo;
        this.mdp = mdp;
        this.etat = Etat.ABSENT;
        this.victoires = 0;
        this.defaites = 0;
    }
    

    public String getGamerMail() {
        return mail;
    }

    public void setGamerMail(String mail) {
        this.mail = mail;
    }

    public String getPseudo() {
        return pseudo;
    }

    public String getMdp() {
        return mdp;
    }

    public Etat getEtat() {
        return etat;
    }

    public int getVictoires() {
        return victoires;
    }

    public int getDefaites() {
        return defaites;
    }
    
    

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (mail != null ? mail.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Gamer)) {
            return false;
        }
        Gamer other = (Gamer) object;
        if ((this.mail == null && other.mail != null) || (this.mail != null && !this.mail.equals(other.mail))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "persistence.Gamer[ id=" + mail + " ]";
    }
    
}