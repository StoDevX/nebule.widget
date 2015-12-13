command: 'nebule.widget/ping.sh rns 202 21'
refreshFrequency: 600000  # 10 minutes

style: '''
	top: 3px
	left: 294px

	font-family: Source Code Pro
	font-size: 11px
	padding: 4px 6px

	-webkit-font-smoothing: antialiased
	background-color: rgba(black, 0.5)
	color: white

	span
		display: inline-block
		padding: 0px 6px 0px 6px

	.off
		color: black
		font-weight: bold
'''

render: (result) ->
	comps = JSON.parse(result)

	str = ''
	for comp of comps
		className = if comps[comp] then 'on' else 'off'
		str += "<span class='#{className}'>#{comp}</span>"

	return "202 |#{str}"
