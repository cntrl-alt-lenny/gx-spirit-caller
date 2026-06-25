/* CAMPAIGN-PREP candidate for func_02037328 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     counted scan loop; AND guard chain; bind base, post-inc walk
 *   risk:       Entry field offsets (0x68 u16, 0x6a s8) guessed; loop-counter vs pointer reg-alloc may flip
 *   confidence: med
 */
/* func_02037328: scan 28 fixed-stride entries; return 1 if any entry
 * other than `arg` passes the byte[0x6a]>=0 and !(half[0x68] & 0x3003)
 * filters, else 0.
 *
 *   ldrsb r2,[r3,#0x6a]; cmp r2,#0; blt continue   -> e->f6a >= 0
 *   ldrh  r2,[r3,#0x68]; tst r2,r1; bne continue    -> !(e->f68 & 0x3003)
 *   cmp r3,r0; movne r0,#1; bxne lr                 -> e != arg -> return 1
 */

typedef struct {
    char           _pad_00[0x68];
    unsigned short f68;   /* +0x68 */
    unsigned char  _pad_6a_lo;
    signed char    f6a;   /* +0x6a */
    char           _pad_6b[0x78 - 0x6b];
} Entry;

extern Entry data_0219b760[28];

int func_02037328(Entry *arg) {
    Entry *e = data_0219b760;
    int i;

    for (i = 0; i < 28; i++, e++) {
        if (e->f6a >= 0 && !(e->f68 & 0x3003) && e != arg) {
            return 1;
        }
    }
    return 0;
}
