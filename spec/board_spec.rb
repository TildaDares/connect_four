require './lib/board'
describe Board do
  describe "#check_for_all_wins" do
    board = Board.new
    it "returns true when there's a vertical win" do
      @@board_array = [["", "", "", "", "", "", ""], 
      ["", "", "", "", "", "", ""], 
      ["", "", "", "", "", "", ""], 
      ["", "", "", "", "", "", ""], 
      ["\e[0;31;49m◉\e[0m", "\e[0;31;49m◉\e[0m", "\e[0;31;49m◉\e[0m", "", "", "", ""], 
      ["\e[0;31;49m◉\e[0m", "\e[0;32;49m◈\e[0m", "\e[0;32;49m◈\e[0m", "\e[0;32;49m◈\e[0m", "\e[0;32;49m◈\e[0m", "", ""]]
      expect(board.check_for_all_wins).to eql(true)
    end

    it "returns true when there's a horizontal win" do
      @@board_array = [["", "", "", "", "", "", ""], 
      ["", "", "", "", "", "", ""], 
      ["", "\e[0;31;49m◉\e[0m", "", "", "", "", ""], 
      ["", "\e[0;31;49m◉\e[0m", "", "", "", "", ""], 
      ["\e[0;31;49m◉\e[0m", "\e[0;31;49m◉\e[0m", "", "", "", "", ""], 
      ["\e[0;31;49m◉\e[0m", "\e[0;31;49m◉\e[0m", "\e[0;31;49m◉\e[0m", "", "", "", ""]]
      expect(board.check_for_all_wins).to eql(true)
    end

    it "returns true when there's a win in the left diagonal of the board" do
      @@board_array = [["", "", "", "", "", "", ""], 
      ["", "", "", "", "", "", ""], 
      ["", "", "", "\e[0;32;49m◈\e[0m", "", "", ""], 
      ["", "", "\e[0;32;49m◈\e[0m", "\e[0;34;49m◉\e[0m", "", "", ""], 
      ["", "\e[0;32;49m◈\e[0m", "\e[0;34;49m◉\e[0m", "\e[0;31;49m◉\e[0m", "", "", ""], 
      ["\e[0;32;49m◈\e[0m", "\e[0;34;49m◉\e[0m", "\e[0;31;49m◉\e[0m", "\e[0;34;49m◉\e[0m", "", "\e[0;34;49m◉\e[0m", ""]]
      expect(board.check_for_all_wins).to eql(true)
    end

    it "returns true when there's a win in the right diagonal of the board" do
      @@board_array = [["", "", "", "", "", "", ""], 
      ["", "", "", "", "", "", ""], 
      ["\e[0;32;49m◈\e[0m", "", "", "", "", "", ""], 
      ["\e[0;31;49m◉\e[0m", "\e[0;32;49m◈\e[0m", "", "", "", "", ""], 
      ["\e[0;34;49m◉\e[0m", "\e[0;34;49m◉\e[0m", "\e[0;32;49m◈\e[0m", "", "", "", ""], 
      ["\e[0;31;49m◉\e[0m", "\e[0;31;49m◉\e[0m", "\e[0;31;49m◉\e[0m", "\e[0;32;49m◈\e[0m", "\e[0;31;49m◉\e[0m", "", "\e[0;31;49m◉\e[0m"]]
      expect(board.check_for_all_wins).to eql(true)
    end

    it "returns false when there are no wins at all" do
      @@board_array = [["\e[0;34;49m◉\e[0m", "", "", "", "", "", ""], 
      ["", "", "", "", "", "", ""], 
      ["", "", "", "", "", "", ""], 
      ["", "", "\e[0;34;49m◉\e[0m", "", "", "", ""], 
      ["", "", "", "", "", "", ""], 
      ["", "", "", "", "", "", ""]]
      expect(board.check_for_all_wins).to eql(false)
    end
  end

  describe "#check_for_full_board" do
    board = Board.new
    it "returns true when the board's full" do
      @@board_array = [["\e[0;32;49m◈\e[0m", "\e[0;31;49m◉\e[0m", "\e[0;31;49m◉\e[0m", "\e[0;31;49m◉\e[0m", "\e[0;31;49m◉\e[0m", "\e[0;32;49m◈\e[0m", "\e[0;31;49m◉\e[0m"], 
      ["\e[0;31;49m◉\e[0m", "\e[0;32;49m◈\e[0m", "\e[0;31;49m◉\e[0m", "\e[0;31;49m◉\e[0m", "\e[0;31;49m◉\e[0m", "\e[0;31;49m◉\e[0m", "\e[0;31;49m◉\e[0m"], 
      ["\e[0;32;49m◈\e[0m", "\e[0;32;49m◈\e[0m", "\e[0;31;49m◉\e[0m", "\e[0;32;49m◈\e[0m", "\e[0;31;49m◉\e[0m", "\e[0;31;49m◉\e[0m", "\e[0;32;49m◈\e[0m"], 
      ["\e[0;31;49m◉\e[0m", "\e[0;32;49m◈\e[0m", "\e[0;31;49m◉\e[0m", "\e[0;31;49m◉\e[0m", "\e[0;31;49m◉\e[0m", "\e[0;31;49m◉\e[0m", "\e[0;31;49m◉\e[0m"], 
      ["\e[0;34;49m◉\e[0m", "\e[0;34;49m◉\e[0m", "\e[0;32;49m◈\e[0m", "\e[0;31;49m◉\e[0m", "\e[0;31;49m◉\e[0m", "\e[0;31;49m◉\e[0m", "\e[0;31;49m◉\e[0m"], 
      ["\e[0;31;49m◉\e[0m", "\e[0;31;49m◉\e[0m", "\e[0;31;49m◉\e[0m", "\e[0;32;49m◈\e[0m", "\e[0;31;49m◉\e[0m", "\e[0;31;49m◉\e[0m", "\e[0;31;49m◉\e[0m"]]
      expect(board.check_for_full_board).to eql(true)
    end

    it "returns false when board is not full" do
      @@board_array = [["", "", "", "", "", "", ""], 
      ["", "", "", "", "", "", ""], 
      ["", "", "", "", "", "", ""], 
      ["\e[0;31;49m◉\e[0m", "\e[0;32;49m◈\e[0m", "", "", "", "", ""], 
      ["\e[0;34;49m◉\e[0m", "", "\e[0;32;49m◈\e[0m", "", "", "", ""], 
      ["", "\e[0;31;49m◉\e[0m", "", "\e[0;32;49m◈\e[0m", "", "", "\e[0;31;49m◉\e[0m"]]
      expect(board.check_for_full_board).to eql(false)
    end

    it "returns false when board is empty" do
        @@board_array = [["", "", "", "", "", "", ""], 
      ["", "", "", "", "", "", ""], 
      ["", "", "", "", "", "", ""], 
      ["", "", "", "", "", "", ""], 
      ["", "", "", "", "", "", ""], 
      ["", "", "", "", "", "", ""]]
      expect(board.check_for_full_board).to eql(false)
    end
  end
end