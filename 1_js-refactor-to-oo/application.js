view = {
    addADieField: function() { $('.dice').append('<div class="die">0</div>'); },
    renderDice: function() { $('.die').each(view.renderDie); },
    renderDie: function(k, die) { $(die).text(rollDie); }
}

addADie = function() { view.addADieField(); }
rollDice = function() { view.renderDice(); }

rollDie = function() { return Math.floor((Math.random()*6)+1); };

$(document).ready(function() {
  $('#roller button.add').on('click', addADie );
  $('#roller button.roll').on('click', rollDice );
});
