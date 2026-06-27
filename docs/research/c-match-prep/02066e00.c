/* CAMPAIGN-PREP candidate for func_02066e00 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     guard chain n<1||n>0x40; signed r[n-1]; reload q->cursor each use; cursor-first in final add
 *   risk:       final RMW reloads q->cursor 3x (ldr r2/r0/r1) and adds cursor+(len+1) cursor-first; mwcc may CSE cursor into one load or flip the add operand order. permuter-class; also struct-guessed on the +0x44 sub-object and +0x800 cursor.
 *   confidence: low
 */
/* func_02066e00 - main - class C
 * guard chain + 0x48 stack buf + struct-base binds, reloaded cursor
 * p+0x44 sub-obj; q->cursor at +0x800 (byte ptr arith); r = signed char[]
 */
typedef struct { unsigned char data[0x800]; int cursor; /* +0x800 */ } QBuf;

extern int  func_020aaddc(const char *s);          /* strlen-like */
extern void func_020aadf8(void *buf, signed char *r);
extern void func_02066ee0(void *sub, int len, void *buf, int k);
extern void func_02067024(void *buf, int k, char *dst);

void func_02066e00(void *p, QBuf *q, signed char *r, int n)
{
    unsigned char buf[0x48];
    int len;

    if (n < 1 || n > 0x40)
        return;
    if (r[n - 1] != 0)
        return;
    func_020aadf8(buf, r);
    len = func_020aaddc((char *)p + 0x44);
    func_02066ee0((char *)p + 0x44, len, buf, n - 1);
    func_02067024(buf, n - 1, q->data + q->cursor);
    q->cursor = q->cursor + (func_020aaddc(q->data + q->cursor) + 1);
}
