/* func_0207e594: turn the offsets in a loaded table header into pointers:
 * rebase f4, every entry's f4 (by the base func_0207e6bc computes), the
 * block at fc and the pointer at f14. */
typedef struct {
    unsigned short count;
    unsigned short flags;
    int f4;
    int f8;
    int fc;
    int f10;
    int f14;
} Hdr;
typedef struct {
    int f0;
    int f4;
} Item;
extern int func_0207e6bc(Hdr *h);
extern Item *func_0207e638(Hdr *h, unsigned int i);
extern void func_0207e6ac(int p);

void func_0207e594(Hdr *h) {
    int base;
    unsigned short i;

    h->f4 = h->f4 + (int)h;
    base = func_0207e6bc(h);
    for (i = 0; i < h->count; i++) {
        Item *it = func_0207e638(h, i);
        it->f4 = it->f4 + base;
    }
    if (h->fc != 0) {
        Item *b;
        h->fc = h->fc + (int)h;
        b = (Item *)h->fc;
        b->f4 = b->f4 + (int)b;
        h->fc = (int)b;
    }
    if (h->f14 != 0) {
        h->f14 = h->f14 + (int)h;
        func_0207e6ac(h->f14);
    }
}
