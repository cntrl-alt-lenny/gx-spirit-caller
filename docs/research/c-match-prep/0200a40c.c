/* CAMPAIGN-PREP candidate for func_0200a40c (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     BITFIELD :8 and :1 (shift pairs) + BIND-once base + early-return loop
 *   risk:       bit-1 :1 field placement guessed; r0=0 hoist vs trailing mov may flip; layout guessed
 *   confidence: med
 */
/* func_0200a40c — early-return scan over 0x50 entries, stride 6.
   act test: ldrh + (h<<24>>24) => :8 unsigned bitfield (skip if zero).
   b1 test: ldrh[+4] + (h<<30>>31) => bit 1 of f4 as :1 bitfield; if !b1 return 1. */

extern unsigned short data_02106810;

struct Ent2 {
    unsigned short act : 8;   /* 0x0 low byte */
    unsigned short      : 8;
    unsigned short _pad;      /* 0x2 */
    unsigned short b0  : 1;   /* 0x4 bit0 */
    unsigned short b1  : 1;   /* 0x4 bit1 (lsl#30; lsr#31) */
    unsigned short      : 14;
};

int func_0200a40c(void)
{
    struct Ent2 *e = (struct Ent2 *)&data_02106810;
    int i = 0;
    do {
        if (e->act) {
            if (!e->b1)
                return 1;
        }
        i++;
        e++;
    } while (i < 0x50);
    return 0;
}
