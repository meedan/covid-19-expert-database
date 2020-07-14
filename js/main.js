(function() {
    $(document).ready(function() {

        tippy('a.glossary-term', {
			animation: 'shift-away',
            theme: 'light',
            allowHTML: true,
            interactive: true,
            interactiveBorder: 30,
		});

    });
})();