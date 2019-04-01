<app>
  <h1>Vibration API Sample</h1>
  <b class="caution">バイブ・音が鳴ります。AndoridのChromeまたはFirefoxで閲覧してください。</b>
  <button class="btn" if={ !audio } onclick={ onPlayClick }>ブッチッパ</button>
  <button class="btn" if={ audio } onclick={ onStopClick }>とめる</button>

  <script>
    this.audio = null;

    onPause(e) {
      this.audio = null;
      this.update();
    }

    onPlayClick() {
      if (this.audio) return;
      this.audio = new Audio('assets/dappun.mp3');
      this.audio.play();
      this.audio.addEventListener('pause', this.onPause, false);
      window.navigator.vibrate([2000, 1000, 5000]);
    }

    onStopClick() {
      if (!this.audio) return;
      this.audio.pause();
      this.audio.removeEventListener('pause', this.onPause, false);
      this.audio = null;
    }
  </script>

  <style>
    .caution {
      font-size: 1rem;
    }
    .btn {
      display: block;
    }
  </style>
</app>
