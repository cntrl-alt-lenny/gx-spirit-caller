typedef unsigned short u16;
typedef unsigned int u32;

extern char data_ov002_022cf16c[];
extern int func_0202df78(int, int);
extern int func_ov002_021b3fd8(int, int, int, int);

#define SZ 0x868

typedef struct F { u32 id : 13; u32 rest : 19; } F;

int func_ov002_021bd85c(int a, int b) {
    int i;
    int j;
    if ((b >> 1) == 0) {
        return 0;
    }
    for (i = 0; i < 2; i++) {
        char *p = data_ov002_022cf16c + (i & 1) * SZ;
        F *q = (F *)(p + 0x94);
        char *row = p + 0x64;
        for (j = 5; j < 10; j++, q += 5, row += 0x14) {
            if (q->id == SZ + 0xb00) {
                u32 f = *(u32 *)(row + 0x40);
                u32 w = *(u16 *)(row + 0x38);
                if ((w & ~((f >> 6) & 1)) & ~(((f >> 1) | (f >> 2)) & 1)) {
                    if (func_0202df78(a, *(int *)(row + 0x3c))) {
                        if (b < 0) {
                            return 1;
                        }
                        if (func_ov002_021b3fd8(i, j, SZ + 0xb00, b) == 0) {
                            return 1;
                        }
                    }
                }
            }
        }
    }
    return 0;
}
