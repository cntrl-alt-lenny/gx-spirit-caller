/* CAMPAIGN-PREP candidate for func_02061464 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     Class D: store-order — pos++ store BEFORE each strb; val signed (asr#8); explicit temp i.
 *   risk:       reshape-able: orig stores pos+1 then does strb at OLD pos (store-before-write); a plain buf[pos++] emits the increment after — the explicit i=pos;pos=i+1;store ordering should force it. struct-guessed on +4/+8 layout.
 *   confidence: med
 */
/* func_02061464 — append a 16-bit value big-endian to a writer (class D: store-order).
 * struct: +0 = u8* buf, +4 = int cap, +8 = int pos. Bounds assert if pos+2 > cap.
 * High byte (val>>8) then low byte; each strb preceded by its own pos++ store.
 */
typedef unsigned char u8;

typedef struct {
    u8 *buf;   /* +0 */
    int cap;   /* +4 */
    int pos;   /* +8 */
} Writer;

extern char data_02101448[];   /* _LIT1 (file/string for assert)  */
extern char data_0210149c[];   /* _LIT0 (msg for assert)          */
extern void func_020a6d54(const char *a, const char *b, int c, int line);

void func_02061464(Writer *w, int val)
{
    int i;

    if (w->pos + 2 > w->cap) {
        func_020a6d54(data_0210149c, data_02101448, 0, 0x2e);
    }

    /* pos is advanced (stored) before each strb, using the pre-increment index. */
    i = w->pos;
    w->pos = i + 1;
    w->buf[i] = (u8)(val >> 8);
    i = w->pos;
    w->pos = i + 1;
    w->buf[i] = (u8)val;
}
