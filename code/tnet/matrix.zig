// Port of https://github.com/pjreddie/uwnet/blob/main/src/matrix.c

const std = @import("std");
const allocator = std.heap.page_allocator;
// const fastmath = @import("util/fastmath.zig");

// A matrix has size rows x cols
// and some data stored as an array of floats
// storage is row-major order:
// https://en.wikipedia.org/wiki/Row-_and_column-major_order
pub const Matrix = struct {
    rows: usize = 0,
    cols: usize = 0,
    size: usize = 0,
    data: []f32 = undefined,
    shallow: bool = false,

    pub inline fn get(self: Matrix, r: usize, c: usize) f32 {
        return self.data[r * self.rows + c];
    }

    pub inline fn set(self: *Matrix, v: f32, r: usize, c: usize) void {
        self.data[r * self.rows + c] = v;
    }

    // Make empty matrix filled with zeros
    // int rows: number of rows in matrix
    // int cols: number of columns in matrix
    // returns: matrix of specified size, filled with zeros
    pub fn init(m: *Matrix, rows: usize, cols: usize) !void {
        m.rows = rows;
        m.cols = cols;
        m.size = rows * cols;
        m.shallow = false;
        m.data = try allocator.alloc(f32, m.size);
        std.mem.set(f32, m.data, 0);
    }

    pub fn new(rows: usize, cols: usize) !Matrix {
        var m: Matrix = undefined;
        try m.init(rows, cols);
        return m;
    }

    pub fn deinit(m: *Matrix) void {
        allocator.free(m.data);
    }

    // Make a matrix with uniformly random elements
    // float s: range of randomness, [-s, s]
    // returns: matrix of rows x cols with elements in range [-s,s]
    var prng = std.rand.DefaultPrng.init(123);
    pub fn randomize(m: *Matrix, s: f32) void {
        const random = prng.random();
        for (m.data) |*v| v.* = 2 * s * random.float(f32) - s;
    }

    // // Copy a matrix
    // // matrix m: matrix to be copied
    // // returns: matrix that is a deep copy of m
    pub fn clone(m: *Matrix) !Matrix {
        var new_matrix = try Matrix.new(m.rows, m.cols);
        std.mem.copy(f32, new_matrix.data, m.data);
        return new_matrix;
    }
};

const expect = std.testing.expect;
test "Matrix" {
    var m: Matrix = undefined;
    try m.init(4, 5);
    defer m.deinit();

    try expect(m.rows == 4);
    try expect(m.cols == 5);
    try expect(m.data.len == 20);

    m.randomize(5);
    for (m.data) |v| try expect(v >= -5 and v <= 5);

    const n = try m.clone();
    for (m.data) |v, i| try expect(v == n.data[i]);

    m.set(0.3, 2, 3);
    try expect(m.get(2, 3) == 0.3);
}

// // Transpose a matrix
// // matrix m: matrix to be transposed
// // returns: matrix, result of transposition
// matrix transpose_matrix(matrix m)
// {
//     // TODO: 1.2 - Make a matrix the correct size, fill it in
//     matrix t = make_matrix(1,1);
//     return t;
// }

// // Perform y = ax + y
// // float a: scalar for matrix x
// // matrix x: left operand to the scaled addition
// // matrix y: unscaled right operand, also stores result
// void axpy_matrix(float a, matrix x, matrix y)
// {
//     assert(x.cols == y.cols);
//     assert(x.rows == y.rows);
//     // TODO: 1.3 - Perform the weighted sum, store result back in y
// }

// // Perform matrix multiplication a*b, return result
// // matrix a,b: operands
// // returns: new matrix that is the result
// matrix matmul(matrix a, matrix b)
// {
//     assert(a.cols == b.rows);
//     matrix c = make_matrix(a.rows, b.cols);
//     // TODO: 1.4 - Implement matrix multiplication. Make sure it's fast!

//     return c;
// }

// // In-place, element-wise scaling of matrix
// // float s: scaling factor
// // matrix m: matrix to be scaled
// void scal_matrix(float s, matrix m)
// {
//     int i, j;
//     for(i = 0; i < m.rows; ++i){
//         for(j =0 ; j < m.cols; ++j){
//             m.data[i*m.cols + j] *= s;
//         }
//     }
// }

// // Print a matrix
// void print_matrix(matrix m)
// {
//     int i, j;
//     printf(" __");
//     for(j = 0; j < 16*m.cols-1; ++j) printf(" ");
//     printf("__ \n");

//     printf("|  ");
//     for(j = 0; j < 16*m.cols-1; ++j) printf(" ");
//     printf("  |\n");

//     for(i = 0; i < m.rows; ++i){
//         printf("|  ");
//         for(j = 0; j < m.cols; ++j){
//             printf("%15.7f ", m.data[i*m.cols + j]);
//         }
//         printf(" |\n");
//     }
//     printf("|__");
//     for(j = 0; j < 16*m.cols-1; ++j) printf(" ");
//     printf("__|\n");
// }

// // Used for matrix inversion
// matrix augment_matrix(matrix m)
// {
//     int i,j;
//     matrix c = make_matrix(m.rows, m.cols*2);
//     for(i = 0; i < m.rows; ++i){
//         for(j = 0; j < m.cols; ++j){
//             c.data[i*c.cols + j] = m.data[i*m.cols + j];
//         }
//     }
//     for(j = 0; j < m.rows; ++j){
//         c.data[j*c.cols + j+m.cols] = 1;
//     }
//     return c;
// }

// // Invert matrix m
// matrix matrix_invert(matrix m)
// {
//     int i, j, k;
//     //print_matrix(m);
//     matrix none = {0};
//     if(m.rows != m.cols){
//         fprintf(stderr, "Matrix not square\n");
//         return none;
//     }
//     matrix c = augment_matrix(m);
//     //print_matrix(c);
//     float **cdata = calloc(c.rows, sizeof(float *));
//     for(i = 0; i < c.rows; ++i){
//         cdata[i] = c.data + i*c.cols;
//     }

//     for(k = 0; k < c.rows; ++k){
//         float p = 0.;
//         int index = -1;
//         for(i = k; i < c.rows; ++i){
//             float val = fabs(cdata[i][k]);
//             if(val > p){
//                 p = val;
//                 index = i;
//             }
//         }
//         if(index == -1){
//             fprintf(stderr, "Can't do it, sorry!\n");
//             free_matrix(c);
//             return none;
//         }

//         float *swap = cdata[index];
//         cdata[index] = cdata[k];
//         cdata[k] = swap;

//         float val = cdata[k][k];
//         cdata[k][k] = 1;
//         for(j = k+1; j < c.cols; ++j){
//             cdata[k][j] /= val;
//         }
//         for(i = k+1; i < c.rows; ++i){
//             float s = -cdata[i][k];
//             cdata[i][k] = 0;
//             for(j = k+1; j < c.cols; ++j){
//                 cdata[i][j] +=  s*cdata[k][j];
//             }
//         }
//     }
//     for(k = c.rows-1; k > 0; --k){
//         for(i = 0; i < k; ++i){
//             float s = -cdata[i][k];
//             cdata[i][k] = 0;
//             for(j = k+1; j < c.cols; ++j){
//                 cdata[i][j] += s*cdata[k][j];
//             }
//         }
//     }
//     //print_matrix(c);
//     matrix inv = make_matrix(m.rows, m.cols);
//     for(i = 0; i < m.rows; ++i){
//         for(j = 0; j < m.cols; ++j){
//             inv.data[i*m.cols + j] = cdata[i][j+m.cols];
//         }
//     }
//     free_matrix(c);
//     free(cdata);
//     //print_matrix(inv);
//     return inv;
// }

// matrix solve_system(matrix M, matrix b)
// {
//     matrix none = {0};
//     matrix Mt = transpose_matrix(M);
//     matrix MtM = matmul(Mt, M);
//     matrix MtMinv = matrix_invert(MtM);
//     if(!MtMinv.data) return none;
//     matrix Mdag = matmul(MtMinv, Mt);
//     matrix a = matmul(Mdag, b);
//     free_matrix(Mt); free_matrix(MtM); free_matrix(MtMinv); free_matrix(Mdag);
//     return a;
// }

// void write_matrix(matrix m, FILE *fp)
// {
//     fwrite(m.data, sizeof(float), m.rows*m.cols, fp);
// }

// void read_matrix(matrix m, FILE *fp)
// {
//      assert(fread(m.data, sizeof(float), m.rows*m.cols, fp) == m.rows*m.cols);
// }

// void save_matrix(matrix m, char *fname)
// {
//     FILE *fp = fopen(fname, "wb");
//     fwrite(&m.rows, sizeof(int), 1, fp);
//     fwrite(&m.cols, sizeof(int), 1, fp);
//     write_matrix(m, fp);
//     fclose(fp);
// }

// matrix load_matrix(char *fname)
// {
//     int rows = 0;
//     int cols = 0;
//     FILE *fp = fopen(fname, "rb");
//     assert(fread(&rows, sizeof(int), 1, fp) == 1);
//     assert(fread(&cols, sizeof(int), 1, fp) == 1);
//     matrix m = make_matrix(rows, cols);
//     read_matrix(m, fp);
//     fclose(fp);
//     return m;
// }

// void test_matrix()
// {
//     int i;
//     for(i = 0; i < 100; ++i){
//         int s = rand()%4 + 3;
//         matrix m = random_matrix(s, s, 10);
//         matrix inv = matrix_invert(m);
//         if(inv.data){
//             matrix res = matmul(m, inv);
//             print_matrix(res);
//         }
//     }
// }
