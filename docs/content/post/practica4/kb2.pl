sing_a_song(ana).
listen_to_music(rodrigo).

listen_to_music(ana) :- sing_a_song(ana).
happy(ana) :- sing_a_song(ana).
happy(rodrigo) :- listen_to_music(rodrigo).
plays_guitar(rodrigo) :- listen_to_music(rodrigo).