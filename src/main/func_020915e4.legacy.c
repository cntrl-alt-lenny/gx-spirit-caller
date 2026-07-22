typedef struct {
    int used;
    unsigned char *buf;
} T_020915e4;

void func_020915e4(T_020915e4 *p, unsigned char val, int count) {
    unsigned int i;
    unsigned int clamped;
    if (count <= 0) {
        return;
    }
    clamped = p->used;
    if (clamped > (unsigned int)count) {
        clamped = count;
    }
    for (i = 0; i < clamped; i++) {
        p->buf[i] = val;
    }
    p->used -= clamped;
    p->buf += count;
}
