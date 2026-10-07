/* func_0207d610: best-fit search of the free list at h + 0x24 for a block
 * able to hold size bytes ending on an align boundary; first fit when the
 * pool's flag bit 0 is clear, and an exact fit stops the search. */
typedef struct Node Node;
struct Node {
    unsigned short tag;
    unsigned short f2;
    unsigned int size;
    Node *next;
    Node *prev;
};
typedef struct {
    Node *tail;
    Node *head;
    unsigned char _pad_08[0x12 - 8];
    unsigned short flags;
} Pool;
extern void *func_0207d78c(Pool *p, Node *n, unsigned int addr, unsigned int size, int flag);

void *func_0207d610(char *h, unsigned int size, unsigned int align) {
    Pool *p = (Pool *)(h + 0x24);
    int first_fit = (unsigned short)(p->flags & 1) == 0;
    Node *best = 0;
    Node *n;
    unsigned int best_size = 0xffffffff;
    unsigned int best_addr = 0;

    for (n = p->head; n != 0; n = n->next) {
        unsigned int base = (unsigned int)(n + 1);
        unsigned int nsize = n->size;
        unsigned int cand = (nsize + base - size) & ~(align - 1);
        if ((int)(cand - base) < 0) {
            continue;
        }
        if (best_size <= nsize) {
            continue;
        }
        best = n;
        best_size = nsize;
        best_addr = cand;
        if (first_fit) {
            break;
        }
        if (nsize == size) {
            break;
        }
    }
    if (best == 0) {
        return 0;
    }
    return func_0207d78c(p, best, best_addr, size, 1);
}
