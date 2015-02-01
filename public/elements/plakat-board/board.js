var Board = function(container, posters) {
	this.container = container;
	this.columnCount = 1;
	this.column = null;
	this.originalPosters = [];
	this.posters = [];
	this.columns = [];
	this.currentColumn = 0;

	this.container.style.textAlign = "center";

	for (var i = 0; i < posters.length; i++) {
		this.originalPosters.push(posters[i]);
	}

	window.addEventListener('resize', (function() {
		this.arrange();
	}).bind(this));
}

// Add poster
Board.prototype.addPoster = function(poster) {
	if (this.currentColumn == this.columns.length) {
		this.currentColumn = 0;
	}

	this.originalPosters.push(poster);
	this.posters.push(poster);
	this.columns[this.currentColumn].appendChild(poster);
	this.currentColumn++;
}

// Create column
Board.prototype.createColumn = function() {
	var column = document.createElement('div');
	column.setAttribute('class', 'column');
	column.style.display = "inline-block";
	column.style.verticalAlign = "top";

	this.column = this.container.shadowRoot.appendChild(column);
	this.columns.push(this.column);

	return column;
}

// Remove columns
Board.prototype.removeColumns = function() {
	var columns = this.container.shadowRoot.querySelectorAll('.column');

	for (var i = 0; i < columns.length; i++) {
		this.container.shadowRoot.removeChild(columns[i]);
	}

	this.columns = [];
}

// Arrange
Board.prototype.arrange = function() {
	this.posters = [];
	this.currentColumn = 0;

	this.removeColumns();
	this.createColumn();

	var columnCount = parseInt(this.container.offsetWidth / this.column.scrollWidth);

	for (var i = 0; i < columnCount - 1; i++) {
		this.createColumn();
	}

	for (var i = 0; i < this.originalPosters.length; i++) {
		var poster = this.originalPosters[i];

		this.posters.push(poster);

		if (this.currentColumn == this.columns.length) {
			this.currentColumn = 0;
		}

		this.columns[this.currentColumn].appendChild(poster);
		this.currentColumn++;
	}
}