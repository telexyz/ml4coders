## Thư viện cơ bản để triển khai ứng dụng

## `darknet` để build neural networks

Mã nguồn C được build, link và gọi thẳng từ Zig. Xem ví dụ:

```sh
git clone https://github.com/telexyz/nnlm.git && cd nnlm
# update `darknet` and `telexyz/embed` source code
git submodule update
# build and run
zig build run
```

## [`cglm`](https://github.com/recp/cglm) Highly Optimized Graphics Math for C

Tận dụng được các phép toán được tối ưu trên SIMD ...

- - -

### `mlpack` cho machine learning nói chung

https://github.com/mlpack/mlpack#4-building-mlpack-from-source

Các thư viện cần cài trước khi build `mlpack`

* linear algebra (matrix maths)
  https://gitlab.com/conradsnicta/armadillo-code

* numerical optimization
  https://github.com/mlpack/ensmallen

* serialize
  https://github.com/USCiLab/cereal

__Note__: Ngoài `armadillo` có thể dùng `eigen` (`faster-rnn` dùng), hoặc `openblas` (`lstm-rnn` dùng)


#### Script cài đặt cơ bản
```sh
git clone xxx && cd xxx
rm -rf build && mkdir -p build && cd build
cmake .. -DCMAKE_BUILD_TYPE=Release
make -j 4
make install
```

### Bản build sẵn trên MacOS
```sh
brew install mlpack
g++ code.cpp -larmadillo -lmlpack
brew install armadillo eigen openblas
```

### Bản build sẵn trên Windows

https://www.mlpack.org/files/mlpack-3.4.2.msi

https://www.mlpack.org/getstarted.html


### Bản build sẵn trên Debian Linux

```sh
apt install libmlpack-dev mlpack-bin libarmadillo-dev
g++ code.cpp -larmadillo -lmlpack
```