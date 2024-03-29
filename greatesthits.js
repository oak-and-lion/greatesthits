﻿var greatest = greatest || {};

greatest.lastTrack = 0;
greatest.allTracks = false;
greatest.dataset = [];
greatest.posOverride = "-1";
greatest.bestTrackPos = 1;
greatest.track_number_col = "track_number";
greatest.length_col = "length";
greatest.track_number_pos = -1;
greatest.length_col_pos = -1;
greatest.length_col_no_pos = -1;
greatest.currentSelectionTable = null;
greatest.exportCSVFileName = "greatest_hits.csv";
greatest.exportJSONFileName = "greatest_hits.json";

greatest.hiddenColumns = [
    "id", "id_band", "id_album_type", "Id", "Id_Band"
];

greatest.getBands = function () {
    greatest.loadTimeSelect(document.getElementById("track_min_time"));
    greatest.loadTimeSelect(document.getElementById("track_max_time"));
    greatest.send(greatest.bandsResponse, "?pf=bands");
};

greatest.bandsResponse = function (o) {
    var bands = o.bands;
    var chooser = document.getElementById("band_list");
    greatest.loadBandList(chooser, bands);
    greatest.loadBandList(document.getElementById("band_2"),bands);
};

greatest.loadBandList = function (chooser,bands) {
    for (var i = 0; i < bands.length; i++) {
        var opt = document.createElement('option');
        opt.value = bands[i].id;
        opt.innerHTML = bands[i].name;
        chooser.appendChild(opt);
    }
};

greatest.loadTimeSelect = function (chooser) {
    for (var i = 0; i < 100; i++) {
        var opt = document.createElement('option');
        opt.value = i * 60;
        opt.innerHTML = i;
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
    greatest.getAlbumYears(document.getElementById("band_list"));
};

greatest.getAlbumYears = function (ts) {
    var id = ts.options[ts.selectedIndex].value;
    if (parseInt(id) > 0) {
        greatest.send(greatest.getAlbumYearsResponse, "?pf=years&artist=" + id);
    }
};

greatest.getAlbumYearsResponse = function (o) {
    var minYear = document.getElementById("album_min_year");
    var maxYear = document.getElementById("album_max_year");
    minYear.innerHTML = "";
    maxYear.innerHTML = "";
    for (var i = 0; i < o.total; i++) {
        minYear.appendChild(greatest.createYearOption(o.albumyears[i].year));
        maxYear.appendChild(greatest.createYearOption(o.albumyears[i].year));
    }
    maxYear.childNodes[maxYear.childNodes.length - 1].setAttribute("selected", "selected")
    greatest.getBandAlbums(document.getElementById("band_list"));
};

greatest.getBandAlbums = function (ts) {
    greatest.getBandAlbumsGeneric(ts, greatest.getBandAlbumsResponse);
};

greatest.getBandAlbumsGeneric = function (ts, callback) {
    var id = ts.options[ts.selectedIndex].value;
    if (parseInt(id) > 0) {
        greatest.send(callback, "?pf=albums&minYear=0&maxYear=9999&artist=" + id);
    }
};

greatest.getBandAlbumsResponse = function (o) {
    var band_1 = document.getElementById("band_1_albums");
    band_1.options.length = 0;
    for (var i = 0; i < o.total; i++) {
        band_1.appendChild(greatest.createOption(o.albums[i].id, o.albums[i].album_name + " (" + o.albums[i].album_year + ") [" + o.albums[i].tracks + "]"));
    }
    document.getElementById("album_rankerSelectionTableBody").innerHTML = "";
    greatest.buildResponse(o, "album_rankerSelectionTableBody", "album_rankersresult", "greatest.selectTrack", false,true);
    greatest.getTitleTracks(document.getElementById("band_list"));
};

greatest.getTitleTracks = function (ts) {
    var id = ts.options[ts.selectedIndex].value;
    if (parseInt(id) > 0) {
        greatest.send(greatest.getTitleTracksResponse, "?pf=&isTitle=1&artist=" + id);
    }
};

greatest.getTitleTracksResponse = function (o) {
    greatest.buildResponse(o, "title_tracks_selectionTableBody", "title_tracks_result", "greatest.selectTrack", false);
};

greatest.getBand2Albums = function (ts) {
    greatest.getBandAlbumsGeneric(ts, greatest.getBand2AlbumsResponse);
};

greatest.getBand2AlbumsResponse = function (o) {
    var band_2 = document.getElementById("band_2_albums");
    band_2.options.length = 0;
    for (var i = 0; i < o.total; i++) {
        band_2.appendChild(greatest.createOption(o.albums[i].id, o.albums[i].album_name + " (" + o.albums[i].album_year + ") [" + o.albums[i].tracks + "]"));
    }
};

greatest.createYearOption = function (val) {
    return greatest.createOption(val, val);
};

greatest.createOption = function (val, text) {
    var opt = document.createElement("option");
    opt.value = val;
    opt.innerHTML = text;

    return opt;
}

greatest.showListType = function (ts) {
    var list_divs = document.getElementsByName("list_div");
    for (var i = 0; i < list_divs.length; i++) {
        list_divs[i].style.display = "none";
    }
    var s = ts.options[ts.selectedIndex].value;
    var show_total_div = false;
    document.getElementById("total_time_span").innerText = "";
    var tbody = null;

    var HEADER_ROW_OFFSET = 1;
    var pos = -1;
    greatest.currentSelectionTable = null;

    if (s == 1) {
        document.getElementById("hits_div").style.display = "block";
        tbody = document.getElementById("selectionTableBody");
        pos = greatest.length_col_pos;
        show_total_div = true;
    } else if (s == 2) {
        document.getElementById("writers_div").style.display = "block";
        tbody = document.getElementById("writerSelectionTableBody");
        pos = greatest.length_col_no_pos;
        show_total_div = true;
    } else if (s == 3) {
        document.getElementById("year_range_div").style.display = "block";
        tbody = document.getElementById("year_rangeSelectionTableBody");
        pos = greatest.length_col_no_pos;
        show_total_div = true;
    } else if (s == 4) {
        document.getElementById("time_range_div").style.display = "block";
        tbody = document.getElementById("time_rangeSelectionTableBody");
        pos = greatest.length_col_no_pos;
        show_total_div = true;
    } else if (s == 5) {
        document.getElementById("head_to_head_div").style.display = "block";
        tbody = document.getElementById("head_to_headSelectionTableBody");
    } else if (s == 6) {
        document.getElementById("opener_closer_div").style.display = "block";
        tbody = document.getElementById("opener_closerSelectionTableBody");
        pos = greatest.length_col_no_pos;
        show_total_div = true;
    } else if (s == 7) {
        document.getElementById("album_ranker_div").style.display = "block";
        tbody = document.getElementById("album_rankerSelectionTableBody");
    } else if (s == 8) {
        document.getElementById("title_tracks_div").style.display = "block";
        tbody = document.getElementById("title_tracks_selectionTableBody");
        pos = greatest.length_col_no_pos;
        show_total_div = true;
    } else if (s == 9) {
        document.getElementById("by_letter_div").style.display = "block";
        tbody = document.getElementById("by_letterSelectionTableBody");
        pos = greatest.length_col_no_pos;
        show_total_div = true;
    }
    greatest.currentSelectionTable = tbody;
    if (show_total_div) {
        document.getElementById("total_div").style.display = "block";
        greatest.calcTotalTime(tbody, HEADER_ROW_OFFSET, pos);
    }
};

greatest.searchByLetter = function () {
    var result = document.getElementById("by_lettersresult");
    result.innerHTML = "";
    greatest.send(greatest.searchByLetterResponse, "?pf=&startsWith=" + greatest.getSelectValues(document.getElementById("by_letter_track")).join(",") + greatest.bandIdValue());
};

greatest.searchByLetterResponse = function (o) {
    greatest.buildResponse(o, "by_letterSelectionTableBody", "by_lettersresult", "greatest.selectTrack", false);
};

greatest.searchByWriters = function () {
    var result = document.getElementById("writersresult");
    result.innerHTML = "";
    var strict = "";
    if (document.getElementById("writerstrict").checked) {
        strict = "-1,";
    }
    greatest.send(greatest.searchByWritersResponse, "?pf=&writers=" + strict + greatest.getSelectValues(document.getElementById("writerselect")).join(",") + greatest.bandIdValue());
};

greatest.searchByWritersResponse = function (o) {
    greatest.buildResponse(o, "writerSelectionTableBody", "writersresult", "greatest.selectTrack", false);
};

greatest.searchByYearRanges = function () {
    var result = document.getElementById("year_rangesresult");
    result.innerHTML = "";
    greatest.send(greatest.searchByYearRangesResponse, "?pf=&minYear=" + greatest.getSelectValues(document.getElementById("album_min_year")) + "&maxYear=" + greatest.getSelectValues(document.getElementById("album_max_year")) + greatest.bandIdValue());
};

greatest.searchByYearRangesResponse = function (o) {
    greatest.buildResponse(o, "year_rangeSelectionTableBody", "year_rangesresult", "greatest.selectTrack", false);
};

greatest.searchByTimeRanges = function () {
    var result = document.getElementById("time_rangesresult");
    result.innerHTML = "";
    greatest.send(greatest.searchByTimeRangesResponse, "?pf=&mintime=" + greatest.getSelectValues(document.getElementById("track_min_time")) + "&maxtime=" + greatest.getSelectValues(document.getElementById("track_max_time")) + greatest.bandIdValue());
};

greatest.searchByTimeRangesResponse = function (o) {
    greatest.buildResponse(o, "time_rangeSelectionTableBody", "time_rangesresult", "greatest.selectTrack", false);
};

greatest.searchTrackVsTrackBand1 = function () {
    greatest.searchTrackVsTrack(document.getElementById("head_to_headresult1"), document.getElementById("band_1_albums"), greatest.trackvtrackresponse1);
};

greatest.searchTrackVsTrack = function (result, albums, response) {
    result.innerHTML = "";
    greatest.send(response, "?pf=&album=" + albums.options[albums.selectedIndex].value);
};

greatest.trackvtrackresponse1 = function (o) {
    greatest.buildResponse(o, "head_to_headSelectionTableBody", "head_to_headresult1", "greatest.selectTrack", true);
    greatest.searchTrackVsTrack(document.getElementById("head_to_headresult2"), document.getElementById("band_2_albums"), greatest.trackvtrackresponse2);
};

greatest.trackvtrackresponse2 = function (o) {
    greatest.buildResponse(o, "head_to_headSelectionTableBody", "head_to_headresult2", "greatest.selectTrack", true);
};

greatest.searchByOpenerCloser = function () {
    var result = document.getElementById("opener_closersresult");
    result.innerHTML = "";
    var val = greatest.getSelectValues(document.getElementById("opener_closer_track"));
    greatest.send(greatest.searchByOpenerCloserResponse, "?pf=&tracknumber=" + val + greatest.bandIdValue());
};

greatest.searchByOpenerCloserResponse = function (o) {
    greatest.buildResponse(o, "opener_closerSelectionTableBody", "opener_closersresult", "greatest.selectTrack", false);
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
    greatest.lastTrack = tn;
    greatest.send(greatest.searchResponse, "?pf=&tracknumber=" + tn + greatest.bandIdValue());
};

greatest.searchResponse = function (o) {
    greatest.buildResponse(o, "selectionTableBody", "result", "greatest.selectTrack", true);
};

greatest.buildResponse = function (o, selectionTableBodyName, resultTableName, selectTrackFunc, usePos, isAlbumList) {
    if (isAlbumList == null || isAlbumList == undefined) {
        isAlbumList = false;
    }
    document.getElementById(resultTableName).innerHTML = "";
    greatest.dataset.push(o);
    var selectionTableBody = document.getElementById(selectionTableBodyName);
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
    if (!usePos) {
        selectionHeaderRow.appendChild(document.createElement("th"));
        selectionHeaderRow.appendChild(document.createElement("th"));
        var b = document.createElement("th");
        b.className = "hiddenColumn";
        selectionHeaderRow.appendChild(b);
    }
    for (var x = 0; x < columns.length; x++) {
        var cn = "";
        if (greatest.hiddenColumns.indexOf(columns[x]) > -1) {
            cn = " hiddenColumn";
        }
        var c = document.createElement("th");
        c.innerHTML = greatest.formatTitle(columns[x]);
        c.className = "headerColumn" + cn;
        if (name != "") {
            c.setAttribute("name", name);
        }
        headerRow.appendChild(c);
        var d = document.createElement("th");
        d.innerHTML = greatest.formatTitle(columns[x]);
        d.className = "headerColumn" + cn;
        selectionHeaderRow.appendChild(d);
    }
    if (needSelectionHeader) {
        selectionTableBody.appendChild(selectionHeaderRow);
    }
    body.appendChild(headerRow);
    table.appendChild(header);
    
    var tracks = o.tracks;
    if (tracks == undefined) {
        tracks = o.albums;
    }
    for (var x = 0; x < tracks.length; x++) {
        var row = document.createElement("tr");
        var b = document.createElement("td");
        var button = document.createElement("button");
        button.textContent= "Select";
        b.appendChild(button);
        row.appendChild(b);
        var tn = tracks[x][greatest.track_number_col];
        if (tn == undefined) {
            tn = 0;
        }
        button.setAttribute("onclick", selectTrackFunc + "(" + (greatest.dataset.length - 1).toString() + "," + x + "," + tn + ",'" + selectionTableBodyName + "'," + usePos + "," + isAlbumList + ");");
        row = greatest.buildTrackRow(row, tracks[x], columns, greatest.posOverride);
        body.appendChild(row);
    }
    table.appendChild(body);
    document.getElementById(resultTableName).appendChild(table);

    if (greatest.allTracks) {
        greatest.lastTrack++;
        if (greatest.lastTrack < 12) {
            greatest.send(greatest.searchResponse, "?pf=&tracknumber=" + greatest.lastTrack + greatest.bandIdValue());
        }
    }
};

greatest.selectTrack = function (datasetIndex, trackIndex, trackNumber, selectionTableBodyName, usePos, isAlbumList) {
    var trackColNum = 0;
    var lengthColNum = 0;
    var NO_POS_BUTTON_OFFSET = 3;
    var POS_BUTTON_OFFSET = 1;
    var HEADER_ROW_OFFSET = 1;
    for (var i = 0; i < greatest.dataset[datasetIndex].columns.length; i++) {
        if (greatest.dataset[datasetIndex].columns[i] == greatest.track_number_col) {
            trackColNum = i;
        } else if (greatest.dataset[datasetIndex].columns[i] == greatest.length_col) {
            lengthColNum = i;
        }
    }
    greatest.length_col_no_pos = lengthColNum + NO_POS_BUTTON_OFFSET;
    greatest.length_col_pos = lengthColNum + POS_BUTTON_OFFSET;
    var row = document.createElement("tr");
    var b = document.createElement("td");
    var button = document.createElement("button");
    var tbody = document.getElementById(selectionTableBodyName);
    button.textContent = "Remove";
    b.appendChild(button);
    row.appendChild(b);
    var removeParam = trackNumber + "," + usePos + ",'" + selectionTableBodyName + "'," + String(trackColNum);
    if (!usePos) {
        removeParam = "parseInt(this.parentElement.parentElement.childNodes[" + String(trackColNum + NO_POS_BUTTON_OFFSET) + "].innerText)," + usePos + ",'" + selectionTableBodyName + "'," + String(trackColNum + NO_POS_BUTTON_OFFSET);
    } else {
        NO_POS_BUTTON_OFFSET--;
    }
    if (isAlbumList) {
        NO_POS_BUTTON_OFFSET--;
    }
    button.setAttribute("onclick", "greatest.removeTrack(" + removeParam + ");");
    var pos = String(tbody.childNodes.length);
    if (usePos) {
        pos = greatest.posOverride;
        lengthColNum += POS_BUTTON_OFFSET;
    } else {
        greatest.buildMoveButton(row, "Up", "greatest.moveTrackUp(this," + String(trackColNum + NO_POS_BUTTON_OFFSET) + ");");
        greatest.buildMoveButton(row, "Down", "greatest.moveTrackDown(this," + String(trackColNum + NO_POS_BUTTON_OFFSET) + ");");
        lengthColNum += NO_POS_BUTTON_OFFSET;
    }
    var ds = greatest.dataset[datasetIndex].tracks;
    if (ds == undefined) {
        ds = greatest.dataset[datasetIndex].albums;
    }
    if (!usePos) {
        var b1 = document.createElement("td");
        b1.innerHTML = tbody.childNodes.length;
        b1.className = "hiddenColumn";
        row.appendChild(b1);
    }
    row = greatest.buildTrackRow(row, ds[trackIndex], greatest.dataset[datasetIndex].columns, pos);

    var currentRows = tbody.childNodes.length;
    if (usePos) {
        var numRows = (trackNumber + HEADER_ROW_OFFSET) - currentRows;
        if (numRows > 0) {
            for (var x = currentRows; x < trackNumber + HEADER_ROW_OFFSET; x++) {
                var r = document.createElement("tr");
                tbody.appendChild(r);
            }
        }
        tbody.replaceChild(row, tbody.childNodes[trackNumber]);
    } else {
        tbody.appendChild(row);
    }

    greatest.calcTotalTime(tbody, HEADER_ROW_OFFSET, lengthColNum);
};

greatest.calcTotalTime = function (tbody, HEADER_ROW_OFFSET, lengthColNum) {
    if (lengthColNum < 0 || tbody == null) {
        return;
    }
    total = 0;
    for (var i = HEADER_ROW_OFFSET; i < tbody.childNodes.length; i++) {
        if (tbody.childNodes[i].childNodes.length >= lengthColNum) {
            total += greatest.convertLengthToSec(tbody.childNodes[i].childNodes[lengthColNum].innerText);
        }
    }

    document.getElementById('total_time_span').innerText = greatest.fancyTimeFormat(total);
};

greatest.buildMoveButton = function (row,text,clickFunc) {
    var upb = document.createElement("button");
    upb.textContent = text;
    var ub = document.createElement("td");
    upb.setAttribute("onclick", clickFunc);
    ub.append(upb);
    row.appendChild(ub);
};

greatest.removeTrack = function (trackNumber,usePos,selectionTableBodyName,trackColNum) {
    var row = document.createElement("tr");
    var tbody = document.getElementById(selectionTableBodyName);
    if (usePos) {
        tbody.replaceChild(row, tbody.childNodes[trackNumber]);
    } else {
        tbody.childNodes[trackNumber].remove();
        for (var i = 1; i < tbody.childNodes.length; i++) {
            tbody.childNodes[i].childNodes[trackColNum].innerHTML = String(i);
        }
    }
};

greatest.buildTrackRow = function (row, track, columns, posOverride) {
    if (row == null) {
        row = document.createElement("tr");
    }
    for (var y = 0; y < columns.length; y++) {
        var field = document.createElement("td");
        if (columns[y] == greatest.track_number_col) {
            if (posOverride == greatest.posOverride) {
                field.innerHTML = track[columns[y]];
                if (greatest.hiddenColumns.includes(columns[y])) {
                    field.className = "hiddenColumn";
                }
            } else {
                field.innerHTML = posOverride;
            }
        } else {
            field.innerHTML = track[columns[y]];
            if (greatest.hiddenColumns.includes(columns[y])) {
                field.className = "hiddenColumn";
            }
        }
        row.appendChild(field);
    }
    return row;
}

greatest.moveTrackUp = function (track, colNum) {
    var currPos = parseInt(track.parentElement.parentElement.childNodes[colNum].innerText);
    greatest.switchRows(track, colNum, currPos, currPos - 1, greatest.bestTrackPos);
};

greatest.moveTrackDown = function (track, colNum) {
    var currPos = parseInt(track.parentElement.parentElement.childNodes[colNum].innerText);
    greatest.switchRows(track, colNum, currPos, currPos + 1, parseInt(track.parentElement.parentElement.parentElement.childNodes.length - 1));
};

greatest.switchRows = function (track, colNum, oldPos, newPos, limit) {
    var rows = track.parentElement.parentElement.parentElement.childNodes;

    if (oldPos != limit) {
        var prev = newPos;
        var prevRow = rows[prev];
        prevRow.childNodes[colNum].innerText = oldPos;
        var currRow = rows[oldPos];
        currRow.childNodes[colNum].innerText = prev;

        var html = "";
        for (var i = 0; i < rows.length; i++) {
            var rh = rows[i].innerHTML;
            if (i == prev) {
                rh = currRow.innerHTML;
            } else if (i == oldPos) {
                rh = prevRow.innerHTML;
            }
            html += "<tr>" + rh + "</tr>";
        }

        track.parentElement.parentElement.parentElement.innerHTML = html;
    }
};

greatest.export = function (export_type) {
    var v = greatest.getSelectValues(export_type);
    if (v == "0") {
        greatest.exportCSV();
    } else if (v == "1") {
        greatest.exportJSON();
    }
};

greatest.exportCSV = function () {
    if (greatest.currentSelectionTable != null) {
        var out = "";
        var rows = greatest.currentSelectionTable.getElementsByTagName("tr");
        var exportCols = [];
        for (var i = 0; i < rows.length; i++) {
            var cells = rows[i].childNodes;
            if (i == 0) {
                exportCols = greatest.findExportCols(cells);
            }

            var line = "";
            if (i == 0) {
                line = "rank,";
            } else {
                line = i + ",";
            }
            for (var x = 0; x < exportCols.length; x++) {
                if (x > 0) {
                    line += ",";
                }
                line += cells[exportCols[x]].innerHTML;
            }
            out += line + "\n";
        }
        greatest.download(greatest.exportCSVFileName, out);
    }
};

greatest.exportJSON = function() {
    if (greatest.currentSelectionTable != null) {
        var out = '{"list":[';
        var rows = greatest.currentSelectionTable.getElementsByTagName("tr");
        var exportCols = [];
        for (var i = 0; i < rows.length; i++) {
            var cells = rows[i].childNodes;
            if (i == 0) {
                exportCols = greatest.findExportCols(cells);
            } else {
                var line = "";
                if (i > 1) {
                    line = ",";
                }
                line += '{"rank":' + i + ",";
                for (var x = 0; x < exportCols.length; x++) {
                    if (x > 0) {
                        line += ",";
                    }
                    line += '"' + rows[0].childNodes[exportCols[x]].innerHTML + '":"' + cells[exportCols[x]].innerHTML + '"';
                }
                line += "}";
                out += line;
            }
        }
        out += "]}";
        greatest.download(greatest.exportJSONFileName, out);
    }
};

greatest.findExportCols = function (cells) {
    var exportCols = [];
    for (var x = 0; x < cells.length; x++) {
        if (cells[x].className != "" && cells[x].className.indexOf("hiddenColumn") < 0) {
            exportCols.push(x);
        }
    }
    return exportCols;
};

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

    xhr.open('GET', greatest.apiUrl + params + "&v=" + Math.random(), true);
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

greatest.bandIdValue = function () {
    return "&artist=" + greatest.getCurrentBandId();
};

greatest.getCurrentBandId = function () {
    return greatest.getSelectValues(document.getElementById("band_list"));
};

greatest.convertLengthToSec = function (time) {
    var split = time.split(":").reverse();
    var total = 0;
    for (var i = split.length - 1; i >= 0; i--) {
        total += parseInt(split[i]) * Math.pow(60, i);
    }

    return total;
};

greatest.fancyTimeFormat = function (duration) {
    // Hours, minutes and seconds
    var hrs = ~~(duration / 3600);
    var mins = ~~((duration % 3600) / 60);
    var secs = ~~duration % 60;

    // Output like "1:01" or "4:03:59" or "123:03:59"
    var ret = "";

    if (hrs > 0) {
        ret += "" + hrs + ":" + (mins < 10 ? "0" : "");
    }

    ret += "" + mins + ":" + (secs < 10 ? "0" : "");
    ret += "" + secs;
    return ret;
};

greatest.download = function (filename, text) {
    var element = document.createElement('a');
    element.setAttribute('href', 'data:text/plain;charset=utf-8,' + encodeURIComponent(text));
    element.setAttribute('download', filename);

    element.style.display = 'none';
    document.body.appendChild(element);

    element.click();

    document.body.removeChild(element);
};

greatestLoad.loadScript();