#!/usr/bin/env bash
pip install gdown

mkdir -p datasets
cd datasets

mkdir -p ETT-data
cd ETT-data
gdown "https://drive.google.com/uc?id=10D9h6dVrlXknwYgYdnct8OfIaCRzIQXD"
gdown "https://drive.google.com/uc?id=18S5BrHOLrgqmTba2pOLWNxldIT9hrEGd"
gdown "https://drive.google.com/uc?id=1bxBD_uN1Gt3Tyn8Vb71ciAYyIbL4sZl1"
cd ..
