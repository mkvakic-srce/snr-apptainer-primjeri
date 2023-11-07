
import glob
import tqdm
import random
import numpy as np
from PIL import Image

# direktoriji
directory_lustre = 'mnist_png/training'
directory_squash = '/mnist_png/training'

# datoteke
files_lustre = glob.glob(directory_lustre + '/*/*.png')
files_squash = glob.glob(directory_squash + '/*/*.png')

# funkcija za učitavanje slika
def load_images(files):
    for file in tqdm.tqdm(files):
        image = Image.open(file)
        values = np.array(image.getdata())

print('--- Učitavanje s Lustrea - sekvencijalno ---')
load_images(files_lustre)

print('--- Učitavanje sa squash imagea - sekvencijalno ---')
load_images(files_squash)
