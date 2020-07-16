(function() {
    $(document).ready(function() {

        tippy('a.glossary-term', {
			animation: 'shift-away',
            theme: 'term',
            allowHTML: true,
            interactive: true,
            duration: [300, 50],
            arrow: false,
		});

    });
})();