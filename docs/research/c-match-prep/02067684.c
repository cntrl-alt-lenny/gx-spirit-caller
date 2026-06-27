/* CAMPAIGN-PREP candidate for func_02067684 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     ordered struct stores; divmod-by-const => '%'; strcpy fields; alloc-or-static branch
 *   risk:       ASM TRUNCATED (460B, body cut at mvn r1,#0); param count/order, all byte offsets, the divmod constant (shown 100=placeholder) and the static-fallback symbol are struct-guessed; whole tail missing.
 *   confidence: low
 */
/* func_02067684 @ 0x02067684  (cls D, main) — large struct constructor (~14 params,
   ASM TRUNCATED in batch). Optional alloc(0x110) when handle==0, two strcpy fields,
   long ordered store block, then 4x divmod-by-constant byte writes at +0x84.
   func_020aadf8==strcpy; func_020a991c returns int; tail (after loop) not in provided asm. */
typedef unsigned char  u8;
typedef unsigned short u16;

extern u8   *func_020453e8(int size);
extern void  func_02055330(void);
extern void  func_020a9950(void);
extern void  func_020aadf8(char *dst, const char *src); /* strcpy */
extern int   func_020a991c(void);

struct C; /* opaque, offsets accessed by byte index below */

u8 *func_02067684(u8 **handle, int a1, int a2, const char *name,
                  const char *a5, int a6, int a7,
                  int a8, int a9, int a10, int a11, int a12, int a13, int a14)
{
    u8 *o;
    int i;

    if (handle == 0) {
        /* movs r5,r0; ldreq r5,_LIT0 — when arg0 null, use a static object */
        extern u8 _gx_static_2067684[];
        o = _gx_static_2067684;
    } else {
        o = func_020453e8(0x110);
        *(u8 **)handle = o;
        o = *(u8 **)handle;
    }

    func_02055330();
    func_020a9950();
    func_020aadf8((char *)(o + 0x4),  name);
    func_020aadf8((char *)(o + 0x44), a5);

    *(int *)(o + 0xC0) = a2;
    *(int *)(o + 0xAC) = 0;
    *(int *)(o + 0xB0) = 0;
    *(int *)(o + 0x00) = a1;
    *(int *)(o + 0xB8) = 1;
    *(int *)(o + 0x10C) = a14;
    *(int *)(o + 0x88) = a8;
    *(int *)(o + 0x8C) = a9;
    *(int *)(o + 0x90) = a10;
    *(int *)(o + 0x94) = a11;
    *(int *)(o + 0x98) = a12;
    *(int *)(o + 0x9C) = a13;
    *(int *)(o + 0xA0) = 0;
    *(int *)(o + 0xA4) = 0;
    *(int *)(o + 0xD4) = 0;
    *(int *)(o + 0xBC) = a6;
    *(int *)(o + 0xC4) = 0;
    *(int *)(o + 0xC8) = a7;
    *(int *)(o + 0x104) = 0;
    *(u16 *)(o + 0x108) = 0;
    *(int *)(o + 0xA8) = 0;
    *(int *)(o + 0xB4) = 0;

    for (i = 0; i < 4; i++) {
        *(u8 *)(o + 0x84 + i) = (u8)(func_020a991c() % 100);
    }
    /* TRUNCATED: original continues after the loop (mvn r1,#0x0 ...) */
    return o;
}
