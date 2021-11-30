# &#9773; Machine Learning notes	
## Unknowns
- [ ]How come high frequency details, or image with higher dimensions, are difficult to generate from GAN?
	* The optimal GAN keeps balance between `D` and `G` with JS divergence, When `D` becomes too strong than `G`, general samples are harder to train 

	* Also, more dataset could lead to better model performance, on the contrary, overfitting can be a nightmare where model regularisation was poorly evaluated.

## Basics
### Back-propagation and feedforward
1. [__manually__]updating weights(parameters) and back-propagating loss

~~~python
y = np.sin()
y_hat = a + b*x + c*x**2 + d*x**3
loss = np.square(y_hat - y).sum() # L2 loss accumulatively

# gradient of all learnable parameters
grad_y_hat = 2*(y_hat - y)
grad_a = grad_y_hat.sum() # here a as a var of derivative
grad_b = (x*grad_y_hat).sum()
grad_c = (x**2*grad_y_hat).sum()
grad_d = (x**3*grad_y_hat).sum()

# update weights
a -= learning_rate * grad_a
b -= learning_rate * grad_b
c -= learning_rate * grad_c
d -= learning_rate * grad_d
~~~

2. [__autograd__]updating weights(parameters) and back-propagating loss
~~~python
# assuming nn.model exist
y_hat = model(x)
loss = torch.nn.MSELoss(reduction = 'sum') # still MSE loss cumulatively

model.zero_grad() # zero the gradients before backward pass
loss.backward()   # compute gradient w.r.t. each learnable vars

with torch.no_grad(): # temporally cease gradient, for accessing paras
	for para in model.parameters(): 
		para -= learning_rate * para.grad # updates all learnable paras
~~~

3. [__optim__]updating weights(parameters) and back-propagating loss
~~~python
# with the rest the same as previous ways, but only deploying optimizers
...
# assigning model parameters to optimizer 
optimizer = torch.optim.RMSprop(model.parameters(),lr = learning_rate)
optimizer.zero_grad() # set gradients to zeros
loss.backward() 	  # back-propagating loss
optimizer.step()	  # update weights(parameters)
~~~
4. [__frozen__] freeze gradient from updating during backpropagation, by setting `requires_grad = False`
### Types of layer
1. Fully connected layer\
This is a type of layer that connect each of its neurons to the next layer as input. As is `Pytorch` is implemented using `torch.nn.linear` where input and output channels are specified; in `tensor flow` it's implemented as `Dense`.
2. Convolutional layer\
In a convolutional model, however, fully connected layers are only used at either beginning or end of layer blocks. That's deployed to outputing final prediction or classification of the network.
> The convolutional kernel, by essence, is nothing more than a kernel for element-wise matrix multiplication.
### Normalizing data
As the activation layer of convolution operation gives -1 or 1 as output, thus it's essential to clap all data in range [-1,1] before feeding them into network.
### Regularisations
1. $L_1$(_lasso_) and $L_2$(_ridge_) regularisation were used to avoid overfitting, by introducing additional information(penalty);