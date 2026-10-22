extern int Ov015_SelectVramBankSub(int sel);
void func_ov015_021b30f0(int sel, const short *rect, int tile, int palette) {
    int dst = Ov015_SelectVramBankSub(sel);
    int width, height;
    int x, y;
    dst += (rect[0] + rect[1] * 32) * 2;
    height = rect[3];
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

