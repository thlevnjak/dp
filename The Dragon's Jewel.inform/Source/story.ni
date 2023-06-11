"The Dragon's Jewel" by Tomislav Hlevnjak

Release along with an interpreter.
Release along with a website.
Release along with the introductory booklet.

[POCETAK IGRE I PRVA PROSTORIJA]

When play begins:
	say "You have reached the Mushroom forest. The sky is getting darker and darker but the moon is your ally and helps you see some of your next steps. But once you go in the forest though, it gets very, very dark..."

A bag is an openable, closed container.
The player carries the bag.

The Mushroom forest is a room. 
The description is "It is very dark and scary in the forest, but a few moon rays do show some of its beauty. You can hear dragon's roar in the distance to the north, so you are probably on the right path..."

mushrooms are in the Mushroom forest. 
They are edible. 
The description is "You see brown mushrooms few steps from you as the moonlight finds its way through the tree branches and they look edible. You might want to take them, if not for yourself maybe for a certain creature?"

A candle is here. 
The description is "The candle [if the candle has been lit]is partially burnt[otherwise]is not lit[end if]."


[DIO ZA PALJENJE/GASENJE SVIJECE]

The block burning rule is not listed in the check burning rules.

Instead of burning the lit candle:
	say "The candle is already burning!"

Check burning:
	if the noun is not the candle, say "You cannot burn [The noun]."

Carry out burning the candle:
	if we have not taken the candle:
		say "To light the candle you need to pick it up!";
	otherwise:
		now the candle is lit;
		say "The candle is now burning!"

Instead of examining the lit candle, say "The candle now burns and helps you see a bit more."

Understand "blow out [something]" as blowing out. 
Understand "blow [something] out" as blowing out. 
Blowing out is an action applying to one thing.

Carry out blowing out the candle:
	now the candle is unlit.

Report blowing out:
	if the noun is the candle and the candle was lit, say "You blow out [the noun].";
	otherwise say "You blow on [the noun], to little effect."


[DRUGI DIO - KOPANJE KLJUCA]

Underlying relates various things to one room. 
The verb to underlie (he underlies, they underlie, he underlaid, it is underlaid, he is underlying) implies the underlying relation. 
The verb to be under implies the underlying relation. 
The verb to be beneath implies the underlying relation.

A diggable room is a kind of dark room. 
A diggable room has a number called the dig depth. 
The dig depth of a diggable room is usually zero.
Definition: A room is dug if it is a diggable room and the dig depth of it is not zero.
Digging is an action applying to nothing. 
Understand "dig", "dig hole/here" and "dig in ground/dirt/earth" as digging.

Before digging:
	now the noun is the location of the player.

Check digging:
	if the noun is not a diggable room, say “It is pointless to dig here, you will just tire yourself.” instead;
	if the dig depth of the noun is greater than three, say “There is no need to dig any further down, you will just tire yourself.” instead;
	if the player does not hold the spade:
		move spade to the player;
		say “You need something to dig with! Here's a nice spade, now dig!” instead;

Carry out digging:
	increment the dig depth of the noun;
	if the dig depth of the noun is one, update backdrop positions.

After digging when something is under the noun and the dig depth of the location of the player is greater than three:
	say “You gather up [a list of things which underlie the noun] hidden underneath [the printed name of the noun].”;
	now everything under the noun is in the noun;
	now everything under the noun is not under the noun.

Report digging:
	say “[if the dig depth of the noun is one]You start digging[otherwise]You dig even further[end if].”.

When play begins:
	move the hole backdrop to all dug rooms.

The hole is a backdrop. 
The hole is not scenery. 
The initial appearance of the hole is “There is a dug hole here.” 
The description of the hole is “That is a deeply dug hole right there...phew!”

The Shadowed vale forest is a diggable room. 
The Shadowed vale forest is north of Mushroom forest. 
The description is "[if player carries a candle]The shadowed vale forest is even darker. Luckily we have the candle with us so we can see a bit better. Those dragon roars are getting louder and louder... [otherwise]It's hard to see where to walk. We could use a candle right now...[end if]"

The spade is in the Shadowed vale forest. 
The description is "That is a peculiar place to leave a spade. However, the ground around it has a marked X. Perhaps there is something hidden in the ground!"

The wooden chest is under the Shadowed vale forest. 
The wooden chest is a closed openable container. 
The description of the wooden chest is “The chest has a painted dragon on the side. It looks like it doesn't need a key to be opened”. 
The jewel key is in the wooden chest.  
The jewel key unlocks the jewel chest. 
The description of the jewel key is “This dragon shaped key must have something to do with the Dragon's jewel you are looking for.” 
The spear is in the wooden chest.
The description of the spear is "Looks like someone left a weapon that could be the end of the nasty dragon!".


[TRECI DIO - ZMAJ]
The Dragon forest is a room. 
The Dragon forest is north of Shadowed vale forest. 
The  description is "[if vermithrax is not poisoned]This is the infamous forest of the dragon Vermithrax. He guards the entrance to the cave where my treasure awaits. How do I get around him?[otherwise]The dragon is dead! You are free to enter the cave.[end if]"

The platinum door is a door. 
It is closed and locked. 
The matching key of the platinum door is the platinum key.
The platinum key unlocks it. 
The platinum door is north of the Dragon forest and south of the Dragon cave.

The dragon Vermithrax is an animal in the Dragon forest. 
The description is "The mighty dragon Vermithrax. You can feed him with mushrooms or attack him with spear!" 
The dragon can be dead or alive or poisoned. 
The dragon is alive.

[NAPASTI GA DA SE MAKNE]

The block attacking rule is not listed in the check attacking rulebook.

Attacking the Vermithrax with spear is an action applying to one visible thing.
Understand "attack [Vermithrax] with spear" as attacking the Vermithrax with spear.

Check attacking the Vermithrax with spear:
	if the player is not carrying a spear, say "You don't have that weapon!" instead;
	if the dragon is dead, say "You already killed the dragon, there is no point in attacking him!" instead;

After attacking the Vermithrax with spear:
	if the dragon is poisoned:
		say "[line break]You pierce through the [Vermithrax]'s scales and plunge the spear through his heart. He drops down dead! [line break]The lady Seraphon is now safe, but it's a shame you couldn't take that treasure...";
		now the dragon is dead;
		if player carries the treasure:
			end the story finally saying "[bold type]THE END!";
		otherwise:
			if player carries the jewel key:
				say "[line break]Since you have the jewel key, you might want to take the treasure as well!";
				continue the action;
			otherwise:
				end the story finally saying "[bold type]THE END!";
	otherwise:
		say "[line break]You pierce through the [Vermithrax]'s scales and plunge the spear through his heart. He drops down dead. There is a hidden doorway which he was guarding. You also see a shiny platinum key around his neck, and you take it.";
		now the dragon is dead;
		say "[line break]The platinum key has moved into your inventory!";
	now the description of the Dragon forest is "The dragon is no more. The Dragon forest is now a peaceful place!";

Carry out attacking the Vermithrax with spear:
	move platinum key to the player;

Report attacking:
	say "Violence isn't the answer to this problem.".
	
Attacking the Vermithrax with sword is an action applying to one visible thing.
Understand "attack [Vermithrax] with sword" as attacking the Vermithrax with sword.

Check attacking the Vermithrax with sword:
	if the player is not carrying a sword, say "You don't have that weapon!" instead;
	if the dragon is dead, say "You already killed the dragon, there is no point in attacking him!" instead;

After attacking the Vermithrax with sword:
	say "[line break]You cut through the [Vermithrax]'s scales and plunge the sword into his heart. He drops down dead.";
	now the dragon is dead;
	if the player carries the treasure:
		 say "[line break]You have done it! You have the treasure, you killed the dragon and saved lady Seraphon!";
		end the story finally saying "[bold type]THE END!";
	otherwise:
		if player carries the jewel key:
			say "[line break]Since you have the jewel key, you might want to take the treasure as well!";
			continue the action;
		otherwise:
			say "[line break]The lady Seraphon is now safe, but it's a shame you couldn't take that treasure...";
			end the story finally saying "[bold type]THE END!";
	now the description of the Dragon forest is "The dragon is no more. The Dragon forest is now a peaceful place";
	now Vermithrax is nowhere;


[NAHRANITI GA GLJIVAMA]

Feeding mushrooms is an action applying to one visible thing. 
Understand "feed [Vermithrax] with mushrooms" as feeding mushrooms.
Understand "feed mushrooms to [Vermithrax]" as feeding mushrooms.

Check feeding mushrooms:
	if the noun is not Vermithrax, say "You can't feed this with mushrooms" instead.
	
Instead of feeding mushrooms:
	if the noun is Vermithrax:
		say "[line break]You feed the mushrooms to [Vermithrax]. He likes them very much. But after a while they seem to upset him so he leaves in a hurry. While flying away he unknowingly drops a platinum key behind him. You hurry up and take it.";
		now mushrooms are nowhere;
		now the dragon is poisoned;
		now Vermithrax is nowhere;
		move platinum key to the player;
		say "[line break]The platinum key has moved into your inventory!";
		now the description of the Dragon forest is "The dragon is poisoned, but the poison is not deadly. He can be back!";
	otherwise:
		say "[line break]There is no reaction."


[SPILJA S BLAGOM]

The Dragon cave is a room. 
The description is "Inside the cave there is the Dragon jewel - the most valuable treasure of them all. But who is that person next to the jewel chest?"

The jewel chest is in the Dragon cave. 
The jewel chest is a closed and locked openable container. 
The description is "This is it. The grand prize! I hope you found the key to unlock this chest!"
The treasure is in the jewel chest. 
The description is "This is the Dragon Jewel you have been looking for. The brightest jewel of them all!"

Lady Seraphon is a woman. 
Lady Seraphon is in the Dragon cave. 
Lady Seraphon can be free or not free.
Lady Seraphon is not free.
The description is "A beautiful blonde haired woman standing next to the jewel chest! She carries a long shiny sword. You can ask her about her or ask about treasure!"
Lady Seraphon carries a sword.

After going to the Dragon cave:
	if Lady Seraphon is not free:
		now lady Seraphon is free;
		continue the action;
	otherwise:
		continue the action;

Instead of asking Lady Seraphon about "her":
	if dragon is not nowhere:
		say "Seraphon: [italic type]Hello, dear adventurer! I am lady Seraphon, owner of this treasure. Have you come to save me from the dragon?";
	otherwise:
		say "Seraphon: [italic type]Hello, brave adventurer. I am lady Seraphon, owner of this treasure. Thank you for killing the dragon for me!"

Instead of asking Lady Seraphon about "jewel/chest/treasure":
	if the player is not carrying the spear:
		say "Seraphon: [italic type]All of this treasure is yours if you get me out of this cave!";
		say "Here, take this sword so you can kill the dragon if he returns!";
		if player is not carrying a sword:
			say "[line break][roman type]The sword has moved into your inventory!";
			move a sword to the player;
		otherwise:
			say "[line break][roman type]You already have the sword in your inventory!";
	otherwise:
		if the dragon is poisoned:
			say "[roman type]Seraphon: [italic type]All of this treasure is yours if you get me out of this cave!";
			say "You better prepare your spear because the dragon might return!";
		otherwise:
			say "[roman type]Seraphon: [italic type]Now that you killed the dragon, you don't need weapons!"

Carry out going to the Dragon forest from Dragon cave:
	if dragon is poisoned:
		now the description of the Dragon forest is "Oh no! The dragon has returned, you need to kill him to escape!";
		now dragon Vermithrax is in the Dragon forest;
		continue the action;
	if dragon is dead:
		if the player carries the jewel key:
			now the description of the Dragon forest is "There lies the dead dragon! You have killed him and the forest is now a safe place. [line break][line break]Since you have the jewel key, you can go and take the treasure!";
		otherwise:
			now the description of the Dragon forest is "There lies the dead dragon! You have killed him and the forest is now a safe place.";

After going to the Dragon forest from Dragon cave:
	if dragon is dead:
		if player carries the treasure:
			end the story finally saying "[bold type]THE END!";
		otherwise:
			if player carries the jewel key:
				continue the action;
			otherwise:
				end the story finally saying "[bold type]THE END!";
	otherwise:
		continue the action;

Instead of taking the treasure:
	move the treasure to the player;
	if the dragon is dead:
		say "[line break]You have done it! You have the treasure, you killed the dragon and saved lady Seraphon! To end the game go to the Dragon forest!";
	otherwise:
		say "[line break]You have the treasure and you freed the lady Seraphon. All that remains is to kill the dragon Vermithrax!";

Instead of dropping treasure:
	say "It is pointless to drop what you came looking for, am I right?" instead;

Instead of dropping jewel key:
	say "It is pointless to drop what you came looking for, am I right?" instead;