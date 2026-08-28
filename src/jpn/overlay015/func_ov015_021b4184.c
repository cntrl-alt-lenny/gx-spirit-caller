extern int data_ov015_021b5d08[];
extern int data_ov015_021b5d24[];
extern unsigned short data_02104acc[];
extern int func_ov005_021ab028(void *p, int one);
extern void func_ov005_021ac928(int *o, int v);
extern void func_ov005_021ac95c(void *o, int target);
extern int func_ov015_021b33a4(void *p);
extern int func_ov015_021b33cc(void *p);

void func_ov015_021b4184(void) {
    char *g = (char *)data_ov015_021b5d24;
    int k;

#define G8(off) (*(int *)(g + (off)))
#define KEY(off) (*(unsigned short *)((char *)data_02104acc + (off)))

    if (*(int *)((char *)data_ov015_021b5d08 + 0x898) != 0) {
        if (!(G8(0x8e8) == 1 && *(int *)(G8(0x878) + 0x54) == 0)) {
            return;
        }

        k = KEY(0x54);
        if (k & 0x2) {
            G8(0xa84) = G8(0xa84) | 0x4;
            return;
        }
        if (k & 0x1) {
            G8(0xa84) = G8(0xa84) | 0x8;
            return;
        }

        k = KEY(0x56);
        if (k & 0x40) {
            if (G8(0x8dc) >= 0) {
                if (func_ov015_021b33a4(g + 0x880) != 0) {
                    return;
                }
                func_ov005_021ac928((int *)G8(0x878), 0x8000);
                return;
            }
        }

        if (k & 0x80) {
            int n = G8(0x8dc);
            if (n < func_ov005_021ab028((void *)G8(0x874), 1) - 1) {
                if (func_ov015_021b33cc(g + 0x880) != 0) {
                    return;
                }
                func_ov005_021ac95c((void *)G8(0x878), 0x8000);
            }
        }
    } else {
        if (*(unsigned short *)((char *)data_02104acc + 0x54) & 0x2) {
            G8(0xa84) = G8(0xa84) | 0x4;
        }
    }
}
