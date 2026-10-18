typedef struct {
    unsigned char _pad_000[6];
    unsigned short field_06;
    unsigned short field_08[1];
} arg_022423dc_t;

extern int func_ov002_021bc55c(int a, int b);

int func_ov002_022423dc(arg_022423dc_t *p, int a, int b) {
    unsigned int n;
    unsigned short key;

    if (b > 4) {
        return 0;
    }
    if (func_ov002_021bc55c(a, b) == 0) {
        return 0;
    }
    n = ((unsigned)(p->field_06 << 16)) >> 24;
    if (n != 0) {
        key = (a & 0xff) | ((unsigned char)b << 8);
        if (p->field_08[n - 1] == key) {
            return 0;
        }
    }
    return 1;
}
