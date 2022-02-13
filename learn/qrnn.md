https://towardsdatascience.com/qrnn-a-potential-competitor-to-the-transformer-86b5aef6c137

RNNs are slow; they process one token at a time.

Moreover, the recurrent architecture adds a limitation of fixed-length encoding vectors for the complete sequence. To overcome these issues, architectures like CNN-LSTM, Transformer, QRNNs burgeoned.

QRNN is essentially an approach for adding convolution to recurrence and recurrence to convolution.

QRNN achieves comparable and, in some cases, slightly better results than the LSTM architectures with up to 17x faster computations.

Recently a model, pQRNN, which is based on QRNN, has achieved comparable results to BERT on sequence classification with just 1.3M parameters (opposed to BERT, which is 440M parameters).

- - -

https://paperswithcode.com/method/qrnn
