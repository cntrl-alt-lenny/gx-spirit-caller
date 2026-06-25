/* CAMPAIGN-PREP candidate for func_022074dc (ov002, class D) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     6-bit field eq-dispatch + bit0&1 table index + unsigned cmp
 *   risk:       redundant `& 1` on :1 field must survive (orig has `and #1`); mul-not-mla since base loaded separately
 *   confidence: med
 */
/* func_ov002_022074dc: frameless field6 dispatch + per-player table threshold.
 *   field6 (bits6..11 of u16@+2): if == 0x23 return 1;
 *   else return (unsigned)*(int*)(cf188 + (bit0&1)*0x868) >= 7;
 *     ldrh; r1=(x<<20)>>26; cmp#0x23; moveq#1; bxeq
 *     r1=(x<<31)>>31; and#1; mul r2,r1,#0x868; ldr[cf188,r2]; cmp#7; movcs#1; movcc#0
 */
typedef unsigned short u16;
struct S022074dc { u16 b0 : 1; u16 pad : 5; u16 k : 6; };
extern char data_ov002_022cf188[];

int func_ov002_022074dc(void *self) {
    struct S022074dc *s = (struct S022074dc *)((char *)self + 2);
    if (s->k == 0x23) return 1;
    return (unsigned)*(int *)(data_ov002_022cf188 + (s->b0 & 1) * 0x868) >= 7;
}
