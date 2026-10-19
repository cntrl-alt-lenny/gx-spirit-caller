extern int func_0208e1cc(void);

void func_ov020_021ab43c(int page, int idx) {
    int base = func_0208e1cc();
    int offset = (idx * 5 + 4) * 32 + 5;
    int tile = 1;
    int j, i;
    tile += idx * 100;
    offset = base + offset * 2;
    for (i = 0; i < 4; i++) {
        for (j = 0; j < 25; j++) {
            *(unsigned short *)offset = tile | 0xe000;
            offset += 2;
            tile++;
        }
        offset += 14;
    }
}


