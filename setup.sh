set -e

desktop=false

while [[ $# -gt 0 ]]; do
  case $1 in
    --desktop)
      desktop="$2"
      shift 2
      ;;
    *)
      echo "Unknown parameter: $1"
      exit 1
      ;;
  esac
done

# Make /bin/bash available
ls /bin/bash || ln -s /bin/sh /bin/bash

if [ $desktop == false ]; then
    exit 0
fi

# Download cursor theme
curl -L -o Bibata-Modern-Ice.tar.xz https://github.com/ful1e5/Bibata_Cursor/releases/download/v2.0.7/Bibata-Modern-Ice.tar.xz \
&& mkdir -p ~/.icons \
&& tar -xf Bibata-Modern-Ice.tar.xz -C ~/.icons \
&& rm Bibata-Modern-Ice.tar.xz