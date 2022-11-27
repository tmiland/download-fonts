#!/bin/env bash

declare -a fonts=(
  BitstreamVeraSansMono
  CodeNewRoman
  DroidSansMono
  FiraCode
  FiraMono
  Go-Mono
  Hack
  Hermit
  JetBrainsMono
  Meslo
  Noto
  Overpass
  ProggyClean
  RobotoMono
  SourceCodePro
  SpaceMono
  Ubuntu
  UbuntuMono
)

version='2.3.0-RC'
fonts_dir="${HOME}/.local/share/fonts"

if [[ ! -d "$fonts_dir" ]]; then
  mkdir -p "$fonts_dir"
fi

for font in "${fonts[@]}"; do
  zip_file="${font}.zip"
  download_url="https://github.com/ryanoasis/nerd-fonts/releases/download/v${version}/${zip_file}"
  echo "Downloading ${font}"
  wget "$download_url"
  unzip "$zip_file" -d "$fonts_dir/$font"
  rm "$zip_file"
done

find "$fonts_dir" -name '*Windows Compatible*' -delete

echo "Rebuilding font cache..."

fc-cache -fv

echo "All done!"