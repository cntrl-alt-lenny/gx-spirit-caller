/* CAMPAIGN-PREP candidate for func_021b3ecc (ov015, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS D: byte-extract f0 via (x<<24)>>24; bit0 = (x<<0x1f)>>0x1f, bit1 = (x<<0x1e)>>0x1f; reload handle data+0x890 twice (orig re-ldr's _LIT0).
 *   risk:       reshape-able / struct-guessed: orig RELOADS data+0x890 for the second hook (two ldr _LIT0). The two explicit reads force that. Risk that the :1 bitfield decode emits ubfx-style vs the orig lsl#0x1f/lsr#0x1f pair — keep the explicit shift form (shown), not a bitfield read, to match.
 *   confidence: low
 */
/* func_ov015_021b3ecc: notify two ov005 hooks with a global handle, then if id!=0 look up
 * the record (0200a2f4 over id-1), kick 021b35d0 with its low byte, and write two optional
 * out-params decoded from bitfields at +0x4 (bit0 -> 0 or 0x3fff; bit1 -> 1 or 2). */
extern char data_ov015_021b5e28[];          /* global; handle at +0x890 */
extern int  func_0200a2f4(int idx);
extern void func_ov005_021ab3a0(int handle, int id);
extern void func_ov005_021ab3b4(int handle, int id);
extern void func_ov015_021b35d0(int v);

struct rec015 {
    unsigned short f0;
    unsigned short f4 : 1;   /* +0x4 bit0 -> out1 */
    unsigned short g4 : 1;   /* +0x4 bit1 -> out2 */
    char _pad[2];
};

int func_ov015_021b3ecc(int id, int *out1, int *out2)
{
    struct rec015 *r;
    func_ov005_021ab3a0(*(int *)(data_ov015_021b5e28 + 0x890), id);
    func_ov005_021ab3b4(*(int *)(data_ov015_021b5e28 + 0x890), id);
    if (id == 0) return 0;
    r = (struct rec015 *)func_0200a2f4(id - 1);
    func_ov015_021b35d0((unsigned char)r->f0);
    if (out1 != 0) {
        if (((*(unsigned short *)((char *)r + 4) << 0x1f) >> 0x1f) == 1) *out1 = 0;
        else *out1 = 0x3fff;
    }
    if (out2 != 0) {
        if (((*(unsigned short *)((char *)r + 4) << 0x1e) >> 0x1f) == 1) *out2 = 1;
        else *out2 = 2;
    }
    return 1;
}
