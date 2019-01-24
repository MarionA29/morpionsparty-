class Game #creation class regroupant toutes les regles du jeu du morpions ainsi que le fonctionnement pure et dur  du jeux



  def initialize_array #initialise le tableau ou toutes les cases dispose dun underscore pour signifier qu'elles sont vides

    tableau= ["_","_","_","_","_","_","_","_","_"]
    tableau[0]="_"
    return tableau #retourne le tableau initialise

  end


  def action_player #par action on entend que le joueur va saisir une valeur entre 0 et 8.
    puts "ou veux-tu mettre ton symbole(0..8)"
    placement= gets.chomp.to_i
    return placement #on retorune la valeur saisie
  end


  def actualisation_tableau(player,initialisation_tableau,action_joueur)#l'actualisation du tableau se faire en fonction de la valeur saisi par l'utilisateur(placement)
    initialisation_tableau[action_joueur]= player[0]#on indique la case du tableau a remplir avec le symbole
    puts player[0]
    return initialisation_tableau #puis on retourne l'ensemble du tableau avec la modification

  end




  def win?(player,tableau)#on appel une fonction qui a chaque remplissage d'une case va se demander si il n'y a pas une ligne faite
#si oui alors return stop=0 ce qui permet de dire au programme d'arreter la boucle qui depend du stop
    if tableau[0]==player[0] && tableau[1]==player[0] && tableau[2]==player[0]
      puts "partie fini tu veux rejouer ?!"
      return stop= 0
    end

    if tableau[3]==player[0] && tableau[4]==player[0] && tableau[5]==player[0]
      puts "partie fini ! tu veux rejouer ?"
      return stop= 0
    end

    if tableau[6]==player[0] && tableau[7]==player[0] && tableau[8]==player[0]
      puts "partie fini !tu veux rejouer ?"
      return stop= 0
    end


    if tableau[0]==player[0] && tableau[3]==player[0] && tableau[6]==player[0]
      puts "partie fini !tu veux rejouer ?"
      return stop= 0
    end

    if tableau[1]==player[0] && tableau[4]==player[0] && tableau[7]==player[0]
      puts "partie fini ! tu veux rejouer ?"
      return stop= 0
    end

    if tableau[2]==player[0] && tableau[5]==player[0] && tableau[8]==player[0]
      puts "partie fini !tu veux rejouer ?"
      return stop= 0
    end

    if tableau[2]==player[0] && tableau[4]==player[0] && tableau[8]==player[0]
      puts "partie fini ! tu veux rejouer ?"
      return stop= 0
    end


    if tableau[6]==player[0] && tableau[4]==player[0] && tableau[2]==player[0]
      puts "partie fini !tu veux rejouer ?"
      return stop= 0
    end

    if tableau[0]==player[0] && tableau[4]==player[0] && tableau[8]==player[0]
      puts "partie fini !tu veux rejouer ?"
      return stop= 0
    end

    return 1 #si aucune condition n'a ete rempli alors le stop est egal a 1 et le programme continu sa boucle
  end

def end_tour?(tour)#dans le cas ou les joueurs ont rempli le tableau, le programme doit s'arreter de lui meme
  if tour>=8
    puts "partie nulle...."
    stop=0 #si tour qui s'est increment dans le app est sup a 8 alors stop=0 ce qui  fait sortir de la boucle
    return stop
  end

  return stop=1#dans le cas contraire stop est egal a 1
end


  def placement_good?(placement,tableau,joueur1,joueur2)# verifie si l'utilisateur a choisi une place sur le tableau qui est vide et non deja rempli par un symbol qui peut etre soit le sien ou celui de l'adversaire
    while (tableau[placement]==joueur1[0] || tableau[placement]==joueur2[0])
      placement =Game.new.action_player

    end

  end

  def restart?#demande au joueur s'il veut rejouer ? pour cela il suffit d'appuyer sur 0
    puts "si  oui appui sur 0 ;) si non une autre touche.... :'("
    restart=gets.chomp.to_i
    return restart

  end

  def save_hight_score(joueur1,joueur2)# a chaque fin de partie le joueur qui a gagne sera inscrit sur un fichier dans le db

    file=File.open("./db/hight_score.txt","a+")
    file.write ("#{joueur1} a gagne #{joueur2} ")


  end



end
