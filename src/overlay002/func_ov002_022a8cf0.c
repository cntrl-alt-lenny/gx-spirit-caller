/* func_ov002_022a8cf0: lazily build a 2x10 "eligible" bitmask at
 * self+0x618 (func_ov002_021bc288(i,j)==0), then for every set bit post a
 * packed position record (from func_ov002_022a6e04's two out-params) to
 * data_ov002_022d0f98 via func_0207f05c. */
extern int func_ov002_021bc288(int a, int b);
extern int func_ov002_022a6e04(int *out, void *self, int a, int b, int c);
extern void func_0207f05c(void *queue, void *event, int n);
extern char data_ov002_022d0f98[];

struct Ov002EvtBuild {
    int outX;
    int outY;
    int outX2;
    int outY2;
    int packed;
    short tag;
};

void func_ov002_022a8cf0(char *self) {
    int i, j;

    if (*(int *)(self + 0x618) < 0) {
        *(int *)(self + 0x618) = 0;
        for (i = 0; i < 2; i++) {
            for (j = 0; j < 10; j++) {
                if (func_ov002_021bc288(i, j) == 0) {
                    *(int *)(self + 0x618) |= 1 << (j + i * 0x10);
                }
            }
        }
    }

    if (*(int *)(self + 0x618) == 0)
        return;

    {
        struct Ov002EvtBuild b;
        b.packed = (int)0x80000000;
        b.tag = 0x4c68;
        for (i = 0; i < 2; i++) {
            for (j = 0; j < 10; j++) {
                int bit = *(int *)(self + 0x618) & (1 << (j + i * 0x10));
                if (bit <= 0)
                    continue;
                func_ov002_022a6e04(&b.outX, self, i, j, 0);
                b.outX2 = b.outX;
                b.outY2 = b.outY;
                b.packed = (b.packed & 0xfe00ff00) |
                           ((b.outY - 0x10) & 0xff) |
                           (unsigned)((b.outX - 0x10) << 23) >> 7;
                func_0207f05c(data_ov002_022d0f98, &b.packed, 1);
            }
        }
    }
}
