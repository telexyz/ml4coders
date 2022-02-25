https://ai.googleblog.com/2020/09/advancing-nlp-with-efficient-projection.html

PRADO+QRNN vs BERT on Text Classification

- - -

https://github.com/tensorflow/models/tree/master/research/seq_flow_lite
`August 24, 2020`: Add PRADO and SGNN implementation.

## PRADO

- small and accurate neural networks that run on mobile phones, smart watches and IoT. 

- combines trainable projections with attention and convolutions.

- evaluate on large document text classification tasks

- show the effectiveness of the `trainable projection model` in finding semantically similar phrases and reaching high performance while maintaining compact size. 

- train tiny neural networks just 200 Kilobytes in size that improve over prior CNN and LSTM models and achieve near state of the art performance on multiple long document classification tasks.

- also apply our model for transfer learning, show its robustness and ability to further improve the performance in `limited data` scenarios.


## SGNN

- one of the biggest challenges is running these complex networks on devices such as mobile phones or smart watches with tiny memory footprint and low computational capacity. 

- propose on-device Self-Governing Neural Networks (SGNNs), which learn compact projection vectors with local sensitive hashing.

- Our findings show that SGNNs are effective at capturing low-dimensional semantic text representations, while maintaining high accuracy.
