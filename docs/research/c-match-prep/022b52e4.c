/* CAMPAIGN-PREP candidate for func_022b52e4 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     C: declare loc0(0x3c) then loc3c(0x18) for sp+0 / sp+0x3c order; reload _c93c each call.
 *   risk:       struct-guessed: stack frame layout (loc0 at sp+0, loc3c at sp+0x3c, sizes 0x3c/0x18) inferred from offsets; if mwcc lays temps in a different slot order the str offsets (0x24/0x28) diverge.
 *   confidence: med
 */
/* func_ov002_022b52e4: init guard with stack Fill32 + struct field copies.
 * r5=a(struct*), r4=b(int). If *_c93c()[0]==0 return.
 * if b>=0: _84c0(D1B7C, &a->f4_as_words[0], &a->f4_as_words[1]) via a+4, a+8.
 * if b>=0 && b != _c93c()[1]: build sp+0x3c via _91554(CCBC8,b); if _a1784(D11BC):
 *   Fill32(0,&L0[0..0x3c]); _aadf8(&L0+4,&sp3c); L0[0x24]=a[1]; L0[0x28]=a[2]; _22b74(&L0).
 * _cca4(b); if (*(u16*)(L3+0x54) & 0x800) _ce24(). */
extern void Fill32(int, void *, int);
extern char data_02104bac[];
extern char data_ov002_022ccbc8[];
extern char data_ov002_022d11bc[];
extern char data_ov002_022d1b7c[];
extern void func_02022b74(void *);
extern int *func_0202c93c(void);
extern void func_0202cca4(int);
extern void func_0202ce24(void);
extern void func_02091554(void *, char *, int);
extern void func_020aadf8(void *, void *);
extern int func_ov002_022a1784(char *);
extern void func_ov002_022b84c0(char *, int *, int *);

void func_ov002_022b52e4(int *a, int b) {
    unsigned char loc0[0x3c];
    unsigned char loc3c[0x18];
    if (func_0202c93c()[0] == 0) return;
    if (b >= 0) {
        func_ov002_022b84c0(data_ov002_022d1b7c, a + 1, a + 2);
    }
    if (b >= 0 && b != func_0202c93c()[1]) {
        func_02091554(loc3c, data_ov002_022ccbc8, b);
        if (func_ov002_022a1784(data_ov002_022d11bc)) {
            Fill32(0, loc0, 0x3c);
            func_020aadf8(loc0 + 4, loc3c);
            *(int *)(loc0 + 0x24) = a[1];
            *(int *)(loc0 + 0x28) = a[2];
            func_02022b74(loc0);
        }
    }
    func_0202cca4(b);
    if (*(unsigned short *)(data_02104bac + 0x54) & 0x800) {
        func_0202ce24();
    }
}
