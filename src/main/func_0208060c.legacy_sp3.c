typedef unsigned short u16;
typedef unsigned int u32;

void func_0208060c(u16 *dst, int w, int h, int stride, u32 tile, u32 pal)
{
    int x, y;
    u16 *row;
    u16 pbits = (u16)(pal << 12);
    for (y = 0; y < h; y++) {
        row = dst;
        for (x = 0; x < w; x++) {
            *row++ = pbits | tile++;
        }
        dst += stride;
    }
}
