# Machine learning for coders

## Tiêu chí

1/ `#nhà_làm`: Tự mày mò code từ đầu bằng một ngôn ngữ lập trình hệ thống như C/C++/Zig/Rust
   Nên tham khảo mã nguồn của các thư viện đã có sẵn và viết theo.

2/ `#tăng_tốc`: Những phần tối ưu đơn giản dùng SIMD hoặc GPU có thể tự code luôn.
   Phần này nên dùng những libs tối ưu tính toán như `armadillo`, `eigen`, `openblas` để đỡ phải viết lại phần code tối ưu hóa cho từng CPU/GPU/PLATFORM

3/ `#bậc_cao`: Cài đặt lại một lần nữa ở những ngôn ngữ bậc cao hơn và ml libs có sẵn như `mlpack/python,julia,go`, `jax,flax,torch/python`, `flux/julia` để ôn bài thêm lần nữa và soi xem bản `#nhà_làm` với bản `#bậc_cao` có gì khác biệt?
   Nên tham khảo các cài đặt đã có để cài đặt và tối ưu theo.

## Các dự án đang làm

### a/ https://github.com/telexyz/embed

`#nhà_làm` train nhanh gấp 5 lần `word2vec` bản gốc, cải tiến ở việc chọn mini-batch.

Đã `#tăng_tốc` = SIMD (60%).
Chuẩn bị `#tăng_tốc` = math lib `armadillo`, `eigen`, `openblas`.

`#bậc_cao` muốn làm thử với `julia` để xem julialang có hay như lời đồn không.


## Các dự án sắp làm

### b/ Viết lại `hs-rnnlm` từ `word2vec`

Tham khảo https://github.com/telexyz/nnlm/tree/main/hs-rnnlm

Kế thừa một phần code từ https://github.com/telexyz/embed/blob/main/src/model.zig


### c/ Viết lại `lstm-rnn` bằng Zig
https://github.com/telexyz/nnlm/tree/main/lstm-rnn


### d/ Viết `quasi-rnn` bằng Zig


- - -


## Thư viện `mlpack`

### Cài mlpack từ mã nguồn

https://github.com/mlpack/mlpack#4-building-mlpack-from-source

Các thư viện cần cài trước khi build `mlpack`

* linear algebra (matrix maths)
  https://gitlab.com/conradsnicta/armadillo-code

* numerical optimization
  https://github.com/mlpack/ensmallen

* serialize
  https://github.com/USCiLab/cereal


__Note__: Ngoài `armadillo` có thể dùng `eigen` (`faster-rnn` dùng), hoặc `openblas` (`lstm-rnn` dùng)

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


`brew install armadillo eigen openblas`

### Trên Windows

https://www.mlpack.org/files/mlpack-3.4.2.msi

https://www.mlpack.org/getstarted.html

### Trên Debian Linux

`apt install libmlpack-dev mlpack-bin libarmadillo-dev`
`g++ code.cpp -larmadillo -lmlpack`