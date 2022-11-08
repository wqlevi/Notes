# Neural Network automated Medical image segmentation and augmentation
## Segmentation
__Evaluation dataset__
* Brain Tumor Segmentation Challenge(BtaTS)
* ADNI
* OSIS
__Obstacles in segmentation__

* Lack of high-quality ground truth in medical imaging
* Difficult to converge 3D volumatric model, as well as intense usage in memory
__GAN applications__
> * Synthesizing FLAIR images from T1w to help brain tumor segmentation, via 3d conditional GAN.<cite> Bitting Yu, et al., 2018</cite>
## Augmentation 
__Methods__
* `Affine tranformation`, which provide highly correlated datasets, thus can offer very little improvements for DNN on unseen data
* `pixel-level transformation`, the geometrical shape of image remains, while pixel intensity value changes   
* `GAN`, the generated dataset are indistinguishable by the discriminator:

__Extension of GAN applications__
> * Image-to-image translation from one modality to another in absence of paired examples, using cycle GAN.(<cite>Jun Yan Zhu, et al., 2017</cite>)
> * Super-resolve current low-resolution image to higher one, using model trained pairly with both low resolution and high train data.(<cite>Christian Ledig, et al., 2016</cite>)
> * Style transfer GAN, which maps raw latent variables to other latent space $s$, or $w$ as was stated in StyleGAN(<cite>Karras., et al., 2019</cite>) 



