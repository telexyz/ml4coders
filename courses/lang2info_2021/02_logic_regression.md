https://www.youtube.com/watch?v=qZSqcu2D7zQ

## Mô hình tuyến tính logic regression

Là baseline của supervised machine learning tools for classification.
Là nền tảng của neural network (feed forward nn có thể dc coi là 1 chuỗi các logistic regression classifier xếp chồng lên nhau).


Logic regression là _discrminative_ khác với Naive Bayes là _generative_


### sigmoid or logistic function

- `x`: input feature vector
- `w`: weights; weight `w_i` tell how important feature `w_i` is
- For binary classification xét giá trị `z = w . x + b`
- `w . x` là weighted feature
- `b` là bias

`z` chỉ là một con số nên để normalize `z` về khoảng `0-1` dùng logistic function:
`y = sigmoid(z) - 1 / (1 + exp(-z))`. Và coi `y` là khả năng `x` thuộc về đội mình.

