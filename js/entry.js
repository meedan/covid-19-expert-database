(function() {
    $(document).ready(function() {

        tippy('a.glossary-term', {
			animation: 'shift-away',
            theme: 'term',
            allowHTML: true,
            interactive: true,
            interactiveBorder: 30,
            arrow: false,
		});

    });
})();