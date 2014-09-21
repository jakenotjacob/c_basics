#!/usr/bin/env ruby
#
require 'colorize'


class TetrisBoard
    attr_accessor :matrix, :score, :cleared_lines
    def initialize(width = 10, depth = 22)
        @depth = depth
        @width = width
        @score = 0
        @cleared_lines = 0
        @active_tetramino = nil
        @matrix = Array.new(depth) { Array.new(width) }
    end
    
    TETRAMINOS = {
        I: [
            [nil, nil, nil, nil],
            ["c", "c", "c", "c"],
            [nil, nil, nil, nil],
            [nil, nil, nil, nil]
           ],
        O: [ 
            ["y", "y"],
            ["y", "y"]
           ],
        Z: [
            ["r", "r", nil],
            [nil, "r", "r"],
            [nil, nil, nil]
           ],
        S: [
            [nil, "g", "g"],
            ["g", "g", nil],
            [nil, nil, nil]
           ],
        J: [
            ["b", nil, nil],
            ["b", "b", "b"],
            [nil, nil, nil]
           ],
        L: [
            [nil, nil, "o"],
            ["o", "o", "o"],
            [nil, nil, nil]
           ],
        T: [
            [nil, "m", nil],
            ["m", "m", "m"],
            [nil, nil, nil]
           ]
    }

    def print_matrix
        @matrix.each { |row|
            row.each { |cell|
                if cell.nil?
                    print "." + " "
                else
                    print cell + " "
                end
            }
            print "\n"
        }
    end
    
    def clear_check
        @matrix.map! { |row|
            if row.include? nil
                 row
            else
                @score += 100
                @cleared_lines += 1
                Array.new(@width)
            end
        }
    end
    
    def clear_matrix
        @matrix = Array.new(@depth) { Array.new(@width) }
    end
    
    def update_matrix
        rows = []
        ( 0..(@depth-1) ).each do |row|
            line = $stdin.readline.split(" ")
            line.map! { |ele|
                if ele == "."
                    nil
                else
                    ele
                end
            }
            rows << line
        end
        @matrix = rows
    end

    def rotate_tetramino(direction)
        if direction == 1
            @active_tetramino = @active_tetramino.transpose
        else
            @active_tetramino = @active_tetramino.transpose.reverse
        end
    end

    def activate_tetramino(tet_sym)
        @active_tetramino = (tet_sym)
    end

    def active_tetramino()
        case @active_tetramino
        when :O
            TETRAMINOS[:O].each { |row|
                puts row.join " "
            }
        when :Z
            TETRAMINOS[:Z].each { |row|
                row.each { |ele|
                    if ele == nil
                        print ". "
                    else
                        print ele + " "
                    end
                }
                print "\n"
            }
        when :S
            TETRAMINOS[:S].each { |row|
                row.each { |ele|
                    if ele == nil
                        print ". "
                    else
                        print ele + " "
                    end
                }
                print "\n"
            }
        when :J
            TETRAMINOS[:J].each { |row|
                row.each { |ele|
                    if ele == nil
                        print ". "
                    else
                        print ele + " "
                    end
                }
                print "\n"
            }
        when :L
            TETRAMINOS[:L].each { |row|
                row.each { |ele|
                    if ele == nil
                        print ". "
                    else
                        print ele + " "
                    end
                }
                print "\n"
            }
        when :T
            TETRAMINOS[:T].each { |row|
                row.each { |ele|
                    if ele == nil
                        print ". "
                    else
                        print ele + " "
                    end
                }
                print "\n"
            }
        when :I
            length = TETRAMINOS[@active_tetramino].length
            puts ". "*length
            puts TETRAMINOS[@active_tetramino].join " "
            (length-2).times {
                puts ". "*length
            }
        end
    end

    def read_input(entry)
        case entry
        when "g" #Update
            update_matrix
        when "p" #Print
            print_matrix
        when "s" #Check for lines to clear
            clear_check
        when "c" #Empty matrix
            clear_matrix

        #Tetraminos
        when "I"
            activate_tetramino(entry.to_sym)
        when "O"
            activate_tetramino(entry.to_sym)
        when "Z"
            activate_tetramino(entry.to_sym)
        when "S"
            activate_tetramino(entry.to_sym)
        when "J"
            activate_tetramino(entry.to_sym)
        when "T"
            activate_tetramino(entry.to_sym)
        when "L"
            activate_tetramino(entry.to_sym)

        #Tetramino actions
        when "("
            rotate_tetramino(clockwise)
        when "t" #Display active tetramino
            active_tetramino()
        when "?n" #Get lines cleared
            puts cleared_lines
        when "?s" #Get score
            puts score
        when "q"
            exit
        end
    end

end


@game = TetrisBoard.new
loop do
    entry = $stdin.readline.chomp
    if entry.length > 2
        entries = entry.split(" ")
        entries.each { |e|
            @game.read_input(e)
        }
    end
    @game.read_input(entry)
end
