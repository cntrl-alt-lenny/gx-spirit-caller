typedef struct {
    unsigned char *pixels;
    int width, height;
    unsigned char bpp;
    unsigned char pad[3];
    unsigned int layout;
} Surface;
extern int func_02081498(int x, int y, int w, int h, int sx, int sy);
extern void func_02081348(unsigned char *dst, int x, int y, int w, int h, unsigned int color, int bpp);
void func_020808f0(Surface *s, unsigned int color, int x, int y, int w, int h)
{
    int top, dh, right, bottom, endy;
    unsigned char *pixels;
    int tilex, left, sy, sx, height, width, bpp, stride;
    unsigned int layout;
    int xx, tx, tiley, endx, dy, dx, dw;
    bpp = s->bpp;
    right = x + w;
    bottom = y + h;
    if (bpp == 4) {
        color |= color << 4;
        color |= color << 8;
        color |= color << 16;
    } else {
        color |= color << 8;
        color |= color << 16;
    }
    left = x & ~7;
    top = y & ~7;
    layout = s->layout;
    endx = (right + 7) & ~7;
    endy = (bottom + 7) & ~7;
    stride = (bpp << 6) / 8;
    tilex = left / 8;
    tiley = top / 8;
    width = s->width;
    height = s->height;
    pixels = s->pixels;
    sx = ((unsigned char *)&layout)[0];
    sy = ((unsigned char *)&layout)[1];
    for (; top < endy; top += 8, tiley++) {
        tx = tilex;
        dy = top < y ? y - top : 0;
        dh = (bottom - top > 8 ? 8 : bottom - top) - dy;
        for (xx = left; xx < endx; tx++, xx += 8) {
            int index = func_02081498(tx, tiley, width, height, sx, sy);
            dx = xx < x ? x - xx : 0;
            dw = right - xx;
            if (dw > 8) dw = 8;
            dw -= dx;
            func_02081348(pixels + stride * index, dx, dy, dw, dh, color, bpp);
        }
    }
}




