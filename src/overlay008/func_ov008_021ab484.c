extern char data_ov008_021b2d34[];
extern void *func_0201e964(int, void *, int *, int, int, int, int, int, int, int, int, int);

void func_ov008_021ab484(int x, int y, int row, int col, int cell, int scale, int priority, int mode) {
    int pos[2];
    pos[0] = x << 12;
    pos[1] = y << 12;
    func_0201e964(2, *(char **)(*(char **)(data_ov008_021b2d34 + row * 64 + col * 4 + 8) + 0x2c) + cell * 8,
        pos, 0, 0, 0, 0, mode, scale << 7, priority, 0, 0);
}
