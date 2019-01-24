class Show #creation d'une class show qui se destine a montrer le tableau du morpion et qui s'actualise

  def consigne

    puts "On aime à dire que le jeu du morpion est vieux comme le monde... en tout cas il doit l'être depuis que les humains savent jouer et dessiner des croix, des traits et des cercles.
Qui n'a jamais joué à ce jeu en classe ? Bon, je date peut-être maintenant il y a les consoles de jeux, les téléphones et leurs textos et les profs à insulter, mais on sait et doit parfois rester jeunes :)

Tout ceci pour dire que ce jeu n'a pas été inventé par la Française des Jeux, même si leur version peut rapporter gros et se joue seul face au hasard du grattage...

Rappel de la règle:
Pour jouer au morpion il faut être à deux. Une version du jeu contre l'ordinateur est dans les cartons mais pour le moment, ce sera contre un autre être pensant (à priori humain) ou contre vous-même. Chaque joueur va à tour de rôle cocher l'une des 9 cases de la grille. Le gagnant est le premier à aligner trois symboles identiques horizontalement, verticalement ou en diagonale. C'est archi simple et pourtant on peut y prendre goût !"



  end

  def puts_array(tableau)#fonction qui affiche le tableau du morpion avec un second tableau qui est un repere

    print tableau[0..2].join("|") + "         " + "0|1|2"
    puts
    print tableau[3..5].join("|") + "         " + "3|4|5"
    puts
    print tableau[6..8].join("|") + "         " + "6|7|8"
    puts

  end

  def gagne(stop,joueur)#seconde methode d'instance permettant d'afficher sur le terminal qui a gagnee.
    if (stop==0)
      puts "felicitation #{joueur} tu as gagnee !"
    end
  end


end
