const std = @import("std");
const allocator = std.heap.page_allocator;

const matrix = @import("matrix.h");
const TWOPI: f32 = 6.2831853;

const stb_image = @cImport({
    @cInclude("stb_image.h");
    @cInclude("stb_image_write.h");
});

const Image = struct {
    w: usize = undefined,
    h: usize = undefined,
    c: usize = undefined,
    data: []f32 = undefined,

    pub fn deinit(im: *Image) void {
        allocator.free(im.data);
    }

    fn new(w: usize, h: usize, c: usize) !Image {
        var im: Image = .{
            .w = w,
            .h = h,
            .c = c,
            .data = try allocator.alloc(f32, w * h * c),
        };
        return im;
    }

    var prng = std.rand.DefaultPrng.init(123);
    pub fn randomize(im: *Image) void {
        const random = prng.random();
        for (im.data) |*v| v.* = random.float(f32);
    }

    fn save_jpg(im: *Image, name: []const u8) !void {
        var file: [256]u8 = undefined;
        defer allocator.free(file);

        std.mem.copy(u8, file[0..name.len], name);
        file[name.len] = 0;

        var data = try allocator.alloc(u8, im.w * im.h * im.c);
        defer allocator.free(data);

        var i: usize = 0;
        var k: usize = 0;
        const size = im.w * im.h;
        while (k < im.c) : (k += 1) {
            while (i < size) : (i += 1)
                data[i * im.c + k] = @floatToInt(u8, 255 * im.data[i + k * size]);
        }
        _ = stb_image.stbi_write_jpg(file[0..name.len], im.w, im.h, im.c, data, 8);
        // if (!success) std.debug.print("Failed to write image {s}\n", .{name});
    }
};

const expect = std.testing.expect;
test "Image" {
    var im = try Image.new(400, 600, 3);
    defer im.deinit();

    try expect(im.w == 400);
    try expect(im.h == 600);
    try expect(im.c == 3);
    try expect(im.data.len == 720_000);

    im.randomize();
    for (im.data) |v| try expect(v >= 0 and v <= 1);

    try im.save_jpg("test.jpg");
}

pub fn main() !void {
    var im = try Image.new(400, 600, 3);
    defer im.deinit();
    im.randomize();
    try im.save_jpg("test.jpg");
}

// void save_image(image im, const char *name)
// {
//     save_image_options(im, name, JPG, 80);
// }

// //
// // Load an image using stb
// // channels = [0..4]
// // channels > 0 forces the image to have that many channels
// //
// image load_image_stb(char *filename, int channels)
// {
//     int w, h, c;
//     unsigned char *data = stbi_load(filename, &w, &h, &c, channels);
//     if (!data) {
//         fprintf(stderr, "Cannot load image \"%s\"\nSTB Reason: %s\n",
//             filename, stbi_failure_reason());
//         exit(0);
//     }
//     if (channels) c = channels;
//     int i,j,k;
//     image im = make_image(w, h, c);
//     for(k = 0; k < c; ++k){
//         for(j = 0; j < h; ++j){
//             for(i = 0; i < w; ++i){
//                 int dst_index = i + w*j + w*h*k;
//                 int src_index = k + c*i + c*w*j;
//                 im.data[dst_index] = (float)data[src_index]/255.;
//             }
//         }
//     }
//     //We don't like alpha channels, #YOLO
//     if(im.c == 4) im.c = 3;
//     free(data);
//     return im;
// }

// image load_image(char *filename)
// {
//     image out = load_image_stb(filename, 0);
//     return out;
// }

// void free_image(image im)
// {
//     free(im.data);
// }

// float nn_interpolate(image im, float x, float y, int c)
// {
//     int lx = (int) round(x);
//     int ly = (int) round(y);
//     float v00 = get_pixel(im, lx, ly, c);
//     return v00;
// }

// float bilinear_interpolate(image im, float x, float y, int c)
// {
//     int lx = (int) floor(x);
//     int ly = (int) floor(y);
//     float dx = x - lx;
//     float dy = y - ly;
//     float v00 = get_pixel(im, lx, ly, c);
//     float v10 = get_pixel(im, lx+1, ly, c);
//     float v01 = get_pixel(im, lx, ly+1, c);
//     float v11 = get_pixel(im, lx+1, ly+1, c);
//     float v =   v00*(1-dx)*(1-dy) + v10*dx*(1-dy) +
//                 v01*(1-dx)*dy + v11*dx*dy;
//     return v;
// }

// image bilinear_resize(image im, int w, int h)
// {
//     image r = make_image(w, h, im.c);
//     float xscale = (float)im.w/w;
//     float yscale = (float)im.h/h;
//     int i, j, k;
//     for(k = 0; k < im.c; ++k){
//         for(j = 0; j < h; ++j){
//             for(i = 0; i < w; ++i){
//                 float y = (j+.5)*yscale - .5;
//                 float x = (i+.5)*xscale - .5;
//                 float val = bilinear_interpolate(im, x, y, k);
//                 set_pixel(r, i, j, k, val);
//             }
//         }
//     }
//     return r;
// }

// image nn_resize(image im, int w, int h)
// {
//     image r = make_image(w, h, im.c);
//     float xscale = (float)im.w/w;
//     float yscale = (float)im.h/h;
//     int i, j, k;
//     for(k = 0; k < im.c; ++k){
//         for(j = 0; j < h; ++j){
//             for(i = 0; i < w; ++i){
//                 float y = (j+.5)*yscale - .5;
//                 float x = (i+.5)*xscale - .5;
//                 float val = nn_interpolate(im, x, y, k);
//                 set_pixel(r, i, j, k, val);
//             }
//         }
//     }
//     return r;
// }

// float get_pixel(image im, int x, int y, int c)
// {
// /*
//     if(x >= im.w) return 0;
//     if(y >= im.h) return 0;
//     if(x < 0) return 0;
//     if(y < 0) return 0;
//     */

//     if(x >= im.w) x = im.w - 1;
//     if(y >= im.h) y = im.h - 1;
//     if(x < 0) x = 0;
//     if(y < 0) y = 0;
//     assert(c >= 0);
//     assert(c < im.c);
//     return im.data[x + im.w*(y + im.h*c)];
// }

// void set_pixel(image im, int x, int y, int c, float v)
// {
//     assert(c >= 0);
//     assert(c < im.c);
//     if(x >= 0 && x < im.w && y >= 0 && y < im.h){
//         im.data[x + im.w*(y + im.h*c)] = v;
//     }
// }

// image copy_image(image im)
// {
//     image copy = make_image(im.w, im.h, im.c);
//     memcpy(copy.data, im.data, im.w*im.h*im.c*sizeof(float));
//     return copy;
// }

// void scale_image(image im, int c, float v)
// {
//     int i;
//     for(i = 0; i < im.w*im.h; ++i){
//         im.data[i + c*im.w*im.h] *= v;
//     }
// }

// void shift_image(image im, int c, float v)
// {
//     int i;
//     for(i = 0; i < im.w*im.h; ++i){
//         im.data[i + c*im.w*im.h] += v;
//     }
// }

// void clamp_image(image im)
// {
//     int i;
//     for(i = 0; i < im.w*im.h*im.c; ++i){
//         im.data[i] = (im.data[i] < 0) ? 0 : ((im.data[i] > 1) ? 1 : im.data[i]);
//     }
// }

// image get_channel(image im, int c)
// {
//     int i,j;
//     assert(c >= 0 && c < im.c);
//     image chan = make_image(im.w, im.h, 1);
//     for(j = 0; j < im.h; ++j){
//         for(i = 0; i < im.w; ++i){
//             chan.data[i+im.w*j] += im.data[i + im.w*(j + im.h*c)];
//         }
//     }
//     return chan;
// }

// float three_way_max(float a, float b, float c)
// {
//     return (a > b) ? ( (a > c) ? a : c) : ( (b > c) ? b : c) ;
// }

// float three_way_min(float a, float b, float c)
// {
//     return (a < b) ? ( (a < c) ? a : c) : ( (b < c) ? b : c) ;
// }

// image add_image(image a, image b)
// {
//     assert(a.w == b.w && a.h == b.h && a.c == b.c);
//     int i;
//     image sum = make_image(a.w, a.h, a.c);
//     for(i = 0; i < a.w*a.h*a.c; ++i){
//         sum.data[i] = a.data[i] + b.data[i];
//     }
//     return sum;
// }

// image sub_image(image a, image b)
// {
//     assert(a.w == b.w && a.h == b.h && a.c == b.c);
//     int i;
//     image sum = make_image(a.w, a.h, a.c);
//     for(i = 0; i < a.w*a.h*a.c; ++i){
//         sum.data[i] = a.data[i] - b.data[i];
//     }
//     return sum;
// }
