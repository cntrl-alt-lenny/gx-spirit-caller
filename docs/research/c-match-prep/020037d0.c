/* CAMPAIGN-PREP candidate for func_020037d0 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: range jump-table (idx-8) selecting (stride,base,tag) + mla tail call
 *   risk:       permuter-class: already .s-shipped. The jump-table pads odd cases to default (b .L_888), and the mla(stride*a1+base) plus 5 ordered stack stores need exact reg assignment (lr/ip/r4/r5). Switch lowering + arg scheduling is a coin-flip a reshape won't reliably fix.
 *   confidence: low
 */
/* func_020037d0: range switch (idx-8, valid 0/2/4/6/8) selecting per-case
 * (stride, struct-field, tag), then mla index + tail call func_02001f18.
 *   sw (a_idx) { case 8: stride=0x20, base=g.f_88, tag=4; ...
 *     case 16:0x80,f_a8,8 } ; ptr = base+0x80 + stride*a1;
 *   func_02001f18(ptr, a3, *a0(stacked), a2, a4, a5, tag);
 * NOTE: already ships as src/main/func_020037d0.s (brief 207, C-34
 * candidate). Best-effort. a_idx,a4,a5 are stack params [sp+0x18..0x1c].
 * The case constants map: idx 8->(0x20,0x88,4) 10->(0x32,0x90,5)
 * 12->(0x48,0x98,6) 14->(0x62,0xa0,7) 16->(0x80,0xa8,8). mla r0=stride*a1+ptr. */

typedef struct {
    char         _pad0[0x88];
    char        *f_88;
    char        *f_8c;
    char        *f_90;
    char        *f_94;
    char        *f_98;
    char        *f_9c;
    char        *f_a0;
    char        *f_a4;
    char        *f_a8;
} state_02102c7c_t;

extern state_02102c7c_t data_02102c7c;
extern void func_02001f18(void *ptr, int a3, int s0, int a2,
                          int a4, int a5, int tag);

void func_020037d0(void *a0, int a1, int a2, int a3,
                   int a4, int a5, int a_idx) {
    char *base;
    int   stride;
    int   tag;

    switch (a_idx) {
    case 8:  stride = 0x20; base = data_02102c7c.f_88; tag = 4; break;
    case 10: stride = 0x32; base = data_02102c7c.f_90; tag = 5; break;
    case 12: stride = 0x48; base = data_02102c7c.f_98; tag = 6; break;
    case 14: stride = 0x62; base = data_02102c7c.f_a0; tag = 7; break;
    case 16: stride = 0x80; base = data_02102c7c.f_a8; tag = 8; break;
    default: return;
    }
    func_02001f18(base + 0x80 + stride * a1, a3, *(int *)a0, a2,
                  a4, a5, tag);
}
