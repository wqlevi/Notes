# Segmentation
## Evaluation dataset
* Brain Tumor Segmentation Challenge(BtaTS)

## Obstacles in segmentation

* Lack of high-quality ground truth in medical imaging
## GAN applications
> * Synthesizing FLAIR images from T1w to help brain tumor segmentation, via 3d conditional GAN.<cite> Bitting Yu, et al., 2018</cite>
# Augmentation 
## Methods
* `Affine tranformation`, which provide highly correlated datasets, thus can offer very little improvements for DNN on unseen data
* `pixel-level transformation`, the geometrical shape of image remains, while pixel intensity value changes   
* `GAN`, the generated dataset are indistinguishable by the discriminator:

> * Image-to-image translation from one modality to another in absence of paired examples, using cycle GAN.(<cite>Jun Yan Zhu, et al., 2017</cite>)

