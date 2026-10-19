extern char data_ov015_021b5e28[];
extern char data_ov015_021b5e44[];
extern char data_02104bac[];
extern int func_ov015_021b2480(void *p);
extern int func_ov015_021b2488(void *p);
extern void func_ov015_021b23f4(void *arg0, int arg1);
#define S(off) (*(short *)(g + (off)))
#define U(off) (*(unsigned short *)(g + (off)))
void func_ov015_021b4574(void) {
    char *g = data_ov015_021b5e44;
    int lo = func_ov015_021b2480(*(void **)(data_ov015_021b5e28 + 0x864));
    int hi = func_ov015_021b2488(*(void **)(data_ov015_021b5e28 + 0x864));
    int changed = 0;
    if (hi < 0) hi = 0;
    if (*(unsigned short *)(data_02104bac + 0x54) & 2) {
        *(int *)(g + 0xa84) |= 4;
    } else {
        unsigned int keys = *(unsigned short *)(data_02104bac + 0x52);
        if ((keys & 0x40) && S(0xa30) > lo) {
            S(0xa30) -= U(0xa34);
            changed = 1;
            if (S(0xa30) < lo) S(0xa30) = lo;
            U(0xa36)++;
        } else if ((keys & 0x80) && S(0xa30) < hi) {
            S(0xa30) += U(0xa34);
            if (S(0xa30) > hi) S(0xa30) = hi;
            U(0xa36)++;
            changed = 1;
        } else {
            U(0xa34) = 1;
            U(0xa36) = 0;
        }
    }
    if (U(0xa36) > 10) {
        int step = U(0xa34);
        U(0xa36) = 0;
        U(0xa34) = step + 1;
        if (U(0xa34) > 14) U(0xa34) = 14;
    }
    if (changed == 1)
        func_ov015_021b23f4(*(void **)(g + 0x848), S(0xa30));
}

