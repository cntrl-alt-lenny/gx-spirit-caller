typedef struct { unsigned char *pixels; int width, height; unsigned char bpp; unsigned char pad[3]; int stride; } Surface;
extern void func_02081348(unsigned char *, int, int, int, int, unsigned int, int);
void func_02080b04(Surface *s, unsigned int color, int x, int y, int w, int h)
{
    int yy, right, bottom, endy;
    unsigned char *row;
    int left, bpp, stride, rowstride, xx;
    right = x + w; bottom = y + h;
    bpp = s->bpp;
    int endx, dy, dh, dx, dw;
    if (bpp == 4) { color |= color << 4; color |= color << 8; color |= color << 16; }
    else { color |= color << 8; color |= color << 16; }
    yy = y & ~7;
    left = x & ~7;
    stride = (bpp << 6) / 8;
    endx = (right + 7) & ~7;
    endy = (bottom + 7) & ~7;
    row = s->pixels + stride * ((yy / 8) * s->stride + left / 8);
    rowstride = s->stride * stride;
    for (; yy < endy; yy += 8) {
        unsigned char *p = row;
        dy = yy < y ? y - yy : 0;
        dh = (bottom - yy > 8 ? 8 : bottom - yy) - dy;
        for (xx = left; xx < endx; xx += 8) {
            dx = xx < x ? x - xx : 0;
            dw = (right - xx > 8 ? 8 : right - xx) - dx;
            func_02081348(p, dx, dy, dw, dh, color, bpp);
            p += stride;
        }
        row += rowstride;
    }
}







