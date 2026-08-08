typedef struct {
    char _pad0[0x24];
    int lo;
    int hi;
    int cur;
} obj_t;

int func_02097ea4(obj_t *p, int val, int mode) {
    switch (mode) {
    case 0:
        val += p->lo;
        break;
    case 1:
        val += p->cur;
        break;
    case 2:
        val += p->hi;
        break;
    default:
        return 0;
    }
    if (val < p->lo) {
        val = p->lo;
    }
    if (val > p->hi) {
        val = p->hi;
    }
    p->cur = val;
    return 1;
}
