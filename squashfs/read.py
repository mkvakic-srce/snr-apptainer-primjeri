
import glob
import tqdm
import random
import numpy as np

from torchvision.datasets import ImageFolder
from torchvision.transforms import ToTensor
from torch.utils.data import DataLoader

# direktoriji
directory_lustre = 'mnist_png/training'
directory_squash = '/mnist_png/training'

# učitaj slike s Lustrea
def load_epoch(directory):
    dataset = ImageFolder(directory, transform=ToTensor())
    loader = DataLoader(dataset, batch_size=128)
    for batch in tqdm.tqdm(loader):
        continue

print('--- Učitavanje s Lustrea ---')
load_epoch(directory_lustre)

print('--- Učitavanje sa squash imagea ---')
load_epoch(directory_squash)
