extern int func_ov002_021ff1c8(void *a, int i);
extern int func_ov002_021ca1d8(int i);
extern int func_ov002_02253600(int i, unsigned short val, int zero);

int func_ov002_022079e8(void *a) {
    int i;
    for (i = 0; i < 2; i++) {
        if (func_ov002_021ff1c8(a, i) == 0) {
            continue;
        }
        if (func_ov002_021ca1d8(i) == 0) {
            continue;
        }
        if (func_ov002_02253600(i, *(unsigned short *)a, 0) != 0) {
            return 1;
        }
    }
    return 0;
}
