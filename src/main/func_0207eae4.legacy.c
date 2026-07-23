typedef struct {
    unsigned short count;
    char pad[0xc - 2];
    char *arr;
} Inner_0207eae4;

typedef struct {
    void *out;
    char pad[0x18 - 4];
    Inner_0207eae4 *inner;
} T_0207eae4;

int func_0207eae4(T_0207eae4 *p, unsigned int idx) {
    Inner_0207eae4 *inner = p->inner;
    if (idx < inner->count) {
        p->out = inner->arr + idx * 8;
        return 1;
    }
    return 0;
}
