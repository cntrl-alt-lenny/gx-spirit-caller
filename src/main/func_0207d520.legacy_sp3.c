/* func_0207d520: return a free range to the heap list: merge it with the
 * block that ends where it starts and the block that starts where it ends,
 * then re-create a block header for the merged span (0 when under 0x10). */
typedef struct Node Node;
struct Node {
    unsigned short tag;
    unsigned short f2;
    unsigned int size;
    Node *f8;
    Node *fc;
};
typedef struct {
    Node *first;
    Node *last;
} Heap;
typedef struct {
    unsigned int start;
    unsigned int end;
} Range;
extern Node *func_0207d9f4(Heap *h, Node *n);
extern Node *func_0207d994(Range *r, int tag);
extern void func_0207d9c4(Heap *h, Node *n, Node *after);

int func_0207d520(Heap *h, Range *r) {
    Range t;
    Node *n;
    Node *prev;

    t = *r;
    n = h->first;
    prev = 0;
    if (n != 0) {
        do {
            if ((unsigned int)n < r->start) {
                prev = n;
            } else {
                if ((unsigned int)n == r->end) {
                    t.end = n->size + (unsigned int)(n + 1);
                    func_0207d9f4(h, n);
                }
                break;
            }
            n = n->fc;
        } while (n != 0);
    }
    if (prev != 0) {
        unsigned int e;
        e = prev->size + (unsigned int)(prev + 1);
        if (e == r->start) {
            t.start = (unsigned int)prev;
            prev = func_0207d9f4(h, prev);
        }
    }
    if (t.end - t.start < 0x10) {
        return 0;
    }
    func_0207d9c4(h, func_0207d994(&t, 0x4652), prev);
    return 1;
}
