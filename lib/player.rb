class Player# creation class player pour sauver les noms et symbole des joueurs

  def player

    puts "Quel nom veux tu choisir?"
    name = gets.chomp
    puts "Quel symbole veux tu choisir : X ou O?"
    symbol = gets.chomp
    hash={}
    hash[name]=symbol
    return hash[name]=symbol #retourne sous un hash le name et symbole
  end


end
