typedef struct {
    unsigned int a, b;
    unsigned char pad8[0x14];
    struct { unsigned int low8:8; unsigned int:24; };
    unsigned char pad20[4];
    struct { unsigned int:17; unsigned int mid4:4; unsigned int:11; };
} state_t;
extern void func_02001d0c(state_t *p, int a, int b);
extern void func_02005088(int a0, int a1, int a2, int a3, int a4, int a5);
extern char *func_0202c44c(int idx);
extern char *func_0208df0c(void);
extern int *func_0208e1cc(void);
extern void func_02094504(int, void *, int);
extern void func_02094550(int *src, int *dst, unsigned int count);
extern int data_02102c90[];
extern int *data_ov008_021b270c;
void func_ov008_021b1998(void) {
    unsigned short tiles[3][32];
    char *base;
    int n;
    int i, j;
    unsigned short tile;
    base = func_0208df0c();
    func_02094504(0, base + 0x220, 0x1800);
    func_02001d0c((state_t *)data_02102c90, 0x40, 3);
    func_02005088((int)data_02102c90, (int)func_0202c44c(data_ov008_021b270c[4]), (int)(base + 0x220), 5, 6, 12);
    n = 0;
    data_ov008_021b270c[6] = (data_02102c90[2] + 6) & ~7;
    if (data_ov008_021b270c[6] <= data_ov008_021b270c[7])
        n = ((data_ov008_021b270c[7] - data_ov008_021b270c[6]) / 8) / 2;
    for (i = 0; i < 3; i++) {
        for (j = 0; j < 32; j++) {
            if (j < n) tile = 0;
            else tile = 0x11 + i * 0x40 + (j - n);
            tiles[i][j] = tile;
        }
    }
    func_02094550((int *)tiles, func_0208e1cc(), 0xc0);
    data_ov008_021b270c[8] = 0;
}

