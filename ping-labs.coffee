command: '''
	echo "{" &&
	echo "\\"201\\":" && nebule.widget/ping.sh rms 201 12 && echo "," &&
	echo "\\"202\\":" && nebule.widget/ping.sh rns 202 21 && echo "," &&
	echo "\\"203\\":" && nebule.widget/ping.sh rns 203 16 &&
	echo "}"
'''
refreshFrequency: 600000  # 10 minutes

style: '''
	top: 3px
	left: 3px

	font-family: Source Code Pro
	font-size: 11px
	padding: 4px 6px

	-webkit-font-smoothing: antialiased
	background-color: rgba(black, 0.5)
	color: white

	span
		display: inline-block
		width: 2em
		text-align: right

	.off
		color: black
		font-weight: bold

	x-list
		width: 24em
		border-left: solid 1px white
		margin-left: 0.75em

	x-line
		display: flex
'''

render: (result) ->
	data = JSON.parse(result)

	str = ''
	for room, computers of data
		roomString = ''
		for computer, hasPower of computers
			className = if hasPower then 'on' else 'off'
			if computer.length == 1 then computer = '0' + computer
			roomString += "<span class='#{className}'>#{computer}</span>"
		str += "<x-line><x-room>#{room}</x-room><x-list>#{roomString}</x-list></x-line>"

	return str
