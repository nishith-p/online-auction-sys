(function($) {
	var $user_quickview_toggler = $('.user-quickview'),
		$cart_toggler = $('.account-cart-quickview'),
		$email_toggler = $('.account-email-quickview'),
		$settings_toggler = $('.account-settings-quickview');
		
		$user_quickview_toggler.hover( toggleDropdown, toggleDropdown );
		$settings_toggler.on( 'click', { selector: true }, toggleDropdown );
		$email_toggler.on( 'click', { selector: true }, toggleDropdown );
		$cart_toggler.on( 'click', { selector: true }, toggleDropdown );

		function toggleDropdown( e ) {
			var $dropdown = $(this).find('.dropdown-2'),
				data = e.data,
				selector = false;
				if ( data !== null ) {
					selector = data.selector;
				}

			if ( $dropdown.hasClass( 'closed' ) ) {
				closeDropdowns();
				$dropdown
					.removeClass( 'closed' )
					.addClass( 'open' );
				if ( selector ) {
					$(this).addClass('active');
				}

			} else {
				closeDropdowns();
				$dropdown
					.removeClass( 'open' )
					.addClass( 'closed' );
				if ( selector ) {
					$(this).removeClass('active');
				}
			}
		}

		function closeDropdown() {
			$(this)
				.removeClass( 'open' )
				.addClass( 'closed' );

			$(this)
				.parent()
				.removeClass('active');
		}

		function closeDropdowns() {
			$user_board = $('.user-board');

			$user_board
				.find('.dropdown-2')
				.each( closeDropdown );
		}
})(jQuery);