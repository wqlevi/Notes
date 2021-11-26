# Super resolution methods

##  &#9775; Compressed sensing MRI reconstructions

### Under-sample and up-sample

Under-sample raw MRI data from _k-space_, then its zero-filling reconstruction $s_0$ can be obtained by: 

$s_0 = F^HR^H(m) $

where $F$ for Fourier operator and $H$ for conjugate transpose of the operator. Similarly, turning an image($s_i$) to its under-sampled measurements via the inverse reconstruction process:

$m_{s_i} = RF(s_i)$ 

### compressed sensing

Then compressed sensing MRI reconstruction is a process of generating a full-reconstruction image $s$ from under sampled $k-space$ data $m$, as follows:

$min_s J(s)	s.t.	RF(s) = m$ 

where $J(s)$ is regularizer required for ill-posed optimization problems. 

### Loss functions

$L_{total} = L_{adv}(G,D) + \alpha L_{freq}(G) + \gamma L_{imag}$ 

Where $\alpha$ and $\gamma$ stands for weights to help control the balance, and $L_cyc$ for data consistancy as:

$L_{cyc}(G) = L_{freq}(G) + L_{imag}(G)$

where $L_freq$ for under-sampled frequency loss, and $L_imag$ for full reconstructed image loss.
$L_{adv}$ stands for a general adversarial loss:

$min_Gmax_DL_{adv}(G,D)$  

##  &#9775; MRI SR using GAN and 3D multi-level densely connected network

### Down sampling process

$Y = f(x)$ 

Where $f$ for function causing a loss of resolution, the super resolution process will find an inverse mapping function $f^{-1}$ to recover High resolution image $\hat X$ from LR image $Y$:

$\hat X = f^{-1}(Y) + R$ 

Where $R$ for reconstruction residual.

### Optimization and loss

Since MSE often address mean of voxel-wise as result, thus Wasserstein GAN was used to calculate featured 3D image, via optimizing Earth Mover distance. That contains two parts:

$loss_{total }= loss_{int} + \lambda loss_{GAN}$

Where $loss_{int} = \frac{loss_{L_1}}{LHW} = \sum^L_{x=1}\sum^H_{y=1}\sum^W_{z=1}\frac{|I^{HR}_{x,y,z} - I^{LR}_{x,y,z}|} {LHW}$ , and 
$loss_{GAN} = loss_{WGAN,D} = -D_{WGAN,\theta}(I^{SR})$

### Data
Using 3T HCP data, with size of 320\*320\*256, in spatial resolution of 0.7mm isotropic. 

 



