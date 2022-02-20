# Machine learning for coders

Tham gia thảo luận tại https://discord.gg/SZnnFG6v

## Learn

* Review các papers mình thích tại [`read`](https://github.com/telexyz/ml4coders/tree/main/review)

* Take note các khóa học tại [`note`](https://github.com/telexyz/ml4coders/tree/main/note)

* Các đoạn code nhỏ đi kèm giải thích chi tiết về những thứ mình học tại [`code`](https://github.com/telexyz/ml4coders/tree/main/code)


## Deep learning

Giải thích về Machine Learning => Neural Network => Deep Learning [ngắn gọn, dễ hiểu](https://github.com/telexyz/ml4coders/tree/main/code/tuoc#readme)

- - -


# Làm

## Tiêu chí

1/ `#nhà_làm`: Tự mày mò code từ đầu bằng một ngôn ngữ lập trình hệ thống như `C/C++/Zig/Rust`
   Nên tham khảo mã nguồn của các thư viện đã có sẵn và viết theo.

2/ `#tăng_tốc`: Những phần tối ưu đơn giản dùng `SIMD` hoặc `GPU` có thể tự code luôn.
   Phần nào phức tạp nên dùng những libs tối ưu tính toán như `armadillo`, `eigen`, `openblas` để đỡ thời gian viết lại cho từng HARDWARE/PLATFORM

3/ `#bậc_cao`: Cài đặt lại một lần nữa ở những ngôn ngữ bậc cao hơn và ml libs có sẵn như `mlpack/python,julia,go`, `trax,torch/python`, `flux/julia`, `axion/elixir` để ôn bài thêm lần nữa và soi xem bản `#nhà_làm` với bản `#bậc_cao` có gì khác biệt? Nên tham khảo các cài đặt đã có để cài đặt và tối ưu theo.

## Các dự án

### a/ https://github.com/telexyz/embed

`#nhà_làm` tốc độ huấn luyện nhanh gấp `10 lần` bản gốc.

Đã `#tăng_tốc` = SIMD (60%).
Có khả năng `#tăng_tốc` tiếp = math lib `armadillo`, `eigen`, `openblas`.

`#bậc_cao` muốn làm thử với `julia` xem có hay như lời đồn không.


### b/ Viết `hs-rnnlm`

##### [ >> DOING << ]

Tham khảo https://github.com/telexyz/nnlm/tree/main/hs-rnnlm

`#nhà_làm` có ghể kế thừa một phần code từ https://github.com/telexyz/embed/blob/main/src/model.zig


## Sắp làm

### c/ Viết `lstm-rnn` hoặc `quasi-rnn`

- - -

## Repos gần tương tự

https://github.com/ZeroSum0x00/Machine-Learning-from-Scratch của bạn Thanh Tú