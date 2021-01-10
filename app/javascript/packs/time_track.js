const TIME_TRACK_REFRESH = 60 * 1000

let loaded = false

replaceContent = () => {
  loaded = true
  $.get(location.toString(), {refresh: true}).done(
    (data) => {
      $('#timeTrackTableContainer').html(data);
    }
  );
}

window.timeTrackInterval ||= setInterval(replaceContent, TIME_TRACK_REFRESH)


