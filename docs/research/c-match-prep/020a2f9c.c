/* CAMPAIGN-PREP candidate for func_020a2f9c (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     bind-vs-RELOAD (reload [base+4] twice); field stores; halfword store
 *   risk:       struct offsets guessed; mov-const scheduling (r3=1,r2=5 hoisted) may not interleave; ships .s = known reg-alloc wall
 *   confidence: low
 */
/* func_020a2f9c — global struct field stores via base ptr, RELOADS [base+4].
 * Leaf -> default mwcc 2.0/sp1p5 (plain .c). Currently ships as .s (reg-alloc walled).
 * data_021a9850: struct; field+4 = inner ptr; inner+0x400+0xb0 = u16; inner+0x4b4 = u8.
 */

typedef struct {
    char _pad04[0x4];
    unsigned char *f_4;     /* +0x4 inner pointer */
    char _pad08[0x4];
    unsigned char  f_c;     /* +0xc */
    unsigned char  f_d;
    unsigned char  f_e;     /* +0xe */
} data_021a9850_t;

extern data_021a9850_t data_021a9850;

void func_020a2f9c(void)
{
    *(unsigned short *)(data_021a9850.f_4 + 0x400 + 0xb0) = 1;
    data_021a9850.f_e = data_021a9850.f_4[0x4b4];
    data_021a9850.f_c = 5;
}
