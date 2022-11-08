# A log file of experiments on ESRGAN 3D MRI Super-Resolution

## Previous attempts(_Nov 2021,till C11 model trained on HCP 3T crops_)
### Model
Feature Extractor: VGG16 3D without pre-trained weights(embedded with BatchNorm)
Generator: 2 Densely Connected Residual Blocks
Discriminator: 2 convolutional layer per depth of feature maps(embedded with BatchNorm)
### Dataset
UnNormalized

## Enhancement deploying(_22 Dec 2021_)
### Model 
same as above
### dataset
Feature normalization(the entire image was normalized before cropping)

## No BN layers(_13 Jan 2022_)
### Model
all BN layers were removed from Dnet ,FE and Gnet
### dataset
All images were normlized to 0 mean 1 std as group normalization 
### result
Full of checkerboard artefacts

## Pre-trained FE weights(_22 Apr 2022_)
### Model 
BN in FE(resnet-10, pretrained weights, not seg/TransposeConv module)
BN in Dnet
### dataset 
demeaned LS2001/LS2003
### Result
Meaningful high resolution, but suffers from poor details

## TODO
- [x] Try LayerNorm(G Hinton), GroupNorm(Kaiming He), Adaptive instance norm
- [ ] Try to deploy attention mechanism for network
- [ ] Try to deploy Squeeze-and-Extraction blocks for model(same as attention)
- [ ] Go for Implicit Neural Representation, especially SIREN, both on SR, rotation and temporal data.
- [ ] Try ViT   

