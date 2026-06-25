/* CAMPAIGN-PREP candidate for func_02067294 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     if-assign min (cmp+movgt); avail=0x800-cursor via rsb; reload p->cursor each use, not bound
 *   risk:       p->cursor read once early (r3) then reloaded twice at tail (ldr r0 x2); if mwcc keeps the early r3 live for the final stores the two tail ldr collapse. reshape-able (separate p->cursor reads already force reloads) / struct-guessed on +0x800.
 *   confidence: med
 */
/* func_02067294 - main - class C
 * clamp len to remaining space + memcpy-like copy, NUL terminate
 * p->cursor at +0x800 (reloaded 3x); func_020aaddc strlen-like
 */
typedef struct { unsigned char data[0x800]; int cursor; /* +0x800 */ } QBuf;

extern int  func_020aaddc(const char *s);
extern void func_020a7368(char *dst, char *src, int n);

void func_02067294(QBuf *p, char *s)
{
    int n;
    int avail;

    n = func_020aaddc(s) + 1;
    avail = 0x800 - p->cursor;
    if (n > avail)
        n = avail;
    if (n == 0)
        return;
    func_020a7368(p->data + p->cursor, s, n);
    p->cursor = p->cursor + n;
    p->data[p->cursor - 1] = 0;
}
