/* CAMPAIGN-PREP candidate for func_021b36bc (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     outer 2x cd3f4(+0xce,+=0x14) / inner next-walk; :4 tag>=6; lo==A&&hi==B; iter-branch fields; (a)|(b<<8) pack
 *   risk:       reshape-able: the field-pick branch reloads cd3f4 base (not the walking `slot` ptr) in the iter!=0 arm — keep the literal data_ov002_022cd3f4 (not slot) so mwcc re-derives the base, matching the LIT0 reload.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov002_021b36bc (ov002, class D) — brief 494.
 * UNVERIFIED build-free draft. recipe: outer 2-iter loop over cd3f4 (head @+0xce,
 * +=0x14/iter), inner d0650 walk, :4 tag>=6, byte-split key0 == (A,B); on hit
 * pick fields by iter (iter? {[+0x4],[+0x20]} : {[+0],[+0x1c]}) and return
 * u16 (lo&0xff)|((hi&0xff)<<8); shifted-or operand-first; fall off -> 0xffff.
 */
typedef unsigned short u16;

extern char data_ov002_022cd3f4[];   /* slot table, +0xce head, 0x14 stride */
extern char data_ov002_022d0650[];

struct Node36bc { u16 key0; u16 tag : 4; u16 _r : 12; u16 key1; u16 next; };

u16 func_ov002_021b36bc(int A, int B) {
    char *slot = data_ov002_022cd3f4;
    int iter;

    for (iter = 0; iter < 2; ++iter) {
        u16 id = *(u16 *)(slot + 0xce);
        while (id != 0) {
            struct Node36bc *p = (struct Node36bc *)(data_ov002_022d0650 + id * 8);
            id = p->next;
            if (p->tag >= 6) {
                int hi = (p->key0 >> 8) & 0xff;
                if ((p->key0 & 0xff) == A && hi == B) {
                    int a, b;
                    if (iter != 0) {
                        a = *(int *)(data_ov002_022cd3f4 + 0x4);
                        b = *(int *)(data_ov002_022cd3f4 + 0x20);
                    } else {
                        a = *(int *)(data_ov002_022cd3f4 + 0);
                        b = *(int *)(data_ov002_022cd3f4 + 0x1c);
                    }
                    return (u16)((a & 0xff) | ((b & 0xff) << 8));
                }
            }
        }
        slot += 0x14;
    }
    return 0xffff;
}
