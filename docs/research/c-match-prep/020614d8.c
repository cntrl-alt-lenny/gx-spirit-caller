/* CAMPAIGN-PREP candidate for func_020614d8 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     Class D: store-order pos++ before strb; bounds blt -> pos>=cap; line 0x23; explicit temp.
 *   risk:       reshape-able: same store-before-strb idiom as 02061464; explicit i=pos;pos=i+1;store forces order. Lower risk (single byte). struct-guessed on +4/+8 field layout only.
 *   confidence: high
 */
/* func_020614d8 — append a single byte to a writer with bounds assert (class D: store-order).
 * struct: +0 = u8* buf, +4 = int cap, +8 = int pos. Assert when pos >= cap.
 * pos advanced (stored) before the strb, pre-increment index.
 */
typedef unsigned char u8;

typedef struct {
    u8 *buf;   /* +0 */
    int cap;   /* +4 */
    int pos;   /* +8 */
} Writer;

extern char data_02101448[];   /* _LIT1 */
extern char data_021014c0[];   /* _LIT0 */
extern void func_020a6d54(const char *a, const char *b, int c, int line);

void func_020614d8(Writer *w, int val)
{
    int i;

    if (w->pos >= w->cap) {
        func_020a6d54(data_021014c0, data_02101448, 0, 0x23);
    }

    i = w->pos;
    w->pos = i + 1;
    w->buf[i] = (u8)val;
}
