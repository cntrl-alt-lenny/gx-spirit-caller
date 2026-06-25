/* CAMPAIGN-PREP candidate for func_0208822c (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     bounds guard (>field-1) + byte-array index + (1<<byte) tail call
 *   risk:       f48 fetched as field then -1 must keep cmp r1,(f48-1) with gt; byte array at 0x4c guessed
 *   confidence: med
 */
/* func_0208822c: bounds-check idx against field_48-1, index a byte
 * array at +0x4c, tail-call with (1 << f4c[idx]) and the passed v.
 */

typedef struct St822c {
    char _pad_00[0x48];
    int  field_48;           /* +0x48 count */
    unsigned char arr_4c[1]; /* +0x4c byte array */
} St822c;

extern void func_02094ee8(int mask, int v);

void func_0208822c(St822c *p, int idx, int v) {
    if (idx > p->field_48 - 1) return;
    func_02094ee8(1 << p->arr_4c[idx], v);
}
