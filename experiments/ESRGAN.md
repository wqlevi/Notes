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

## TODO
- [ ] Try LayerNorm(G Hinton), GroupNorm(Kaiming He), Adaptive instance norm
- [ ] Try to deploy attention mechanism for network
- [ ] Try to deploy Squeeze-and-Extraction blocks for model


