/* CAMPAIGN-PREP candidate for func_021b40d4 (ov019, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS D: low-3-bit read as `unsigned :3` bitfield (gives lsl#29;lsr#29); min(x,0x63) as if-assign; *12 idx then u16 trunc via <<16>>16.
 *   risk:       struct-guessed + TRUNCATED: function cut off after first func_020195b8; the 0x19 branch's `(m-3)<=1 vs >1` sense, packed args to 2818/2938, and the :3 field at [+4] are inferred.
 *   confidence: low
 */
// func_ov019_021b40d4 : cmp-chain dispatch + :3 bitfield + *12 index
// NOTE: source asm TRUNCATED mid-function; visible portion modelled.
extern int func_0202c0c0(int id);
extern int func_020195b8(int a, int sel);
extern int func_ov019_021b2818(int packed);
extern int func_ov019_021b2938(int a, int *b, int c);
extern int data_ov019_021b6334;       // _LIT1
struct Cfg40 { int w0; unsigned mode:3; };   // _LIT0 = data_02104f4c, low-3 of [+4]
extern struct Cfg40 data_02104f4c;

int func_ov019_021b40d4(int a0, int kind, int idx)
{
    int r2v, r1v;
    if (kind == 0x13 || kind == 0x48) {
        unsigned m = data_02104f4c.mode;        // (x<<29)>>29
        if (m != 0) r2v = func_0202c0c0(kind + 0x1dc + 0x400);
        else        r2v = func_0202c0c0(kind + 0x178 + 0x400);
    } else if (kind == 0x19) {
        unsigned m = data_02104f4c.mode;
        if ((int)(m - 3) > 1)                   /* cmp (m-3),#1; bhi */
            r2v = func_0202c0c0(kind + 0x178 + 0x400);
        else
            r2v = func_0202c0c0(kind + 0x1dc + 0x400);
    } else {
        r2v = func_0202c0c0(kind + 0x178 + 0x400);
    }

    {
        int idx16 = (idx * 0xc + 0x348) << 16 >> 16;   /* u16 trunc */
        func_ov019_021b2938(idx16, &data_ov019_021b6334, 0x500);
    }

    r1v = func_020195b8(kind, 0);
    if (r1v > 0x63) r1v = 0x63;
    func_ov019_021b2818(((idx * 3 + 0x3a8) << 7) + 0x6600000);

    /* TRUNCATED: r1v re-fetched for sel=1 path, plus tail, not in source asm */
    (void)a0; (void)r2v;
    return 0;
}
