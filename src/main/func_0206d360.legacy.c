typedef struct {
    char           _0[0x10];
    unsigned char *p1;
    int            n1;
    unsigned char *p2;
    int            n2;
} ring_0206d360_t;

extern void func_02094688(const void *src, void *dst, int n);

int func_0206d360(unsigned char *dst, int len, ring_0206d360_t *rb) {
    int n1 = rb->n1;
    int n2 = rb->n2;

    if (n1 > len) {
        n1 = len;
        n2 = 0;
    } else if (n2 > len - n1) {
        n2 = len - n1;
    }
    if (n1 > 0) {
        func_02094688(rb->p1, dst, n1);
        rb->p1 += n1;
        rb->n1 -= n1;
    }
    if (n2 > 0) {
        func_02094688(rb->p2, dst + n1, n2);
        rb->p2 += n2;
        rb->n2 -= n2;
    }
    return n1 + n2;
}
