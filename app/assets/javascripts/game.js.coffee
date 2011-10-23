# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/


card_back = 'http://images.all-free-download.com/images/graphicmedium/fish_91139.jpg';

pairs = [
	'http://www.gravatar.com/avatar/e4ef0a73ae8ebe96720e9281d0849ae7',
	'http://images.all-free-download.com/images/graphicmedium/fish_91139.jpg',
	'http://images.all-free-download.com/images/graphicmedium/fish_bowl_89046.jpg',
	'/assets/muori.jpg',
	'http://www.gravatar.com/avatar/e4ef0a73ae8ebe96720e9281d0849ae7',
	'http://www.gravatar.com/avatar/e4ef0a73ae8ebe96720e9281d0849ae7',
	'http://www.gravatar.com/avatar/e4ef0a73ae8ebe96720e9281d0849ae7',
	'http://www.gravatar.com/avatar/e4ef0a73ae8ebe96720e9281d0849ae7',
	'http://www.gravatar.com/avatar/e4ef0a73ae8ebe96720e9281d0849ae7',
	'http://www.gravatar.com/avatar/e4ef0a73ae8ebe96720e9281d0849ae7',
	'http://www.gravatar.com/avatar/e4ef0a73ae8ebe96720e9281d0849ae7',
	'http://www.gravatar.com/avatar/e4ef0a73ae8ebe96720e9281d0849ae7',
	'http://www.gravatar.com/avatar/e4ef0a73ae8ebe96720e9281d0849ae7',
	'http://www.gravatar.com/avatar/e4ef0a73ae8ebe96720e9281d0849ae7'
	];


class Card
	constructor: (@id, @url) ->
		@id = "card_"+@id
		@content = "<div id='"+@id+"' class='card'><img class='card' src='"+@url+"' /></div>"

setupBoard = ->
	cards = [];
	count = 0
	for imageUrl in pairs
		cards.push(new Card count*2, imageUrl);
		cards.push(new Card count*2+1, imageUrl);
		count+=1

	$('#board').html (card.content for card in cards).join("")

	for card in cards
		$("#"+card.id).click -> 
			$(this).find("img:first").fadeIn('fast') 

	$("#piilota").click -> 
		for card in cards 
			$("#"+card.id+" img:first").fadeOut('fast') 

$(document).ready ->
	setupBoard()
