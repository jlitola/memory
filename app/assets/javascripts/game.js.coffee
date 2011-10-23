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

cards = [ ];

count = 0
for imageUrl in pairs
  do (imageUrl) ->
		card1 =
			id: "kortti_"+(count*2)
			url: imageUrl
			content: "<div id='kortti_"+(count*2)+"' class='kortti'><img class='kortti' src='"+imageUrl+"' /></div>"

		card2 =
			id: "kortti_"+(count*2+1)
			url: imageUrl
			content: "<div id='kortti_"+(count*2+1)+"' class='kortti'><img class='kortti' src='"+imageUrl+"' /></div>"

		cards.push(card1);
		cards.push(card2);
		count+=1



setupBoard = () ->
	cardHtmls = (card.content for card in cards)

	console.log(cardHtmls.join(""))
	$('#lauta').html(cardHtmls.join(""))

	for card in cards
		do(card) ->
			$("#"+card.id).click ( () -> 
				$(this).find("img:first").fadeIn('fast') 
			)

	$("#piilota").click( () -> 
		for card in cards 
			do(card) -> 
				$("#"+card.id+" img:first").fadeOut('fast') 
	)

$(document).ready () ->
	setupBoard()
