typedef unsigned char u8;
typedef unsigned int u32;
typedef struct Img { void *buf; u32 w; u32 h; u8 depth; } Img;

extern void func_02094504(u32 value, void *dst, u32 size);

void func_02080cdc(Img *img, u32 v)
{
    int depth = img->depth;
    if (depth == 4) {
        v |= v << 4;
        v |= v << 8;
        v |= v << 16;
    } else {
        v |= v << 8;
        v |= v << 16;
    }
    u32 area = img->w * img->h;
    func_02094504(v, img->buf, area * ((depth << 6) / 8));
}
