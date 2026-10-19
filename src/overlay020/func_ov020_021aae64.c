extern void *func_0208e200(void);

void func_ov020_021aae64(void) {
    char *p;
    int tile;
    int x;
    int y;
    p = (char *)func_0208e200() + 0x44;
    tile = 1;
    for (y = 0; y < 3; y++) {
        for (x = 0; x < 0x1c; x++) {
            *(unsigned short *)p = tile | 0xf000;
            p += 2;
            tile++;
        }
        p += 8;
    }
}
