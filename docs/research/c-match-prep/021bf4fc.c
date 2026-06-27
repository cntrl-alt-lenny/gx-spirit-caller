/* CAMPAIGN-PREP candidate for func_021bf4fc (ov006, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: mode via data_02104f4c.chan :3 (lsl#29;lsr#29); width/2 signed /2; 0xa5-w/2 rsb; two stack args 0xc; family shape
 *   risk:       reshape-able: closely matches the proven centred-text-layout family; main divergence is the signed /2 (add x,x,lsr#31;asr#1) and the stack-arg store of the two 0xc consts — both family-proven. struct-guessed data_02255448 +0x240.
 *   confidence: med
 */
/* func_ov006_021bf4fc: lay out one centred text element — pick a glyph source
 * (mode-dependent), measure it, optionally re-measure at a smaller size when too
 * wide, then emit it centred at x = 0xa5 - width/2. Returns 1. (class D:
 * :3 mode bitfield + signed /2; 0201e5b8 text-layout family.) */
extern char data_ov006_02255448[];
extern void *func_0208dd9c(void);
extern int  func_02094504(int a, void *b, int c);
extern void func_02001d68(int mode);
extern void func_02001d98(void *p, int a);
extern int  func_0202c0c0(int id);
extern int  func_0202c44c(void);
extern int  func_02005554(int g, int a, int b);
extern void func_02004f58(void *p, int g, void *base, int x, int e, int f);
struct Ov006Mode { int w0; unsigned chan : 3; };
extern struct Ov006Mode data_02104f4c;

int func_ov006_021bf4fc(char *obj) {
    void *vram = func_0208dd9c();
    int g;
    int w;

    func_02094504(0, (char *)vram + 0x40, 0x1000);
    func_02001d68(data_02104f4c.chan);
    func_02001d98(obj + 4, 5);

    if (*(int *)(data_ov006_02255448 + 0x240) == 0)
        g = func_0202c0c0(0x1cd);
    else
        g = func_0202c44c();

    w = func_02005554(g, 0xc, 5);
    if (w >= 0xa8) {
        func_02001d98(obj + 4, 4);
        w = func_02005554(g, 0xc, 4);
    }

    func_02004f58(obj + 4, g, (char *)vram + 0x40, 0xa5 - w / 2, 0xc, 0xc);
    func_02001d98(obj + 4, -1);
    return 1;
}
