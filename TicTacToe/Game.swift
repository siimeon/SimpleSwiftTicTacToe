//
//  Game.swift
//  TicTacToe
//
//  Created by Simo Haakana on 03/12/2017.
//  Copyright © 2017 Simo Haakana. All rights reserved.
//

import Foundation

class Game {
    var array = [String!](repeating: "", count: 9)
    var nextTurn = "X"
    var result = ""
    
    func start() {
    }
    
    func next() -> String {
        let turn = self.nextTurn
        if (self.nextTurn == "X") {
            self.nextTurn = "O"
        } else {
            self.nextTurn = "X"
        }
        return turn
    }
    
    func allMovesPlayed() -> Bool {
        for cell in self.array {
            if (cell == "") {
                return false
            }
        }
        return true
    }
    
    func gameEnded() -> Bool {
        if (self.xHasWon() || self.oHasWon() || self.allMovesPlayed()) {
            return true
        }
        return false
    }
    
    func checkWinLine(player: String, cell1: Int, cell2: Int, cell3: Int) -> Bool {
        return player == self.array[cell1] && player == self.array[cell2] && player == self.array[cell3]
    }
    
    func hasPlayerWon(player: String) -> Bool {
        if (self.checkWinLine(player: player, cell1: 0, cell2: 1, cell3: 2)) {
            return true
        }
        if (self.checkWinLine(player: player, cell1: 3, cell2: 4, cell3: 5)) {
            return true
        }
        if (self.checkWinLine(player: player, cell1: 6, cell2: 7, cell3: 8)) {
            return true
        }
        if (self.checkWinLine(player: player, cell1: 0, cell2: 3, cell3: 6)) {
            return true
        }
        if (self.checkWinLine(player: player, cell1: 1, cell2: 4, cell3: 7)) {
            return true
        }
        if (self.checkWinLine(player: player, cell1: 2, cell2: 5, cell3: 8)) {
            return true
        }
        if (self.checkWinLine(player: player, cell1: 0, cell2: 4, cell3: 8)) {
            return true
        }
        if (self.checkWinLine(player: player, cell1: 6, cell2: 4, cell3: 2)) {
            return true
        }
        return false
    }
    
    func xHasWon() -> Bool {
        return hasPlayerWon(player: "X")
    }
    
    func oHasWon() -> Bool {
        return hasPlayerWon(player: "O")
    }
    
    func play(cell: Int) -> String {
        if (!self.gameEnded()) {
            if (self.array[cell] == "") {
                self.array[cell] = next()
                print(self.array[cell])
                if (self.xHasWon()) {
                    self.result = "X won"
                    print("X won")
                } else if (self.oHasWon()) {
                    self.result = "O won"
                    print("O won")
                }
                return self.array[cell]
            }
        } else {
            print("Game over")
        }
        return ""
    }
}


