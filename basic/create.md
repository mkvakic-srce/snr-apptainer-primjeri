
Workflow za izgradnju na Supeku:

1. Spoji se na pristupni GPU poslužitelj

```shell
ssh mkvakic@login-gpu.hpc.srce.hr
```

2. Pomakni se u odgovarajući direktorij i kreiraj korisnički

```shell
cd /scratch/apptainer
mkdir ${USER}
cd ${USER}
```

3. Preuzmi Ubuntu 22.04, napravi sandbox verziju i pokreni interaktivnu sjednicu

```shell
apptainer build --sandbox ubuntu-22.04.sandbox docker://ubuntu:22.04
apptainer shell --writable --fakeroot ubuntu-22.04.sandbox
```

4. Unutar sandbox kontejnera: osvježi OS, instaliraj pakete i izađi

```shell
Apptainer> apt update -y
Apptainer> apt install python3-pip -y
Apptainer> python3 -m pip install numpy tqdm torch torchvision
Apptainer> exit
```

5. Pretvori sandbox kontejner u image i prebaci u korisnički direktorij

```shell
apptainer build ubuntu-22.04.sif ubuntu-22.04.sandbox/
mv ubuntu-22.04.sif ${HOME}/.
```
