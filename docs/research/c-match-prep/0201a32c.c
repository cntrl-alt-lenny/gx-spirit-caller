/* CAMPAIGN-PREP candidate for func_0201a32c (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     u8 bitfield struct word-RMW; if-assign clamp >0xff; emit byte3 store then byte2 store in order
 *   risk:       struct-guessed: the lo16:16/byte2:8/byte3:8 layout at +0x8e4 is inferred; if real fields differ the bic/orr masks (0xff000000 / 0xff0000) and clamp-insert order diverge. Clamp shape is solid.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_0201a32c (main, class D, MED tier).
 * UNVERIFIED + ITERATION-EXPECTED. Two adjacent u8 bitfields in word at sys+0x8e4,
 * each: field += amount; if (field > 0xff) field = 0xff;  (word RMW bic/orr, store-order).
 *   byte3 (bits24-31): += a (the arg). byte2 (bits16-23): if(a>=0xa) a=0xf; += a.
 */
extern char *GetSystemWork(void);

struct sysfld {
    unsigned lo16 : 16;
    unsigned byte2 : 8;   /* bits 16-23, (w<<8)>>24 */
    unsigned byte3 : 8;   /* bits 24-31, w>>24      */
};

void func_0201a32c(int a) {
    struct sysfld *p = (struct sysfld *)(GetSystemWork() + 0x8e4);
    int s;
    s = a + p->byte3;
    if (s > 0xff) s = 0xff;
    p->byte3 = s;
    if (a >= 0xa) a = 0xf;
    s = a + p->byte2;
    if (s > 0xff) s = 0xff;
    p->byte2 = s;
}
