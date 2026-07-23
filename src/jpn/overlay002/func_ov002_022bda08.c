typedef struct {
    int a;
    int b;
} Pair_ov002_022bdb18;

typedef struct {
    Pair_ov002_022bdb18 pairs[16];
    int last;
} T_ov002_022bdb18;

void func_ov002_022bda08(T_ov002_022bdb18 *p) {
    int i;
    Pair_ov002_022bdb18 *cur = p->pairs;
    for (i = 0; i < 16; i++) {
        cur->a = 0;
        cur->b = 0;
        cur++;
    }
    p->last = 0;
}
