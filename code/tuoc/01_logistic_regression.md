Vọc `logistic regression` khi đọc https://lena-voita.github.io/nlp_course/text_classification.html#logistic_regression

## Data
https://cogcomp.seas.upenn.edu/Data/QA/QC

* `data/trec_train.label` => https://cogcomp.seas.upenn.edu/Data/QA/QC/train_5500.label

* `data/trec_test.label` => https://cogcomp.seas.upenn.edu/Data/QA/QC/TREC_10.label


## Cài đặt bằng Python

https://github.com/tiepvupsu/tiepvupsu.github.io/blob/master/assets/LogisticRegression/LogisticRegression_post.ipynb

Từ https://machinelearningcoban.com/2017/01/27/logisticregression


## Tài liệu khác

https://www.youtube.com/watch?v=qZSqcu2D7zQ

### Mô hình tuyến tính logic regression

Là baseline của supervised machine learning tools for classification.
Là nền tảng của neural network (feed forward nn có thể dc coi là 1 chuỗi các logistic regression classifier xếp chồng lên nhau).


### sigmoid or logistic function

- `x`: input feature vector
- `w`: weights; weight `w_i` tell how important feature `w_i` is
- For binary classification xét giá trị `z = w . x + b`
- `w . x` là weighted feature
- `b` là bias

`z` chỉ là một con số nên để normalize `z` về khoảng `0-1` dùng logistic function:
`y = sigmoid(z) - 1 / (1 + exp(-z))`. Và coi `y` là khả năng `x` thuộc về đội mình.
