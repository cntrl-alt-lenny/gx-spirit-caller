/* CAMPAIGN-PREP candidate for func_02016b60 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     GetSystemWork bitfield-guard + nested jump-table dispatch, tail stores
 *   risk:       0x8d8&1 guard compiles to `and #1` not `lsl;lsr` (020186b0 wall); jump-tables + cond loads likely diverge
 *   confidence: low
 */
/* func_02016b60: GetSystemWork-singleton state handler. r0 = task ptr.
 * w[0x8d8]:bit0 enable-guard; w[0x920] = primary state (0..4 jump table);
 * w[0x924] = substate (0..4 jump table). o[8] = task message/action id.
 * NOTE: shipped as .s in-tree (brief 302) because the bit0 guard
 * `(v<<31)>>31` lowers to `and r0,#1` under mwcc, not the baserom's
 * `lsl#31; movs lsr#31` (see func_020186b0.s). C provided for completeness. */
extern char *GetSystemWork(void);
extern void func_02018a38(int);
extern void func_02018a64(void);
extern int  func_020195ec(void);
extern int  func_02019664(void);
extern void func_0201aaf4(int);
extern void func_0201b708(int);
extern void func_0201b730(int);
extern void func_0201b7b4(void);
extern int  func_0201b7e0(void *);

void func_02016b60(void *o) {
    char *w = GetSystemWork();
    if (!((*(unsigned int *)(w + 0x8d8) << 0x1f) >> 0x1f))
        return;
    switch (*(int *)(w + 0x920)) {
    case 0:
        if (func_0201b7e0(o) != 3) return;
        if (func_02019664() != 0x7a) return;
        *(int *)((char *)o + 8) = 0x001e0100;
        func_0201aaf4(0x7a);
        return;
    case 1:
        if (func_0201b7e0(o) == 4)
            *(int *)((char *)o + 8) = 0x001e0200;
        return;
    case 2:
        *(int *)((char *)o + 8) = 0x001e0300;
        *(int *)(w + 0x900) |= 0x1000000;
        func_02018a38(0x14);
        func_0201b708(0xc);
        return;
    case 3:
        switch (*(int *)(w + 0x924)) {
        case 0:
            *(int *)(w + 0x924) = 4;
            /* fallthrough */
        case 3:
            if (func_02019664() != 0x71) return;
            *(int *)((char *)o + 8) = 0x001e0400;
            func_02018a64();
            *(int *)(w + 0x8e0) = (*(int *)(w + 0x8e0) & ~1) | 1;
            return;
        case 2:
            if (((*(unsigned int *)(w + 0x8e0) << 0x1f) >> 0x1f)) return;
            if (func_020195ec() == 0)
                *(int *)((char *)o + 8) = 0x001e0401;
            else
                *(int *)((char *)o + 8) = 0x001e0402;
            return;
        case 1:
            *(int *)((char *)o + 8) = 0x001e0403;
            *(int *)(w + 0x900) &= ~0x1000000;
            func_0201b7b4();
            func_0201b730(0xc);
            return;
        }
        return;
    }
}
