## `mlpack`

### Cài mlpack từ mã nguồn

https://github.com/mlpack/mlpack#4-building-mlpack-from-source

Các thư viện cần cài trước khi build `mlpack`

* linear algebra (matrix maths)
  https://gitlab.com/conradsnicta/armadillo-code

* numerical optimization
  https://github.com/mlpack/ensmallen

* serialize
  https://github.com/USCiLab/cereal


__Note__: Ngoài `armadillo` có thể sử dụng `eigen` (được `faster-rnn` sử dụng)


### Script cài đặt cơ bản
```sh
git clone xxx && cd xxx
rm -rf build && mkdir -p build && cd build
cmake .. -DCMAKE_BUILD_TYPE=Release
make -j 4
make install
```

### Trên MacOS

`brew install mlpack`
`g++ code.cpp -larmadillo -lmlpack`

### Trên Windows

https://www.mlpack.org/files/mlpack-3.4.2.msi

https://www.mlpack.org/getstarted.html

### Trên Debian Linux

`apt install libmlpack-dev mlpack-bin libarmadillo-dev`
`g++ code.cpp -larmadillo -lmlpack`