/* CAMPAIGN-PREP candidate for func_022482d0 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: id:13 bitfield (reloaded per call); asymmetric (raw<<2)>>24 and (raw<<18)>>31 raw shifts; mul player offset; reload limit base+0x10 each iter; continue=guard chain
 *   risk:       permuter-class: 10-reg counted loop holding many invariants (cf16c base r9, entry r8, consts r4/r5/r6/fp); mwcc -O4 reg-alloc + the (x<<2)>>24/(<<18)>>31 packing scheduling almost certainly diverge from hand asm.
 *   confidence: low
 */
/* func_ov002_022482d0 — iterate a per-player list (count @ cf17c[player]); for
 * each entry whose 13-bit id passes two filters and a 021b3fd8 check, post a
 * kind-13 event. base offset = (arg0&1)*0x868. */
typedef unsigned short u16;

struct EntD0 { unsigned int id : 13; };

extern int  data_ov002_022cf17c[];   /* per-player count table (byte-indexed) */
extern char data_ov002_022cf16c[];   /* per-player list base */
extern int  func_0202e234(int id);
extern int  func_0202b950(int id);
extern int  func_ov002_021b3fd8(int player, int a, int b, int d);
extern int  func_ov002_02253458(int player, int kind, int idx);

int func_ov002_022482d0(int arg0) {
    char *base;
    int *entry;
    int i;
    int off = (arg0 & 1) * 0x868;
    if (*(int *)((char *)data_ov002_022cf17c + off) <= 0)
        return 0;
    base = data_ov002_022cf16c + off;
    entry = (int *)(base + 0x260);
    for (i = 0; i < *(int *)(base + 0x10); i++, entry++) {
        int raw;
        if (func_0202e234(((struct EntD0 *)entry)->id) == 0)
            continue;
        if (func_0202b950(((struct EntD0 *)entry)->id) > 0x868 - 0x28c)
            continue;
        raw = *entry;
        if (func_ov002_021b3fd8(arg0, 0xb, 0x12a1,
                                (((unsigned int)(raw << 2) >> 24) << 1) +
                                ((unsigned int)(raw << 18) >> 31)) != 0)
            continue;
        func_ov002_02253458(arg0, 0xd, i);
    }
    return 0;
}
