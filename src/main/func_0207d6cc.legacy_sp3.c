typedef struct Node Node;
struct Node {
    unsigned short tag;
    unsigned short info;
    unsigned int size;
    Node *next;
    Node *prev;
};
extern unsigned int func_0207d78c(int *h, int *n, unsigned int addr, unsigned int size, unsigned short flag);

unsigned int func_0207d6cc(char *h, unsigned int size, unsigned int align) {
    int *p = (int *)(h + 0x24);
    int first_fit = (unsigned short)(*(unsigned short *)((char *)p + 0x12) & 1) == 0;
    Node *best = 0;
    Node *n;
    unsigned int best_size = 0xffffffff;
    unsigned int best_addr = 0;

    n = (Node *)p[0];
    if (n != 0) {
        unsigned int align_mask = align - 1;
        align = ~align_mask;
        do {
            unsigned int base = (unsigned int)(n + 1);
            unsigned int cand = (align_mask + base) & align;
            unsigned int nsize = n->size;
            if (nsize >= size + (cand - base) && best_size > nsize) {
                best = n;
                best_size = nsize;
                best_addr = cand;
                if (first_fit) break;
                if (nsize == size) break;
            }
            n = n->prev;
        } while (n != 0);
    }
    if (best == 0) return 0;
    return func_0207d78c(p, (int *)best, best_addr, size, 0);
}
