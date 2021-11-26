# A notes on influential attempts on SR
## 2D model
31 Juli 2021
__Image path__ : `~/Downloads/ESRGAN/images/orig_2d/`
	* Normal ESRGAN in 2D,
	* Image wise normalized [0,255],
	* Pixelshuffle,
	* VGG19 pretrained
__Image path__: `~/Downloads/ESRGAN/orig_code/images/training/orig_2d_new/`
	* Normal ESRGAN in 2D,
	* Feature wise normalized $\mu$=0, $\sigma$=1,
	* UpSample followed by ReflectionPad2d,
	* VGG19 pretrained
## 3D model
### Crop model
__checkerboard__ : `wangqi@raven.mpcdf.mpg.de:/u/wangqi/torch_env/crop_gan/images/training/3dimg_crop_less_C8`
	* JOBID:549473
	* Normal ESRGAN in 3D,
	* Feature wise normalized,
	* Pixelshuffle 3d,
	* Un-trained VGG16 layers