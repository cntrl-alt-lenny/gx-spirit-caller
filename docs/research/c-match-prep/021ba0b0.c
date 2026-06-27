/* CAMPAIGN-PREP candidate for func_021ba0b0 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS D: :13 field bitfield (not mask); 0x1a74 sentinel; two guarded calls share r4
 *   risk:       id must come from a :13 bitfield (lsl#19;lsr#19) not `& 0x1fff` (which gives `and`). reshape-able (keep bitfield). sentinel 0x1a74 / obj-is-single-word struct-guessed
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_021ba0b0 (ov002, class D, MED tier).
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * Drop into src/, run ninja + objdiff, apply the risk note below.
 *   recipe:   CLASS D: :13 field@[r0] (lsl#19;lsr#19); 0x1a74 sentinel guard; two guarded calls sharing r4=id/result.
 *   risk:     id is read from *(u32*)obj as a :13 bitfield (lsl#19;lsr#19); a plain `*obj & 0x1fff` would emit `and` not the shift-pair. reshape-able (keep the :13 bitfield, not a mask). 0x1a74 sentinel / single-word obj layout struct-guessed.
 *   confidence: med
 */
/* func_ov002_021ba0b0(obj): id = (*obj):13; if (id != 0x1a74) return id;
 * r=func_021b41e8(obj,id); if (r==-1) return 0x1a74;
 * if (func_021bd85c(r)==0) return r; else return r. (both tails -> r) */
typedef unsigned int u32;
struct Slot13 { u32 id : 13; };

extern int func_ov002_021b41e8(int obj, int id);
extern int func_ov002_021bd85c(int r);

int func_ov002_021ba0b0(int obj) {
    u32 id = ((struct Slot13 *)obj)->id;
    int r = (int)id;
    if (id == 0x1a74) {
        r = func_ov002_021b41e8(obj, (int)id);
        if (r == -1)
            return 0x1a74;
        if (func_ov002_021bd85c(r) == 0)
            return r;
    }
    return r;
}
