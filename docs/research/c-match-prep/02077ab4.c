/* CAMPAIGN-PREP candidate for func_02077ab4 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     unsigned bound check (cmp;cs) then single tail call
 *   risk:       on idx>=0x20 path r0 is left = idx (no mov) — return type/value of guard path; field_4 load from global table base
 *   confidence: med
 */
extern unsigned char data_021a63d0;
extern int func_0209181c(void *a);

extern void *const data_021a63d0_tbl[];   /* _LIT0 base; field +0x4 used */

struct Hdr02077ab4 {
    int field_0;
    void *field_4;                  /* +0x4 */
};

int func_02077ab4(unsigned int idx)
{
    if (idx >= 0x20)
        return idx;                 /* bxcs lr: r0(=idx) returned untouched */
    return func_0209181c(((struct Hdr02077ab4 *)&data_021a63d0)->field_4);
}
