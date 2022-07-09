var greatest = greatest || {};

greatest.lastTrack = 0;
greatest.allTracks = false;
greatest.dataset = [];
greatest.getBands = function () {
    greatest.send(greatest.bandsResponse, "?pf=bands");
};

greatest.bandsResponse = function (o) {

};

greatest.search = function () {
    greatest.allTracks = false;
    var result = document.getElementById("result");
    result.innerHTML = "";
    var stn = document.getElementById("trackselect");
    var tn = stn.value;
    if (tn == -1) {
        greatest.allTracks = true;
        tn = 1;
    }
    greatest.dataset = [];
    greatest.lastTrack = tn;
    greatest.send(greatest.searchResponse, "?pf=&tracknumber="+tn);
};

greatest.searchResponse = function (o) {
    greatest.dataset.push(o);
    var selectionTableBody = document.getElementById("selectionTableBody");
    var needSelectionHeader = false;
    if (selectionTableBody.childNodes.length == 0) {
        needSelectionHeader = true;
    }
    var table = document.createElement("table");
    var body = document.createElement("body");
    var header = document.createElement("thead");
    var headerRow = document.createElement("tr");
    var selectionHeaderRow = document.createElement("tr");

    var columns = o.columns;
    var a = document.createElement("th");
    headerRow.appendChild(a);
    selectionHeaderRow.appendChild(document.createElement("th"));
    for (var x = 0; x < columns.length; x++) {
        var c = document.createElement("th");
        c.innerHTML = greatest.formatTitle(columns[x]);
        c.className = "headerColumn";
        headerRow.appendChild(c);
        var d = document.createElement("th");
        d.innerHTML = greatest.formatTitle(columns[x]);
        d.className = "headerColumn";
        selectionHeaderRow.appendChild(d);
    }
    if (needSelectionHeader) {
        selectionTableBody.appendChild(selectionHeaderRow);
    }
    body.appendChild(headerRow);
    table.appendChild(header);
    
    var tracks = o.tracks;
    for (var x = 0; x < tracks.length; x++) {
        var row = document.createElement("tr");
        var b = document.createElement("td");
        var button = document.createElement("button");
        button.textContent= "Select";
        b.appendChild(button);
        row.appendChild(b);
        button.setAttribute("onclick", "greatest.selectTrack(" + (greatest.dataset.length - 1).toString() + "," + x + "," + tracks[x]["track_number"] + ");");
        row=greatest.buildTrackRow(row, tracks[x], columns);
        body.appendChild(row);
    }
    table.appendChild(body);
    document.getElementById("result").appendChild(table);

    if (greatest.allTracks) {
        greatest.lastTrack++;
        if (greatest.lastTrack < 12) {
            greatest.send(greatest.searchResponse, "?pf=&tracknumber=" + greatest.lastTrack);
        }
    }
};

greatest.selectTrack = function (datasetIndex, trackIndex, trackNumber) {
    var row = document.createElement("tr");
    var b = document.createElement("td");
    var button = document.createElement("button");
    button.textContent = "Remove";
    b.appendChild(button);
    row.appendChild(b);
    button.setAttribute("onclick", "greatest.removeTrack(" + trackNumber + ");");
    row = greatest.buildTrackRow(row, greatest.dataset[datasetIndex].tracks[trackIndex], greatest.dataset[datasetIndex].columns);
    var tbody = document.getElementById("selectionTableBody");
    var currentRows = tbody.childNodes.length;
    var numRows = (trackNumber+1) - currentRows;
    if (numRows > 0) {
        for (var x = currentRows; x < trackNumber+1; x++) {
            var r = document.createElement("tr");
            tbody.appendChild(r);
        }
    }
    tbody.replaceChild(row, tbody.childNodes[trackNumber]);
};

greatest.removeTrack = function (trackNumber) {
    var row = document.createElement("tr");
    var tbody = document.getElementById("selectionTableBody");
    tbody.replaceChild(row, tbody.childNodes[trackNumber]);
};

greatest.buildTrackRow = function (row, track, columns) {
    if (row == null) {
        row = document.createElement("tr");
    }
    for (var y = 0; y < columns.length; y++) {
        var field = document.createElement("td");
        field.innerHTML = track[columns[y]];
        row.appendChild(field);
    }
    return row;
}

greatest.formatTitle = function (text) {
    var words = text.split("_");
    for (var x = 0; x < words.length; x++) {
        words[x] = words[x].charAt(0).toUpperCase() + words[x].slice(1);
    }

    return words.join(" ");
}

greatest.send = function (callback,params) {
    var xhr = new XMLHttpRequest();
    // we defined the xhr

    xhr.onreadystatechange = function () {
        if (this.readyState != 4) return;

        if (this.status == 200) {
            var data = JSON.parse(this.responseText);

            callback(data);
        }

        // end of state change: it can be after some time (async)
    };

    xhr.open('GET', "https://childsheartyoga.com/BandFunctions.aspx" + params, true);
    xhr.send();
};