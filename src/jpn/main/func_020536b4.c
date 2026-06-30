/* CAMPAIGN-PREP candidate for func_020536b4 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     two-field masked load -> long-long; volatile orr-#0 marker
 *   risk:       f_0/f_4 offsets guessed; load ordering of the two ldr may reorder vs orig; 0x7ff pool literal
 *   confidence: high
 */
/* func_020536b4: load two fields, mask the first, return as a 64-bit pair.
 *   lo = p->f_4 (raw);  hi = p->f_0 & 0x7ff
 *   return ((u64)hi << 32) | lo;     // r0=lo=f_4, r1=hi=f_0&0x7ff
 * The orr rN,rN,#0 on both halves is mwcc's volatile-read marker
 * (cf. matched sibling func_02053698.c). f_0 is the masked field. */

typedef struct {
    volatile unsigned int f_0;   /* 0x0  -> & 0x7ff */
    volatile unsigned int f_4;   /* 0x4  -> raw low half */
} obj_t;

unsigned long long func_020536b4(obj_t *p) {
    unsigned int hi = p->f_0 & 0x7ff;
    unsigned int lo = p->f_4;
    return ((unsigned long long)hi << 32) | lo;
}
