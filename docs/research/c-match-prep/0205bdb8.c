/* CAMPAIGN-PREP candidate for func_0205bdb8 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     guard (state==3) then teardown; decrement+reload+assert; tail frees
 *   risk:       g->+0x210 reloaded after store for the bge check; m->+0x4 reloaded per call; assert block scheduling; bge=signed
 *   confidence: med
 */
/* func_0205bdb8: if p->state(+0)==3, decrement (*ctx)->+0x210, assert
 * it stays >= 0, then tear down p->sub(+4). Always free p->sub and
 * clear it, then free p.
 */

extern unsigned char data_02100ad8[];
extern unsigned char data_02100ae8[];
extern void func_020453b4(void *p);
extern void func_02054e54(void *p, int v);
extern void func_02054e70(void *p);
extern void func_020a6d54(void *a, void *b, int c, int d);

typedef struct {
    char _pad_00[0x210];
    int  refcount;   /* +0x210 */
} Ctx;

typedef struct {
    char  _pad_00[0x4];
    void *h4;        /* +0x04 */
    char  _pad_08[0x18 - 0x8];
    void *h18;       /* +0x18 */
} Sub;

typedef struct {
    int   state;     /* +0x00 */
    Sub  *sub;       /* +0x04 */
} Entry;

void func_0205bdb8(Ctx **ctx, Entry *p) {
    if (p->state == 3) {
        Ctx *g = *ctx;
        Sub *m = p->sub;
        g->refcount = g->refcount - 1;
        if (g->refcount < 0) {
            func_020a6d54(data_02100ae8, data_02100ad8, 0, 0xb6);
        }
        func_02054e54(m->h4, 2);
        func_02054e70(m->h4);
        func_020453b4(m->h18); m->h18 = 0;
        func_020453b4(m->h4);  m->h4 = 0;
    }
    func_020453b4(p->sub);
    p->sub = 0;
    func_020453b4(p);
}
