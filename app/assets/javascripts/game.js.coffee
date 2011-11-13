# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/


card_back = 'http://images.all-free-download.com/images/graphicmedium/fish_91139.jpg';

pairs = [
	'/assets/IMG_0263.JPG',
	'/assets/IMG_0267.jpg',
	'/assets/IMG_0269.jpg',
	'/assets/IMG_0270.JPG',
	'/assets/IMG_0277.jpg',
	'/assets/IMG_0285.jpg',
	'/assets/IMG_0287.jpg',
	'/assets/IMG_0291.JPG',
	'/assets/IMG_5148.JPG',
	'/assets/IMG_8164.jpg',
	'/assets/IMG_8184.JPG',
	'/assets/PICT3735.JPG'
	]

Array::shuffle = -> @sort -> 0.5 - Math.random()

class Game
	@picked = null
	@cards = []
	@foundPairs = 0

	constructor: (pairs) ->
		@cards = []
		@board = []

		count = 0
		for imageUrl in pairs
			@cards.push(new Card count*2, imageUrl);
			@cards.push(new Card count*2+1, imageUrl);
			count+=1

		@board = @cards.slice()
		@board.shuffle()

	card_selected: (id) ->
		card = @cards[id]
		return if card == @picked
		unless @picked
			@picked = card
			card.show()
		else
			card.show()
			if @picked.isPair card
				@foundPairs++
				card.element().unbind('click') 
				@picked.element().unbind('click') 
				@picked = null
			else
				@picked.hide()
				card.hide()
				@picked = null

	cards: ->
		@cards

	setupJS: ->
		$("card").remove()
		$('#board').html (card.content for card in @board).join("")

		for card in @board
			$("#"+card.id).click ->
				card_clicked $(this)

class Card
	constructor: (@id, @url) ->
		@content = "<div data-id='#{@id}' id='card_#{@id}' class='card'><img class='card' src='"+@url+"' /></div>"
		@id = "card_"+@id

	element: ->
		$("##{@id}")

	show: ->
		this.element().find("img:first").fadeIn('fast')

	hide: ->
		this.element().find("img:first").delay(1000).fadeOut('fast')

	isPair: (c) ->
		this != c and this.url == c.url

game = null

card_clicked = (element) ->
	console.log(element.attr("data-id"))
	game.card_selected(element.attr("data-id"))


setupBoard = ->
	game = new Game(pairs)
	game.setupJS()

	$("#new_game").click ->
		game = new Game(pairs)
		game.setupJS()

$(document).ready ->
	setupBoard()
