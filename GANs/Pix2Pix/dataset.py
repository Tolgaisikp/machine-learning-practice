from torchvision.datasets.utils import download_url
from torch.utils.data import Dataset
from PIL import Image
import numpy as np
import requests
import tarfile
import matplotlib.pyplot as plt
import Pix2Pix.config as cfg
import os

#URL = "https://people.eecs.berkeley.edu/~tinghuiz/projects/pix2pix/datasets/maps.tar.gz"
#download_url(URL, '.')

#with tarfile.open('./maps.tar.gz', 'r:gz') as tar:
#    tar.extractall(path='./data')

class MapDataset(Dataset):
    def __init__(self, root_dir):
        super(MapDataset, self).__init__()
        self.root_dir = root_dir
        self.list_files = os.listdir(self.root_dir)
        #print(self.list_files)

    def __len__(self):
        return len(self.list_files)

    def __getitem__(self, index):
        img_file = self.list_files[index]
        img_path = os.path.join(self.root_dir, img_file)
        image = np.array(Image.open(img_path))
        input_image = image[:, :600, :]
        target_image = image[:, 600:, :]

        augmentations = cfg.both_transform(image=input_image, image0=target_image)
        input_image = augmentations["image"]
        target_image = augmentations["image0"]

        input_image = cfg.transform_only_input(image=input_image)["image"]
        target_image = cfg.transform_only_mask(image=target_image)["image"]

        return input_image, target_image
