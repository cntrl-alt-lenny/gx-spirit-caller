typedef struct {
    int keys[0x35];
    int vals[0x35];
} Tbl;

extern int func_ov002_0229d01c(Tbl *tbl, int b, int c);

int func_ov002_0229d0b0(Tbl *tbl, int key) {
    int best = 0;
    int i;
    int j;

    if (key == 0) {
        return 0x12800;
    }
    for (i = 0; i < 0x35; i++) {
        if (key == tbl->keys[i]) {
            tbl->vals[i] = 0;
            return ((i + 1) << 10) + 0x12800;
        }
    }
    for (j = 0; j < 0x35; j++) {
        if (tbl->keys[j] == 0) {
            break;
        }
        if (tbl->vals[j] > tbl->vals[best]) {
            best = j;
        }
    }
    if (j == 0x35) {
        j = best;
    }
    tbl->keys[j] = key;
    tbl->vals[j] = 0;
    return func_ov002_0229d01c(tbl, j + 1, key);
}
