extern int func_ov002_021ff2b8(void *a, int i);
extern int func_ov002_021ca2b8(int i);
extern int func_ov002_022536e8(int i, unsigned short val, int zero);

int func_ov002_02207ad8(void *a) {
    int i;
    for (i = 0; i < 2; i++) {
        if (func_ov002_021ff2b8(a, i) == 0) {
            continue;
        }
        if (func_ov002_021ca2b8(i) == 0) {
            continue;
        }
        if (func_ov002_022536e8(i, *(unsigned short *)a, 0) != 0) {
            return 1;
        }
    }
    return 0;
}
