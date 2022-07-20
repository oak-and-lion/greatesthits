﻿var greatest = greatest || {};

greatest.apiUrl = "http://localhost:51882/BandFunctions.aspx"; // "https://childsheartyoga.com/BandFunctions.aspx";
greatest.lastTrack = 0;
greatest.allTracks = false;
greatest.dataset = [];
greatest.getBands = function () {
    greatest.send(greatest.bandsResponse, "?pf=bands");
};

greatest.bandsResponse = function (o) {
    var bands = o.bands;
    var chooser = document.getElementById("band_list");
    for (var i = 0; i < bands.length; i++) {
        var opt = document.createElement('option');
        opt.value = bands[i].id;
        opt.innerHTML = bands[i].name;
        chooser.appendChild(opt);
    }
};

greatest.getMaxTracks = function (ts) {
    var chooser = document.getElementById("trackselect");
    chooser.options.length = 0;
    var id = ts.options[ts.selectedIndex].value;
    var band_name = ts.options[ts.selectedIndex].text;
    if (parseInt(id) > 0) {
        greatest.send(greatest.maxTracksResponse, "?pf=maxtracks&artist=" + id);
    } else {
        var ts = document.getElementById("type_list");
        ts.value = "0";
        greatest.showListType(ts);
        band_name = "";
    }

    var band_names = document.getElementsByName("band_name");
    for (var i = 0; i < band_names.length; i++) {
        band_names[i].innerHTML = band_name;
    }
};

greatest.maxTracksResponse = function (o) {
    var maxtracks = o.maxtracks[0].max;
    var chooser = document.getElementById("trackselect");
    for (var i = 0; i < maxtracks; i++) {
        var opt = document.createElement('option');
        opt.value = i+1;
        opt.innerHTML = i+1;
        chooser.appendChild(opt);
    }
    greatest.getWriters(document.getElementById("band_list"));
};

greatest.getWriters = function (ts) {
    var id = ts.options[ts.selectedIndex].value;
    if (parseInt(id) > 0) {
        greatest.send(greatest.getWritersResponse, "?pf=writers&artist=" + id);
    }
};

greatest.getWritersResponse = function (o) {
    var maxwriters = o.total;
    var chooser = document.getElementById("writerselect");
    for (var i = 0; i < maxwriters; i++) {
        var opt = document.createElement('option');
        opt.value = o.writers[i].id;
        opt.innerHTML = o.writers[i].name;
        chooser.appendChild(opt);
    }
    chooser.setAttribute("size", maxwriters);
};

greatest.showListType = function (ts) {
    var list_divs = document.getElementsByName("list_div");
    for (var i = 0; i < list_divs.length; i++) {
        list_divs[i].style.display = "none";
    }
    var s = ts.options[ts.selectedIndex].value;
    if (s == 1) {
        document.getElementById("hits_div").style.display = "block";
    } else if (s == 2) {
        document.getElementById("writers_div").style.display = "block";
    }
};

greatest.searchByWriters = function () {
    greatest.send(greatest.searchByWritersResponse, "?pf=&writers=-1," + greatest.getSelectValues(document.getElementById("writerselect")).join(","));
};

greatest.searchByWritersResponse = function (o) {
    console.log(o);
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

    xhr.open('GET', greatest.apiUrl + params, true);
    xhr.send();
};

greatest.getSelectValues = function(select) {
    var result = [];
    var options = select && select.options;
    var opt;

    for (var i = 0, iLen = options.length; i < iLen; i++) {
        opt = options[i];

        if (opt.selected) {
            result.push(opt.value || opt.text);
        }
    }
    return result;
};

// first call
greatest.getBands();