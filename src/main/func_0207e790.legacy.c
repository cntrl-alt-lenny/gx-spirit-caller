/* func_0207e790: turn the offsets in a loaded table header into pointers:
 * rebase f4, then each of the count words it points at. */
typedef struct {
    unsigned short count;
    unsigned short flags;
    int *table;
} Hdr;

void func_0207e790(Hdr *h) {
    unsigned short i;

    h->table = (int *)((int)h->table + (int)h);
    for (i = 0; i < h->count; i++) {
        h->table[i] = (int)((char *)h + h->table[i]);
    }
}
