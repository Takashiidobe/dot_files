function sync_phone -w sync_phone
  rsync -rvz -e 'ssh -p 2222' --exclude-from="$HOME/.androidignore" --progress ~/Desktop/monorepo/books/ "192.168.1.227:/sdcard/Documents"
end
