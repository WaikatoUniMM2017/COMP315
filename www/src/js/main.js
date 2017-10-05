var types = {};
var teams = ["Beige",
    "Cornflower Blue",
    "Purple",
    "Aqua",
    "Midnight Blue",
    "Medium Purple",
    "Light Slate Gray",
    "Olive Drab",
    "Blue Violet",
    "Lime Green",
    "Medium Turquoise",
    "Green Yellow",
    "Dark Violet",
    "Medium Orchid",
    "Pale Violet Red",
    "Tomato",
    "Slate Blue",
    "Alice Blue",
    "Brown",
    "Lawn Green"];
var players = [];
var addedPlayers = [];
var date = new Date();

$(document).ready(function () {
    $(window).bind('hashchange', onHashChange);

    function onHashChange(e) {
        console.debug("Hash changed to: " + window.location.hash);
        var hash = $.uriAnchor.makeAnchorMap();
        console.debug(hash);

        hash.date = date;
        hash.accountTypes = types;
        hash.teams = teams;
        hash.rounds = getRoundCount(hash.teams);
        hash.players = players;
        hash.addedPlayers = addedPlayers;

        switch (hash.page) {
            default:
                getSection().html(
                    templates[hash.page](hash) + "<!--" + hash.page + "-->"
                );
                try {
                    bindings[hash.page]();
                } catch (ex) {
                }
                break;
        }
    };

    $(".pure-menu-link").click(function (e) {
        e.preventDefault();
        if (this.getAttribute("value") == "addPlayer") {
            $.ajax({
                url: '/api/type',
                // data: data,
                success: function (argument) {
                    types = JSON.parse(argument).data;
                    updateData("time", Date.now());
                    updateData("page", "addPlayer");
                },
                error: function (argument) {
                    console.log(argument);
                },
                type: 'GET'
            });

        } else if (this.getAttribute("value") == "modTourn"){
            $.ajax({
                url: '/api/team',
                // data: data,
                success: function (argument) {
                    teams = [];
                    JSON.parse(argument).data.forEach(t => {
                        teams.push(t.tname);
                    });
                    updateData("time", Date.now());
                    updateData("page", "modTourn");
                },
                error: function (argument) {
                    console.log(argument);
                },
                type: 'GET'
            });
        } else if (this.getAttribute("value") == "addTeam"){
            addedPlayers = [];
            $.ajax({
                url: '/api/player',
                // data: data,
                success: function (argument) {
                    teams = [];
                    JSON.parse(argument).data.forEach(t => {
                        players.push(t.email);
                    });
                    updateData("time", Date.now());
                    updateData("page", "addTeam");
                },
                error: function (argument) {
                    console.log(argument);
                },
                type: 'GET'
            });
        }else if (this.getAttribute("value") == "addTourn"){
            $.ajax({
                url: '/api/team',
                // data: data,
                success: function (argument) {
                    teams = [];
                    JSON.parse(argument).data.forEach(t => {
                        teams.push(t.tname);
                    });
                    triggerUpdate();
                    updateData("page", "addTourn");
                },
                error: function (argument) {
                    console.log(argument);
                },
                type: 'GET'
            });
        }

        updatePage(this.getAttribute("value"));
    });

    updatePage("-");
    console.info("READY");
});


function deleteField(field) {
    var hash = $.uriAnchor.makeAnchorMap();
    delete hash[field];
    $.uriAnchor.setAnchor(hash);
}

function updatePage(page) {
    var hash = $.uriAnchor.makeAnchorMap();
    hash.page = page;
    $.uriAnchor.setAnchor(hash);
}

function updateData(field, data) {
    var hash = $.uriAnchor.makeAnchorMap();
    hash[field] = data;
    $.uriAnchor.setAnchor(hash);
}

function getData(field) {
    return $.uriAnchor.makeAnchorMap()[field];
}

//Shorthand method to get the main section
function getSection() {
    return $("#sectionMain");
}

function getRoundCount(bracks) {
    var total = [bracks.length];
    var remains = bracks.length;
    while (remains > 1) {
        // console.log(remains);
        remains = remains / 2;
        total.push(remains);
    }
    return total;
}

function getDaysInMonth(month, year) {
    var date = new Date(year, month, 1);
    var days = [];
    while (date.getMonth() === month) {
        days.push(new Date(date));
        date.setDate(date.getDate() + 1);
    }
    return days;
}

function triggerUpdate() {
    updateData("time", Date.now());
}
