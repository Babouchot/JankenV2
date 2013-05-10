/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package janken.game;

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

    public boolean play(Janken j) {
        boolean playerWin = false;
        Random r = new Random();
        Janken cpu = Janken.values()[r.nextInt(Janken.values().length)];
        switch (j) {
            case ROCK:
                if (cpu == Janken.LIZARD || cpu == Janken.SCISSORS)
                    playerWin = true;
                break;
            case PAPER:
                if (cpu == Janken.ROCK || cpu == Janken.SPOCK)
                    playerWin = true;
                break;
            case SCISSORS:
                if (cpu == Janken.PAPER || cpu == Janken.LIZARD)
                    playerWin = true;
                break;
            case LIZARD:
                if (cpu == Janken.SPOCK || cpu == Janken.PAPER)
                    playerWin = true;
                break;
            case SPOCK:
                if (cpu == Janken.ROCK || cpu == Janken.SCISSORS)
                    playerWin = true;
                break;
        }
        if (playerWin)
            ++playerScore;
        else
            ++cpuScore;
        return playerWin;
    }
    
    public boolean playerWin() throws GameInstanceNotFinishedException {
        if (cpuScore < VICTORY && playerScore < VICTORY)
            throw  new GameInstanceNotFinishedException();
        else if (cpuScore < playerScore)
            return true;
        return false;
    }
    
    private class GameInstanceNotFinishedException extends Exception {
        
    }
}
