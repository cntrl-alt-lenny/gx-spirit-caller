extern int func_ov010_021b2b80(int x);

void func_ov010_021b35e4(int id, short *rect, int tile, int palette) {
    int dst;
    int width, height;
    int x, y;
    dst = func_ov010_021b2b80(id);
    height = rect[3];
    dst += (rect[0] + rect[1] * 32) * 2;
    width = rect[2];
    for (y = 0; y < height; y++) {
        for (x = 0; x < width; x++) {
            *(unsigned short *)dst = tile | (palette << 12);
            dst += 2;
            tile++;
        }
        dst += (32 - width) * 2;
    }
}

