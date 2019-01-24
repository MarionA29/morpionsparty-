require_relative "lib/morpionsystem"
require_relative "lib/show.rb"
require_relative "lib/player.rb"

class Apps#creation d'une class apps qui permet de faire la gestion des differentes class et s'occupe de les appeler au bon moment. c'est notre chef d'orchestre !!!

  def launch
    Show.new.consigne
    joueur1=Player.new.player #appel fonction pour creer les joueurs
    joueur2=Player.new.player

    stop=1#defini une variable a 1
    tour=0#defini variable a 0
    restart=0

    while restart==0 # boucle ou tant que restart est egal a 0 la boucle se repete. ctte boucle permet de rejouer au jeu

      tableau=Game.new.initialize_array#variable qui va stocker notre tableau initialise, et c'est cette variable qui subira les modifications
      while (stop==1)#boucle stop qui permet d'arreter le programme des  qu'un des joueurs a fait une ligne ou que le match est nul
        placement =Game.new.action_player# variable qui va stocker la position (le placement) qu'a renseigner l'utilisateur
        Game.new.placement_good?(placement,tableau,joueur1,joueur2)#verifie que cette emplacement est bien libre, dans le cas contraire, il lui demande de saisir une autre position
        tableau= Game.new.actualisation_tableau(joueur1,tableau,placement)#actualisation de la variable tableau, qui prend en compte le placement saisi juste au dessus par le joueur1
        Show.new.puts_array(tableau)#appel du show pour montrer visuellement a l'utilisateur ce qu'il y a dedans
        stop=Game.new.win?(joueur1,tableau)#variable stop peut etre modifie (donc casse la condition de la boucle) si on a une ligne
        Show.new.gagne(stop,joueur1)#si joueur1 gagne alors un message disant que le joueur1 a gagne

        if (stop==1)#si stop n;est plus egal a 1 cela veut dire le joueur a gagne (refer a stop=Game.new.Wine?) donc pas besoin de demander cela au second player
          placement =Game.new.action_player#pareil qu'en haut mais pour le second player
          Game.new.placement_good?(placement,tableau,joueur1,joueur2)
          tableau= Game.new.actualisation_tableau(joueur2,tableau,placement)
          Show.new.puts_array(tableau)
          stop=Game.new.win?(joueur2,tableau)
          Show.new.gagne(stop,joueur2)
          tour+=1 #important ici on incremente de un et ce dans la condition du if stop==0 car pour qu'un tour soit compter il faut que les deux joueurs jouent !
        end

        if stop==1#verifie que tour n'est pas egal a 8 s'il est alors fin de la parti
          stop=Game.new.end_tour?(tour)#en effet stop sera modifie et ne vaudra plus un mais 0
        end

      end
      Game.new.save_hight_score(joueur1,joueur2)#on sort de la boucle stop, donc le jeu est fini, maintenant on enregistre la partie qui vient de se faire.
      restart=Game.new.restart?#restart correspond a la condition pour rejouer, si l'user saisie une autre valeur que 0 alors on considere que les joueurs ne veulent plus jouer.c'est la fin du game
      stop=0#dans le cas ou on veut rejouer il faut dire que stop est egal a nouveau a 0 sinon on ne pourrait plus entrer dans le jeu.
    end
  end
end



Apps.new.launch#appel de la class qui declenchera toute la partition que nous venons de commenter.
