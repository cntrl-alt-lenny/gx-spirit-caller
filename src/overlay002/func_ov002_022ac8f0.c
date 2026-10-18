/* func_ov002_022ac8f0: recursive merge sort on 4-byte entries keyed by the u16 at +2. */

typedef union {
    unsigned int   w;
    unsigned short h[2];
} ent_t;

typedef struct {
    char   _pad[0x68];
    ent_t *f_68;
    ent_t *f_6c;
} state_ov002_022ac8f0_t;

void func_ov002_022ac8f0(state_ov002_022ac8f0_t *p, int lo, int hi) {
    int mid, i, j, n, k;
    ent_t *a, *b;
    if (lo >= hi) return;
    mid = (lo + hi) >> 1;
    func_ov002_022ac8f0(p, lo, mid);
    func_ov002_022ac8f0(p, mid + 1, hi);
    n = 0;
    for (i = lo; i <= (lo + hi) >> 1; i++) {
        p->f_6c[n++].w = p->f_68[i].w;
    }
    i = mid + 1;
    j = 0;
    k = lo;
    while (i <= hi && j < n) {
        a = p->f_68;
        b = p->f_6c;
        if (b[j].h[1] <= a[i].h[1]) {
            a[k++].w = b[j++].w;
        } else {
            a[k++].w = a[i++].w;
        }
    }
    while (j < n) {
        p->f_68[k++].w = p->f_6c[j++].w;
    }
}
