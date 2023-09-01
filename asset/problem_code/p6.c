<h1>Welcome to My Website</h1>
<audio id="myAudio" autoplay style="display: none;">
    <source src="https://archive.org/download/NeverGonnaGiveYouUp/jocofullinterview41.mp3" type="audio/mpeg">Your browser does not support the audio element.
</audio>
<script>
    function playSoundOnLoad() {
        var audio = document.getElementById("myAudio");
        audio.play();
    }
    window.addEventListener("load", playSoundOnLoad);
</script>