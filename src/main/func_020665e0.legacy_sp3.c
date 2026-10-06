typedef struct {
    char _0[0xd8];
    int  hist[10];
    int  idx;
} obj_020665e0_t;

int func_020665e0(obj_020665e0_t *o, int v) {
    int i;

    for (i = 0; i < 10; i++) {
        if (v == o->hist[i]) {
            return 1;
        }
    }
    o->idx = (o->idx + 1) % 10;
    o->hist[o->idx] = v;
    return 0;
}
