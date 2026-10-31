typedef unsigned char u8;
typedef short s16;
struct Num {
    u8 flag0;
    u8 pad1;
    s16 exp;
    u8 len;
    u8 digits[32];
};
int func_020b0afc(struct Num *a, struct Num *b) {
    int i;
    int n;
    if (a->digits[0] == 0) return b->digits[0] == 0;
    if (b->digits[0] == 0) return a->digits[0] == 0;
    if (a->exp == b->exp) {
        n = a->len;
        i = 0;
        if (n > b->len) n = b->len;
        for (; i < n; i++) {
            if (a->digits[i] != b->digits[i]) return 0;
        }
        if (n == a->len) a = b;
        for (; i < ((volatile struct Num *)a)->len; i++) {
            if (a->digits[i] != 0) return 0;
        }
        return 1;
    }
    return 0;
}

