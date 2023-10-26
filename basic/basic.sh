
# pomakni se u /scratch/apptainer
cd /scratch/apptainer

# kreiraj korisnički direktorij i pomakni se u njega
mkdir ${USER}
cd ${USER}

# preuzmi Ubuntu 22.04 i napravi sandbox verziju
apptainer build --sandbox ubuntu-22.04.sandbox docker://ubuntu:22.04

# pokreni interaktivnu sjednicu unutar sandboxa
apptainer shell --writable --fakeroot ubuntu-22.04.sandbox

# osvježi i instaliraj pakete unutar sandbox kontejnera
apt update -y
apt install python3-pip -y
python3 -m pip install pypng

# izađi iz kontejnera
exit

# prebaci sandbox kontejner u image
apptainer build ubuntu-22.04.sif ubuntu-22.04.sandbox/

# pomakni kreirani kontejner u korisnički direktorij
mv ubuntu-22.04.sif ${HOME}/.
