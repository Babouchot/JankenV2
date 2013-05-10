/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package janken.game;

import janken.persistence.Gamer;
import java.util.Random;

/**
 *
 * @author babouchot
 */
public class GameInstance {

    public enum Janken {

        ROCK, PAPER, SCISSORS, LIZARD, SPOCK
    };
    
    private static final int VICTORY = 5;
    private int playerScore;
    private int cpuScore;
    
    public int getPlayerScore() {
        return playerScore;
    }
    
    public int getCpuScore() {
        return cpuScore;
    }

    public String play(Janken j) {
        boolean playerWin = false;
        boolean equality = false;
        Random r = new Random();
        Janken cpu = Janken.values()[r.nextInt(Janken.values().length)];
        switch (j) {
            case ROCK:
                if (cpu == Janken.ROCK)
                    equality = true;
                else if (cpu == Janken.LIZARD || cpu == Janken.SCISSORS)
                    playerWin = true;
                break;
            case PAPER:
                if (cpu == Janken.PAPER)
                    equality = true;
                else if (cpu == Janken.ROCK || cpu == Janken.SPOCK)
                    playerWin = true;
                break;
            case SCISSORS:
                if (cpu == Janken.SCISSORS)
                    equality = true;
                else if (cpu == Janken.PAPER || cpu == Janken.LIZARD)
                    playerWin = true;
                break;
            case LIZARD:
                if (cpu == Janken.LIZARD)
                    equality = true;
                else if (cpu == Janken.SPOCK || cpu == Janken.PAPER)
                    playerWin = true;
                break;
            case SPOCK:
                if (cpu == Janken.SPOCK)
                    equality = true;
                else if (cpu == Janken.ROCK || cpu == Janken.SCISSORS)
                    playerWin = true;
                break;
        }
        if (equality)
            return cpu.toString();
        else if (playerWin)
            ++playerScore;
        else
            ++cpuScore;
        return cpu.toString();
    }
    
    public boolean playerWin() throws GameInstanceNotFinishedException {
        if (cpuScore < VICTORY && playerScore < VICTORY)
            throw  new GameInstanceNotFinishedException();
        else if (cpuScore < playerScore)
            return true;
        return false;
    }
    
    public class GameInstanceNotFinishedException extends Exception {
        
    }
}
