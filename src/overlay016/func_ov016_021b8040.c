typedef struct { int v[8]; } Wave;
extern const Wave data_ov016_021b8e5c;
extern char data_ov016_021b9784[];
extern char data_021040ac[];
extern void func_0201e964(int a, int b, void *coords, int d, int e, int f, int g, int h, int i, int j, int k, int l);
int func_ov016_021b8040(void *arg) {
    char *table = data_ov016_021b9784;
    char *self = arg;
    int pos[2];
    int x = *(int *)(self + 0x1e0);
    int y0 = *(int *)(self + 0x1e4);
    char *entry;
    entry = table + *(int *)(self + 0x1dc) * 0x54;
    pos[0] = x << 12;
    pos[1] = y0 << 12;
    if (*(unsigned short *)(self + 0x1d8) == 0 && *(int *)(entry + 0x48) != 0) {
        if (*(int *)(entry + 0x44) != 0) {
            func_0201e964(1, *(int *)(*(char **)(self + 8) + 0x2c), pos, 0, 0, 0, 0, 3, 0, 0, 0, 0);
            func_0201e964(1, *(int *)(*(char **)(self + 8) + 0x2c) + 8, pos, 0, 0, 0, 4, 3, 0, 0, 0, 0);
            func_0201e964(1, *(int *)(*(char **)(self + 0x64) + 0x2c), pos, 0, 0, 0, 1, 3, 0x6000, 0x200, 0, 0);
            func_0201e964(1, *(int *)(*(char **)(self + 0xc0) + 0x2c), pos, 0, 0, 0, 3, 3, 0xa000, 0x400, 0, 0);
            func_0201e964(1, *(int *)(*(char **)(self + 0x11c) + 0x2c), pos, 0, 0, 0, 2, 3, 0x12000, 0x600, 0, 0);
            {
                int phase = (*(int *)(data_021040ac + 0x38) >> 3) & 7;
                int y = *(int *)(self + 0x1ec);
                Wave wave = data_ov016_021b8e5c;
                y += wave.v[phase];
                pos[0] = *(int *)(self + 0x1e8) << 12;
                pos[1] = y << 12;
                if (*(unsigned short *)(self + 0x1d0) != 0)
                    func_0201e964(1, *(int *)(*(char **)(self + 0x178) + 0x2c), pos, 0, 0, 0, 5, 3, 0x16000, 0x800, 0, 0);
            }
        } else {
            func_0201e964(1, *(int *)(*(char **)(self + 0x64) + 0x2c), pos, 0, 0, 0, 1, 3, 0x6000, 0x200, 0, 0);
        }
    }
    return 1;
}



