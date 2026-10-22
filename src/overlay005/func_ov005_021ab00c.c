extern int Task_PostLocked(void *arg0, int arg1, int arg2);
/* Fill32's assembly body consumes three registers despite its void definition. */
extern void Fill32(int value, void *dest, int size);
extern void func_ov005_021aafac(void *o, char *buf);
extern long long func_020b3870(int numerator, int denominator);
typedef struct Node { int id, a, next, b, c, d, e; } Node;
typedef struct Buffer { char tag[4]; int count, size; Node head; Node nodes[1]; } Buffer;
Buffer *func_ov005_021ab00c(void *o, int count) {
    int size = (count + 1) * 0x1c + 0xc;
    Buffer *p = (Buffer *)Task_PostLocked((void *)size, 4, 0);
    Node *n;
    int i;
    if (p) {
        Fill32(0, p, size);
        p->tag[0] = 0x49;
        p->tag[1] = 0x54;
        p->tag[2] = 0x54;
        p->tag[3] = 0x4d;
        p->count = count;
        p->size = size;
        func_ov005_021aafac(o, (char *)p);
        p->head.id = 0;
        p->head.a = 0;
        p->head.next = 0;
        p->head.b = count;
        p->head.c = -1;
        p->head.d = 0;
        p->head.e = 0;
        n = p->nodes;
        for (i = 1; i <= count; i++, n++) {
            n->id = i;
            n->a = 0;
            n->next = (int)(func_020b3870(i, count) >> 32) + 1;
            n->b = 0;
            n->c = 0;
            n->d = 0;
            n->e = 0;
        }
    }
    return p;
}
