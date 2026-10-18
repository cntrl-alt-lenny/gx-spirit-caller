void func_ov019_021b45fc(unsigned short *dst, unsigned short tile, int width, int height, int palette) {
    int y;
    int x;
    for (y = 0; y < height; y++) {
        for (x = 0; x < width; x++) {
            dst[x] = tile | (palette << 12);
            tile++;
        }
        dst += 32;
    }
}
