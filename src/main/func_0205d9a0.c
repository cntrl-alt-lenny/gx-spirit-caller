/* CAMPAIGN-PREP candidate for func_0205d9a0 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     guarded nested free+null teardown, store-order, mid call
 *   risk:       single-arg free decl vs real 4-arg func_020453b4; nested loads keep r4 base — reload-vs-bind matches asm here
 *   confidence: med
 */
/* func_0205d9a0: teardown. If p->_0x8 is set, free its _0x8 and _0xc subobjects
 * (nulling each), then free _0x8 itself and null it. Then func_02059d90(p),
 * free _0x10 (null), free _0x18 (null).  func_020453b4 is the free helper
 * (only r0 is set at each call site, so a 1-arg decl reproduces the codegen).
 *
 *   r4=p; r0=[r4,#8]; cmp r0,#0; beq .L
 *   r0=[r0,#8]; bl free; [r4,#8]->_8 = 0
 *   r0=[[r4,#8],#0xc]; bl free; [r4,#8]->_c = 0
 *   r0=[r4,#8]; bl free; [r4,#8] = 0
 * .L: func_02059d90(r4); free([r4,#0x10]); [r4,#0x10]=0; free([r4,#0x18]); [r4,#0x18]=0
 */
typedef struct sub  sub_t;
typedef struct node node_t;

struct sub {
    char  _pad_00[0x8];
    void *_0x8;        /* +0x8 */
    void *_0xc;        /* +0xc */
};

struct node {
    char   _pad_00[0x8];
    sub_t *sub;        /* +0x8 */
    char   _pad_0c[0x10 - 0xc];
    void  *_0x10;      /* +0x10 */
    char   _pad_14[0x18 - 0x14];
    void  *_0x18;      /* +0x18 */
};

extern void func_020453b4(void *p);   /* free; real sig has 3 unused tail args */
extern void func_02059d90(node_t *p);

void func_0205d9a0(node_t *p) {
    if (p->sub != 0) {
        func_020453b4(p->sub->_0x8);
        p->sub->_0x8 = 0;
        func_020453b4(p->sub->_0xc);
        p->sub->_0xc = 0;
        func_020453b4(p->sub);
        p->sub = 0;
    }
    func_02059d90(p);
    func_020453b4(p->_0x10);
    p->_0x10 = 0;
    func_020453b4(p->_0x18);
    p->_0x18 = 0;
}
