set ssh_port 2222
set ssh_ip 192.168.1.227

function sync_books
  rsync -rvz -e "ssh -p $ssh_port" --update --include-from="$HOME/.androidignore" --progress "$HOME/Desktop/monorepo/books/" "$ssh_ip:/sdcard/Documents/books/"
end

function sync_music
  rsync -rvz -e "ssh -p $ssh_port" --update --progress /Volumes/External/music/ "$ssh_ip:/sdcard/Music"
end

function sync_papers
  rsync -rvz -e "ssh -p $ssh_port" --update --include-from="$HOME/.androidignore" --progress "$HOME/Desktop/monorepo/papers/" "$ssh_ip:/sdcard/Documents/papers/"
end

function dl-mp3 -a URL
  yt-dlp -o "%(playlist_index)02d-%(title)s.%(ext)s" -x --audio-format mp3 "$URL"
end

function dl-video -a URL
  yt-dlp --embed-chapters --embed-metadata --embed-thumbnail "$URL"
end

