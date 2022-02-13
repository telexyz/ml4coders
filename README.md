https://github.com/mlpack/mlpack#4-building-mlpack-from-source

Các thư viện cần cài trước khi build `mlpack`

* linear algebra (matrix maths)
  https://gitlab.com/conradsnicta/armadillo-code

* numerical optimization
  https://github.com/mlpack/ensmallen

* serialize
  https://github.com/USCiLab/cereal

Script cài đặt cơ bản
```sh
git clone xxx && cd xxx
rm -rf build && mkdir -p build && cd build
cmake .. -DCMAKE_BUILD_TYPE=Release
make -j 4
make install
```