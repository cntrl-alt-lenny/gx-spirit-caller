typedef struct {
    char pad[0x68];
    char *base;
    char pad6c[7];
    signed char state;
} Obj;
extern int func_0206d7c0(void *a0, int a1, int a2, int *a3, int a4);
extern int func_0206d600(void *a0, int a1, int a2, int a3, int a4, int a5, int a6);
int func_0206d854(Obj *a, int b, int c, int d, int e, int f) {
    char *base = a->base;
    char *inner = *(char **)(base + 0x10c);
    int length = *(int *)(inner + 0x48);
    int count;
    int total = 0;
    int limit;
    int offset;
    if (a->state == 1) {
        if (c > length - 0x2a) return -0x23;
        limit = c;
    } else {
        limit = length - 0x36;
        if (c <= limit) limit = c;
    }
    while (c > 0) {
        count = func_0206d7c0(a, c, limit, &offset, f);
        if (count > 0) {
            if (func_0206d600(a, b, count, offset, d, e, f) <= 0) return -6;
            b += count;
            c -= count;
            total += count;
        }
        if (!(f & 1)) {
            if (count > 0) break;
            return -6;
        }
    }
    return total;
}


