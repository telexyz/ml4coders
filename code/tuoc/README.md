Tuộc Net: a port of
https://github.com/pjreddie/uwnet/tree/main/src


## Convolutional Neural Networks
https://tiendung.github.io/uwnet/notes/04.html
. . .


### Fully Connected Layers and Images
. . .

### Convolutions: Powerful, Local Feature Extraction
. . .

- - -


## Neural Networks
https://tiendung.github.io/uwnet/notes/02.html

. . .


- - -


## Giải quyết vấn đề bằng ml
https://tiendung.github.io/uwnet/notes/01.html

* Thu thập `data`: rất quan trọng, cần nhiều dữ liệu và nhãn
* Chọn một `model`: chọn cái nào có thể encodes any structure present in your data
* Thiết kế `loss function`: should tell you how bad your model is
* Khởi tạo `parameters`: randomly? zeros? depends on the model
* `optimize`!

Using stochastic `gradient descent`: your goal is to `optimize` your `loss function` to find the `best parameters` for your model. You can think of the `data, model, and labels` as constants and your `loss function` takes as input `model parameters`. `Gradient descent` shows you how to `change your parameters` to `minimize your loss`:

![](file/ml.png)

The `loss function` uses model `parameters` to calculate predictions based on `features` from the `data`. It compares these predictions to the `labels` from that data and outputs the calculated `loss`.


## Deep learning

* Neural network based
* Uses large amounts of data
* Incorporates feature extraction as part of the model
	* Has many “layers” of processing
	* Early layers extract simple features from raw data
	* Later layers extract complex features from simple features

This is very exciting for machine learning practitioners. Typically the difference between a good and bad machine learning model comes down to the features the model uses. Good features = good model, or, as they say, “garbage in, garbage out”. Deep learning offers a different path, instead of trying to find what features make a good model, let the model learn and decide for itself.

### Deep learning works well with structure data

So far deep learning has been most successful with data that has some `inherent structure` and the algorithms take advantage of that structure. Images are composed of `pixels and nearby pixels` are statistically more related to each other than far away pixels. Natural language is a string of words where `future words depend on past words`. Sound is a waveform composed of oscillations at different frequencies with those frequencies changing over time. These are the domains where deep learning (currently) works well.

In domains with less structure (for example, diagnosing an illness based on a patient’s symptoms) there are many algorithms that outperform neural networks or deep learning. For those tasks you are much better off using `gradient-boosted decision trees` or `random forests`.


## Learning From Data

The learning part of machine learning means automatically adjusting the parameters of a model based on data. Machine learning algorithms optimize the model parameters to give the best model performance for a data set. To optimize our model we first need a way to measure the performance of a model.


### Loss Functions Describe How Bad a Model Performs

A `loss function` describes the performance of a model and a particular set of `parameters` on a `dataset`. In particular, it measures how badly the model performs, or how far away from correct the model’s predictions are. There are many options for `loss functions` but one common one is `L_2 loss` or `mean squared error` (MSE).

### Optimization as Function Minimization

. . . nhiều công thức toán ...


### Gradient Descent Algorithm

To find `argmin_x(f(x))`:
* start with some estimate of `x`
* repeat until converged: `x = x - learning_rate * gradient(f(x))`

The gradient is sort of like a generalization of the derivative to multiple dimensions. For a function that takes multiple inputs the gradient gives the partial derivatives of that function with respect to each of the inputs. Formally:

`gradient(f(x)) = [d/d(x_1) f(x), d/d(x_2) f(x), ...]`

Like the derivative, the gradient of a function points in the direction of steepest ascent of the function. Therefore if we want to minimize a function we can move in the direction opposite the gradient, hence `gradient descent`!


### Case Study: Linear Regression

For linear regression our model fits a line to a set of data: `m(x)	= a*x + b`. In this case:
* Model `params = {a, b}`
* MSE loss function `L_2(X, m, {a, b}) = 1/n * sum_i=1..n((y_i - (a*x_i + b))^2)`

Let’s define `h_i = a*x_i + b` to be the output of our model. Then we can look just at how we would update the biases of our model: `d/d(b)L_2 = sum(-2*(y_i - h_i))`

Since we are subtracting our gradient this means our update would look like:
`b = b + learning_rate * sum(2*(y_i - h_i))`

- - -

