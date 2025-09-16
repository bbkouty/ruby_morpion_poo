# 🎮 Morpion en Ruby

Un petit jeu de Morpion (Tic-Tac-Toe) en ligne de commande, codé en Ruby pur avec une approche orientée objet.

# 📂 Structure du projet
````
morpion-ruby/
├── app.rb
├── Gemfile
├── lib/
│   ├── board.rb
│   ├── board_case.rb
│   ├── game.rb
│   ├── player.rb
│   └── show.rb
└── spec/
    ├── spec_helper.rb
    ├── board_spec.rb
    ├── board_case_spec.rb
    ├── game_spec.rb
    ├── player_spec.rb
    └── show_spec.rb
````
# 🚀 Installation & exécution
1. Cloner le projet
````
git clone <git repository>
cd ruby_morpion_poo
````
2. Lancer le jeu
````
bundle install
ruby app.rb
````

# 🕹️ Règles du jeu
- Deux joueurs s’affrontent :
    - Joueur 1 joue avec X
    - Joueur 2 joue avec O
- Chaque joueur choisit une case du plateau (par exemple A1, B3).
- Le premier joueur à aligner 3 symboles (ligne, colonne, diagonale) gagne.
- Si le plateau est rempli sans gagnant → Match nul.