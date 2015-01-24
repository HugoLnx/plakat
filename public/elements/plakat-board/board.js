/**
 * Rect
 */
var Rect = function(x, y, width, height) {
	this.x = x || 0;
	this.y = y || 0;
	this.width = width || 0;
	this.height = height || 0;
};

Rect.prototype.getX = function() { return this.x; };
Rect.prototype.setX = function(x) { this.x = x; };
Rect.prototype.getY = function() { return this.y; };
Rect.prototype.setY = function(y) { this.y = y; };
Rect.prototype.getWidth = function() { return this.width; };
Rect.prototype.setWidth = function(width) { this.width = width; };
Rect.prototype.getHeight = function() { return this.height; };
Rect.prototype.setHeight = function(height) { this.height = height; };
Rect.prototype.getMaxX = function() { return this.x + this.width; };
Rect.prototype.getMaxY = function() { return this.y + this.height; };

/**
 * Poster
 */
var Poster = function(node, rect) {
	this.node = node;
	this.rect = rect || new Rect(0, 0, node.offsetWidth, node.offsetHeight);
	this.free = true;

	this.node.style.position = "absolute";
	this.setX(this.rect.x);
	this.setY(this.rect.y);
};

Poster.prototype.getX = function() { return this.rect.getX(); };
Poster.prototype.setX = function(x) {
	this.rect.setX(x);
	this.node.style.left = x + "px";
};

Poster.prototype.getY = function() { return this.rect.getY(); };
Poster.prototype.setY = function(y) {
	this.rect.setY(y);
	this.node.style.top = y + "px";
};

Poster.prototype.getWidth = function() { return this.rect.getWidth(); };
Poster.prototype.getHeight = function() { return this.rect.getHeight(); };
Poster.prototype.getMaxX = function() { return this.rect.getMaxX(); };
Poster.prototype.getMaxY = function() { return this.rect.getMaxY(); };

Poster.prototype.place = function(rect) {
	this.setX(rect.getX());
	this.setY(rect.getY());
};

/**
 * Board
 */
var Board = function(container, posters, gutter) {
	this.container = container;
	this.posters = [];
	this.gutter = gutter || 0;
	this.queue = [];
	this.placed = [];
	this.firstLine = true;
	this.fiqueiPuto = null;

	if (posters)
	{
		for (var i in posters)
		{
			if (typeof posters[i] != "object") continue;

			this.posters.push(new Poster(posters[i]));
		}
	}

	window.addEventListener('resize', this.arrange.bind(this));
	this.arrange();
};

// Arranges the posters inside the container
Board.prototype.arrange = function() {
	this.queue = [];
	this.placed = [];
	this.firstLine = true;

	if (!this.posters.length)
	{
		return;
	}

	for (var i in this.posters) {
		var poster = this.posters[i];
		poster.free = true;
		poster.place(new Rect(0, 0));

		this.queue.push(poster);
	}

	if (this.firstLine)
	{
		for (var i in this.posters)
		{
			var poster = this.posters[i];
			var place = this.getNextEmptyPlace();

			if (poster.getWidth() + place.getX() > this.container.offsetWidth)
			{
				this.firstLine = false;
				break;
			}

			poster.place(place);
			this.placed.push(poster);
			this.queue.splice(this.queue.indexOf(poster), 1);
		}
	}

	if (!this.firstLine)
	{
		while (this.queue.length)
		{
			var place, poster;

			do
			{
				place = this.getNextEmptyPlace();
				poster = this.choosePosterForPlace(place, this.queue);
			}
			while (!poster);

			if (place.getMaxX() - place.getX() - poster.getWidth() < 0) { continue; }

			poster.place(place);
			this.placed.push(poster);
			this.queue.splice(this.queue.indexOf(poster), 1);

			for (var i in this.queue)
			{
				if (this.queue[i].getWidth() + this.gutter <= place.getMaxX() - poster.getMaxX())
				{
					this.fiqueiPuto.free = true;
					break;
				}
			}
		}
	}

	var ys = [];

	for (var i in this.placed)
	{
		ys.push(this.placed[i].getMaxY());
	}

	var maxY = Math.max.apply(null, ys);
	this.container.style.height = maxY + "px";

};

// Returns the next empty place inside the container
Board.prototype.getNextEmptyPlace = function() {
	var c = this.container;
	var rect = new Rect(0, 0, c.offsetWidth, c.offsetHeight);

	if (this.placed.length)
	{
		if (this.firstLine)
		{
			var lastPoster = this.placed[this.placed.length - 1];
			rect.setX(lastPoster.getMaxX() + this.gutter);
			rect.setWidth();
		}
		else
		{
			var ysEls = [];
			var ys = [];

			for (var i in this.placed)
			{
				var poster = this.placed[i];

				if (poster.free)
				{	
					ysEls.push(poster);
					ys.push(poster.getMaxY());
				}
			}

			var minY = Math.min.apply(null, ys);
			var posterAbove = ysEls[ys.indexOf(minY)];
			var limits = this.getLimits(posterAbove, this.placed);

			this.fiqueiPuto = posterAbove;
			posterAbove.free = false;

			rect = new Rect(limits.left, minY + this.gutter, limits.right - limits.left, 0);
		}
	}

	return rect;
};

// Get limits of a free place
Board.prototype.getLimits = function(poster, posters) {
	var leftLimit = 0 - this.gutter;
	var rightLimit = this.container.offsetWidth + this.gutter;

	for (var i in posters)
	{
		if (posters[i].getY() <= poster.getMaxY() + this.gutter && posters[i].getMaxY() > poster.getMaxY())
		{
			var x = posters[i].getX();
			var maxX = posters[i].getMaxX();

			if (x >= poster.getMaxX() && x < rightLimit)
			{
				rightLimit = x;
			}
			else if (maxX > leftLimit && maxX < rightLimit)
			{
				leftLimit = maxX;
			}
		}
	}

	return {
		left: leftLimit + this.gutter,
		right: rightLimit - this.gutter
	}
};

// Choose the better poster for the given place
Board.prototype.choosePosterForPlace = function(place, posters) {
	var rank = [];
	var limit = 10;

	for (var i in posters)
	{
		if (i >= limit) break;

		var test = posters[i].getWidth() / place.getWidth();
		rank[i] = test <= 1 ? test : -1;
	}

	var maxRank = Math.max.apply(null, rank);

	if (maxRank === -1) return false;

	var poster = posters[rank.indexOf(maxRank)];

	return poster;
};