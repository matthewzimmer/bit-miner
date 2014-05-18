jQuery ->
	# Handles when miner presses a "Add New Field" button
	$(document).on 'click', 'form .add_fields', (event) ->
		time = new Date().getTime()
		regexp = new RegExp($(this).data('id'), 'g')
		$(this).before($(this).data('fields').replace(regexp, time))
		event.preventDefault()

	# Handles when miner presses a "Remove Field" button
	$(document).on 'click', 'form .remove_fields', (event) ->
		$(this).prev('input[type=hidden]').val('1')
		$(this).closest('.fields').hide()
		event.preventDefault()