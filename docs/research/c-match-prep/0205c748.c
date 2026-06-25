/* CAMPAIGN-PREP candidate for func_0205c748 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     alloc + memset + ordered field init; bind old head (single load); publish
 *   risk:       interleave of stores around the two calls may reschedule; old-head bind (one ldr, two uses) and store-order f0,f4,f8,fc,f10,f3c,f38
 *   confidence: med
 */
/* func_0205c748: allocate 0x40, memset 0, fill fields in order, link
 * into c->+0x434 list, return the node. c = *arg0.
 *   p->+0 = 0x64; p->+4 = arg2; p->+8 = -1; p->+c = arg1
 *   p->+0x10 = func_02054b9c(0) + 0x12c
 *   old = c->+0x434; p->+0x3c = old
 *   p->+0x38 = func_020541b8(0x18, 0, func_0205c7d8, old)
 *   c->+0x434 = p; return p
 */

extern void *func_020453e8(int size);
extern void  func_020a73d4(void *dst, int val, int len);
extern int   func_02054b9c(int a0);
extern void *func_020541b8(int a0, int a1, void *cb, void *arg);
extern void  func_0205c7d8(void);

typedef struct Item {
    int   f0;    /* +0x00 */
    int   f4;    /* +0x04 */
    int   f8;    /* +0x08 */
    void *fc;    /* +0x0c */
    int   f10;   /* +0x10 */
    char  _pad_14[0x38 - 0x14];
    void *f38;   /* +0x38 */
    void *f3c;   /* +0x3c */
} Item;

typedef struct {
    char  _pad_00[0x434];
    Item *head;  /* +0x434 */
} Container;

void *func_0205c748(Container **pp, void *arg1, int arg2) {
    Container *c = *pp;
    Item *p = (Item *)func_020453e8(0x40);
    void *old;
    if (p == 0) {
        return 0;
    }
    func_020a73d4(p, 0, 0x40);
    p->f0 = 0x64;
    p->f4 = arg2;
    p->f8 = -1;
    p->fc = arg1;
    p->f10 = func_02054b9c(0) + 0x12c;
    old = c->head;
    p->f3c = old;
    p->f38 = func_020541b8(0x18, 0, func_0205c7d8, old);
    c->head = p;
    return p;
}
