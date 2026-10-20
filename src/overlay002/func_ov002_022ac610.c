void func_ov002_022ac610(unsigned char *dst, int x, int width, unsigned char *src) {
    int y;
    unsigned char *row;
    int i, offset;
    unsigned short *s;
    for (y = 0, offset = 0; y < 8; y++, offset += 8) {
        row = dst + (((y + 4) >> 3) << 8) + (((y + 4) & 7) << 3);
        i = 0;
        if (width > 0) {
        s = (unsigned short *)(src + offset);
        do {
            *(unsigned short *)(row + (((x + i) >> 3) << 6) + ((x + i) & 7)) = *s++;
            i += 2;
        } while (i < width);
        }
    }
}
