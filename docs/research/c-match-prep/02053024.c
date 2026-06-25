/* CAMPAIGN-PREP candidate for func_02053024 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     12-byte ldmia/stmia struct copy to self+0x10; store self->f1c=val between copy and call (store-order); 0x400 stack buf; orr flag set last
 *   risk:       `str ip,[r4,#0x1c]` is scheduled after the stmia but before bl func_020a67cc; if mwcc sinks the f1c store past the call, order diverges. reshape-able (place `self->f1c=val;` immediately after the struct copy, before any call)
 *   confidence: med
 */
/* func_02053024: copy header, init 0x400 crc buffer, store result + set flag.
 * r0=self, r1=src, r2=val. _LIT0 = 0xedb88320 (CRC32 reversed poly).
 */

typedef struct { unsigned int a, b, c; } Tri;

typedef struct {
    char         _pad0[0x10];
    Tri          hdr;      /* +0x10 .. +0x1b */
    int          f1c;      /* +0x1c */
    unsigned int f20;      /* +0x20 (flags) */
    char         _pad1[0x18];
    int          f3c;      /* +0x3c */
} Obj;

extern void func_020a67cc(void *buf, unsigned int poly);
extern int  func_020a66e8(void *buf, void *self, int len);

void func_02053024(Obj *self, Tri *src, int val) {
    unsigned char buf[0x400];

    self->hdr = *src;
    self->f1c = val;
    func_020a67cc(buf, 0xedb88320);
    self->f3c = func_020a66e8(buf, self, 0x3c);
    self->f20 |= 1;
}
