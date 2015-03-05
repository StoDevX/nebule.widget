command: '~/Desktop/ping-rns.fish 202',
refreshFrequency: 60000,

style: [
	'font-family: monospace',
	'top: 5px', 
	'left: 5px',
	'padding: 5px',
	'background-color: rgba(black, 0.5)',
	'color: white',
	'span',
	'	display: inline-block',
	'span',
	'	padding: 0 0.35em',
	'.off',
	'	color: white',
	'	background-color: red',
].join('\n'),

render: function(result) {
	var comps = JSON.parse(result)

	var str = ''
	for (var comp in comps) {
		if (comps.hasOwnProperty(comp)) {
			str += '<span class="'+(comps[comp]?'on':'off')+'">'+comp+'</span>'
		}
	}
	
	return 'RNS 202: ' + str
}