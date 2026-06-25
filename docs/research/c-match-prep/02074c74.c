/* CAMPAIGN-PREP candidate for func_02074c74 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     guard+branch-tail, store-order, tail call
 *   risk:       struct field offsets guessed; r4=obj hoisted before guard may reorder; tail-call return type
 *   confidence: med
 */
extern int func_02070d90(void);
extern int func_02074cdc(void *a);
extern void func_02077f8c(void *a);
extern void func_020785cc(void *a);

struct S02074c74 {
    char pad8[0x8];
    unsigned char state;            /* +0x8 */
    void *obj;                      /* +0xc */
};

struct Inner02074c74 {
    char pad1d4[0x1d4];
    int field_1d4;                  /* +0x1d4 */
    char pad2ec[0x2ec - 0x1d8];
    char field_2ec;                 /* +0x2ec (passed to func_020785cc) */
    char pad3a4[0x3a4 - 0x2ed];
    char field_3a4;                 /* +0x3a4 (passed to func_02077f8c) */
    char pad454[0x454 - 0x3a5];
    unsigned char field_454;        /* +0x454 */
    unsigned char field_455;        /* +0x455 */
};

int func_02074c74(struct S02074c74 *p)
{
    struct Inner02074c74 *o = (struct Inner02074c74 *)p->obj;

    if (p->state != 4) {
        if (func_02070d90() != 0)
            return 1;
    }

    o->field_455 = 0;
    o->field_1d4 = 0;
    o->field_454 = 0;
    func_020785cc(&o->field_2ec);
    func_02077f8c(&o->field_3a4);
    return func_02074cdc(p);
}
