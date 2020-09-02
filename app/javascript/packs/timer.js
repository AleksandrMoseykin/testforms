
var my_timer = document.getElementById("my_timers");
var time = my_timer.innerHTML;
var arr = time.split(":");
var h = arr[0];
var m = arr[1];
var s = arr[2];

var h1 = h * 1000 * 60 * 60;
var m1 = m * 1000 * 60;
var s1 = s * 1000;
var timefinal = h1 + m1 + s1;

  function startTimer() {
    if (s == 0) {
      if (m == 0) {
        if (h == 0) {
        }
        h--;
        m = 60;
        if (h < 10) h = "0" + h;
      }
      m--;
      if (m < 10) m = "0" + m;
      s = 59;
    }
    else s--;
    if (s < 10) s = "0" + s;
    document.getElementById("my_timers").innerHTML = h+":"+m+":"+s;
  }
  let timerInterval = setInterval(startTimer, 1000);

  setTimeout(function(){
    clearInterval(timerInterval);
},timefinal);
