typedef int (*fn_ptr_t)(int, int, int);

int func_ov002_0229049c(fn_ptr_t fn) {
    int bitmask = 0;
    int i, j;
    for (i = 0; i < 2; i++) {
        for (j = 0; j <= 0xa; j++) {
            if (fn(i, j, 0) != 0) {
                bitmask |= 1 << (j + i * 16);
            }
        }
    }
    return bitmask;
}
