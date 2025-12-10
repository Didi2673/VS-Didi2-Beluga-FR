function onCreate()
	-- Cette boucle parcourt toutes les notes du jeu avant qu'il ne commence
	for i = 0, getProperty('unspawnNotes.length')-1 do
		-- On vérifie si la note est du type "InstaKill"
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'rulernote' then
			
			-- OPTIONNEL : Changer l'apparence de la note
			-- Ici on utilise la texture "HURTNOTE_assets" qui existe déjà dans le jeu (les mines rouges)
			-- Si tu as ta propre image, mets son nom ici.
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'RULERNOTE_assets');
			
			-- On empêche la note de donner du score ou de la vie si on la rate (car on est censé l'éviter)
			setPropertyFromGroup('unspawnNotes', i, 'hitHealth', '0');
			setPropertyFromGroup('unspawnNotes', i, 'missHealth', '0');
			setPropertyFromGroup('unspawnNotes', i, 'hitCausesMiss', false);
			setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true);
		end
	end
end

-- Cette fonction se déclenche quand le joueur appuie sur une note
function goodNoteHit(id, direction, noteType, isSustainNote)
	-- Si la note appuyée est notre note "InstaKill"
	if noteType == 'rulernote' then
		-- On met la vie à 0, ce qui tue le joueur instantanément
		local health = getProperty('health')

		setProperty('health', health - 0.66);
        
        -- Optionnel : Jouer un son de "Bruitage" ou d'explosion
        playSound('ruler_slap', 1);
	end
end