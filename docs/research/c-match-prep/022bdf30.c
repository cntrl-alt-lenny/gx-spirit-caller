/* CAMPAIGN-PREP candidate for func_022bdf30 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     Fill32 stack rec, u16 key, bsearch func_020059b0, &table[idx]
 *   risk:       stack-frame/rec layout + comparator-ptr field + addcc early-return fragile; sibling ships as .s
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_ov002_022bdf30 (ov002, class A).
 *   recipe:  Fill32 a 4-byte stack rec, store fn-ptr field + u16 key, call a
 *            bsearch-like func_020059b0(rec, table, count, 4); on hit return
 *            &table[idx], else 0
 *   risk:    stack-frame layout (sub sp,#8; rec @sp+4, ptr @sp) and the
 *            (key<<16)>>16 zero-extend + addcc/ldmccia early-return are fragile;
 *            sibling shipped as .s for similar reasons
 *   confidence: low
 */

extern void Fill32(int value, void *dst, unsigned int size);
extern int  func_020059b0(void *key, void *base, int count, int width);
extern unsigned int data_020c7ac0[];   /* count */
extern int          data_020c7ac4[];   /* result table (stride 4) */
extern int          func_ov002_022bdfb4(void);  /* comparator, stored in rec */

int *func_ov002_022bdf30(int key)
{
    int (*cmp)(void);
    unsigned short krec;
    int idx;
    cmp = func_ov002_022bdfb4;
    Fill32(0, &krec, 4);
    krec = (unsigned short)key;
    idx = func_020059b0(&krec, data_020c7ac4, (int)data_020c7ac0[0], 4);
    if (idx >= 0 && (unsigned int)idx < data_020c7ac0[0])
        return &data_020c7ac4[idx];
    return 0;
}
