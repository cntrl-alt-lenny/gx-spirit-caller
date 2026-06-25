/* CAMPAIGN-PREP candidate for func_021ccfcc (ov011, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     Multi-field RMW, one held base, hoisted orr temp
 *   risk:       WALL (multi-field RMW family). Also orig hoists `orr ...#0x10000000` into the held temp before later stores -> scheduling/reg-alloc won't match plain sequential C
 *   confidence: low
 */
/* func_ov011_021ccfcc: straight RMW sequence on data_ov011_021d4000.
 * MULTI-FIELD-RMW WALL (same family as 021ccf3c). The orig also keeps the
 * +0x2ac value live in a reg, sets bit 28 (orr #0x10000000) mid-body, and
 * writes it last - mwcc reorders/reg-allocs differently from sequential C.
 *
 *   r1 = [+0x2ac]; r1 = (r1 & ~0xff00000) | 0xff00000
 *   r1 |= 0x10000000              ; held, stored last
 *   [+0x260] = [+0x238] - [+0x258] + 0x80000
 *   [+0x264] = [+0x23c] - [+0x25c] + 0x60000
 *   [+0x2b0] &= ~0xff
 *   [+0x2ac] = r1
 */
extern char data_ov011_021d4000[];

void func_ov011_021ccfcc(void) {
    char *b = data_ov011_021d4000;
    int t = (*(int *)(b + 0x2ac) & ~0xff00000) | 0xff00000;
    t |= 0x10000000;
    *(int *)(b + 0x260) = *(int *)(b + 0x238) - *(int *)(b + 0x258) + 0x80000;
    *(int *)(b + 0x264) = *(int *)(b + 0x23c) - *(int *)(b + 0x25c) + 0x60000;
    *(int *)(b + 0x2b0) = *(int *)(b + 0x2b0) & ~0xff;
    *(int *)(b + 0x2ac) = t;
}
