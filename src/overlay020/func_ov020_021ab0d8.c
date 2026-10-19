extern void *func_0208e200(void);
/* The assembly fill routine consumes value, destination, and byte count. */
extern void func_0209448c(int, void *, unsigned int);
/* Division returns quotient in r0 and remainder in r1. */
extern long long func_020b3870(int, int);
extern char data_ov020_021ae060[];
extern char data_ov020_021ae0a8[];

int func_ov020_021ab0d8(int page) {
    char *state = data_ov020_021ae0a8;
    char *p = (char *)func_0208e200() + 0x106;
    int tile = 0x55;
    int total = *(int *)(data_ov020_021ae060 + 0x8d8);
    int remainder = total % 17;
    int rows;
    int y, x;
    page = (int)(func_020b3870(page, (total - remainder) / 17 + 1) >> 32);
    tile += page * 0x1cb;
    if (total - page * 17 < 18)
        rows = *(int *)(state + 0x890) - page * 17;
    else
        rows = 18;
    for (y = 0; y < rows; y++) {
        for (x = 0; x < 27; x++) {
            *(unsigned short *)p = tile | 0xf000;
            p += 2;
            tile++;
        }
        p += 10;
    }
    for (; y < 18; y++) {
        func_0209448c(0, p, 0x36);
        p += 0x40;
    }
    return page;
}



