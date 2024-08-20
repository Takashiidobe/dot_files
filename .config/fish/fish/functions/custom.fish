set ssh_port 2222
set ssh_ip 192.168.2.76 # 10.0.0.17
set remarkable_ip 10.0.0.127

function sync_books
  rsync -rvz -e "ssh -p $ssh_port" --update --include-from="$HOME/.androidignore" --progress "$HOME/monorepo/books/" "$ssh_ip:/sdcard/Documents/books/" --delete
end

function sync_music
  rsync -rvz -e "ssh -p $ssh_port" --update --progress "$HOME/Music/" "$ssh_ip:/sdcard/Music" --include-from="$HOME/.musicignore"
end

function sync_papers
  rsync -rvz -e "ssh -p $ssh_port" --update --include-from="$HOME/.androidignore" --progress "$HOME/monorepo/papers/papers/" "$ssh_ip:/sdcard/Documents/papers/" --delete
end

function sync_links
  rsync -rvz -e "ssh -p $ssh_port" --update --include-from="$HOME/.linkignore" --progress "$HOME/monorepo/links/" "$ssh_ip:/sdcard/Documents/links/" --delete
end

function sync_photos
  rsync -rvz -e "ssh -p $ssh_port" --update --include-from="$HOME/.photoignore" --progress "$ssh_ip:/sdcard/DCIM/Camera/" "$HOME/Pictures/s10/"
end

function dl-mp3 -a URL
  yt-dlp -n (nproc) --add-metadata --embed-metadata -o "%(playlist_index)02d-%(title)s.%(ext)s" -x --audio-format mp3 "$URL" --embed-thumbnail  --download-archive progress.txt # --cookies-from-browser firefox
end

function dl-video -a URL
  yt-dlp -n (nproc) --add-metadata --embed-metadata --write-sub --write-auto-sub --sub-lang "en" --embed-chapters --embed-thumbnail -f 'bv[height<=720]+ba/b[height<=720]' -o '%(title)s.%(ext)s' "$URL" --download-archive progress.txt # --cookies-from-browser firefox
end

function compile-rust -a FILE
    curl 'https://godbolt.org/api/compiler/r1700/compile?options=-C%20opt-level%3D3' --data-binary @"$FILE"
end

function start_panamax
  panamax serve ~/crates --port=27428
end

function stop_panamax
  for pid in (lsof -i TCP:8080 | awk '/LISTEN/{print $2}')
      echo -n "Found server for port $port with pid $pid: "
      kill -9 $pid; and echo "killed."; or echo "could not kill."
  end
end

function rm_landscape
  sudo remouse --evdev --region --address=$remarkable_ip --orientation left --password="lKI7SSnNUc"
end

function rm_portrait
  sudo remouse --evdev --region --address=$remarkable_ip --orientation bottom --password="lKI7SSnNUc"
end

function exercise
    $HOME/.local/bin/exercise $HOME/exercise/exercises.txt
end
