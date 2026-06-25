/* CAMPAIGN-PREP candidate for func_0201e5b8 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     GUARD/scan loop; FourCC literals reloaded into held regs; if-else-if order
 *   risk:       loop reg-alloc: orig pins 3 FourCC consts + base in callee regs; literal-pool order/holding may flip
 *   confidence: low
 */
/* func_0201e5b8: tag-dispatch scan over a list of variable-size entries.
 * h->f_0 is a block base; block+0xc is a u16 start offset, block+0xe a u16
 * count. Each entry: 4-byte tag at +0, next-size at +4. Tags compared in
 * order OBJD, BGDT, PALT (FourCC literals). PALT also requires h->f_10 != -1
 * (signed halfword). Tail: func_0209286c() then return 0. */

extern int func_0201d778(void *h, void *entry);
extern int func_0201de34(void *h, void *entry);
extern int func_0201e4cc(void *h, void *entry);
extern void func_0209286c(void);

typedef struct {
    char         *f_0;       /* +0x00 block base */
    char          _pad4[0xc];
    short         f_10;      /* +0x10 signed halfword */
} hdr_e5b8;

int func_0201e5b8(hdr_e5b8 *h) {
    char *block = h->f_0;
    int count = *(unsigned short *)(block + 0xe);
    char *e = block + *(unsigned short *)(block + 0xc);
    int i;
    for (i = 0; i < count; i++) {
        unsigned int tag = *(unsigned int *)e;
        if (tag == 0x444a424f) {
            func_0201e4cc(h, e);
        } else if (tag == 0x54444742) {
            func_0201de34(h, e);
        } else if (tag == 0x544c4150 && h->f_10 != -1) {
            func_0201d778(h, e);
        }
        e += *(int *)(e + 4);
    }
    func_0209286c();
    return 0;
}
