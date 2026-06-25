/* CAMPAIGN-PREP candidate for func_0205d944 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     clear two fields, allocator with 5 args, store, bool-ize
 *   risk:       the 5th (stack) arg is the dtor func_0205d9a0; allocator arg order guessed; field offsets 0x428/0x42c/0x430 fixed
 *   confidence: med
 */
/* func_0205d944: zero two state fields (+0x430, +0x42c, in that order), then
 * allocate an object via func_02054840(0x1c, 4, ctor, free, dtor), store the
 * handle at +0x428, return (handle != 0).
 *
 *   r4=[r0]; r1=0; str r1,[r4,#0x430]; str r1,[r4,#0x42c]
 *   r0=_LIT0(func_0205d9a0); r2=_LIT1(func_0205da2c); str r0,[sp];
 *   r3=_LIT2(func_0205da1c); r0=0x1c; r1=4; bl func_02054840
 *   str r0,[r4,#0x428]; r0=[r4,#0x428]; cmp r0,#0; movne r0,#1; moveq r0,#0
 */
typedef struct {
    char  _pad_00[0x428];
    void *obj;         /* +0x428 */
    int   _0x42c;      /* +0x42c */
    int   _0x430;      /* +0x430 */
} obj_t;

extern void *func_02054840(int size, int count, void *ctor, void *dtor, void *teardown);
extern void  func_0205d9a0(void *p);
extern void  func_0205da1c(void);
extern void  func_0205da2c(void);

int func_0205d944(obj_t **pp) {
    obj_t *o = *pp;

    o->_0x430 = 0;
    o->_0x42c = 0;
    o->obj = func_02054840(0x1c, 4,
                           (void *)func_0205da2c,
                           (void *)func_0205da1c,
                           (void *)func_0205d9a0);
    return o->obj != 0;
}
