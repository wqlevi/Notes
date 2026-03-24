# GAN stability issues
A follow-up note based on this [Blog](http://www.wqlevi.tk/GAN%20stabilty.html)
## WGAN
1. earth mover distance:
    The minimum work of moving discrete distribution from one to another, a optimal plan $\gamma(x,y)$, and the joint distribution $\gamma \in \prod (\mathbb{P}_{r}, \mathbb{P}_{\theta})$. Where $\prod(\mathbb{P}_{r}, \mathbb{P}_{\theta})$ are the collections of distribution with marginal being $$\sum_{x}\gamma(x,y) = \mathbb{P}_{r}(x)$$ and $$\sum_{y}\gamma(x,y)=\mathbb{P}_{\theta}(y)$$.

The EMD is defined as the multiplication of each plan $\gamma$ with the Euclidian distance between $x.y$.
$$EMD(\mathbb{P}_{r}, \mathbb{P}_{\theta}) = inf_{\gamma \in \prod} \sum_{x,y}\lVert x-y \rVert \gamma(x,y) = inf_{\gamma \in \prod} \mathbb{E}_{(x,y) \sim \gamma} \lVert x-y \rVert$$

2. Linear programming way of formulize the EMD\
The cost function is the product of a joint distribution and a Euclidian distance, one could flatten both into a vector of $n$, then $n=l^2$, $l$ for the length of $x,y$ distribution individually. 

3. Dual form of EMD(weak dual form)\
The strategy above is not proper for GAN senario, because of the heavy computations. That the number of the possible states scales exponentially with the data dimension.\
The computation of the gradient of $\mathbb{P}_{g}$ with respect to EMD is not trackable.

4. Strong dual form
5. Wasserstein distance in continuous distribution
