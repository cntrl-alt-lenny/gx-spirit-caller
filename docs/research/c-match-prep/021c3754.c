/* CAMPAIGN-PREP candidate for func_021c3754 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     :13 id + :1 bit13 bitfields; precompute slot before guard; reload *obj each use
 *   risk:       orig computes slot ptr (mla cf178[idx]<<2) BEFORE the id==0 guard; if mwcc sinks slot past the early returns the add/mla ordering moves. reshape-able (keep slot decl first); struct field offsets struct-guessed.
 *   confidence: med
 */
/* func_ov002_021c3754: arg1 -> struct whose first int has :13 id. row=cf16c+idx,
 * slot = &((int*)(row+0x120))[cf178[idx]] precomputed. If id13==0 return.
 * If func_0202e2f8(id13)!=0 return. If func_0202de9c(id13)==3: call
 * func_021ba1e8(bit13(*arg1), arg1) and return. Else func_021b91c4(slot, arg1)
 * then cf178[idx]++. id reloaded from *arg1 each use. */
extern char data_ov002_022cf16c[];
extern int  data_ov002_022cf178[];
extern int  func_0202e2f8(unsigned int id);
extern int  func_0202de9c(unsigned int id);
extern void func_ov002_021ba1e8(int bit, void *obj);
extern void func_ov002_021b91c4(int *slot, void *obj);

struct Ov002Obj {
    unsigned int id : 13;
    unsigned int    : 5;
    unsigned int b13 : 1;
};

void func_ov002_021c3754(int player, struct Ov002Obj *obj) {
    int idx = (player & 1) * 0x868;
    char *row = (char *)data_ov002_022cf16c + idx;
    int *slot = (int *)(row + 0x120)
              + *(int *)((char *)data_ov002_022cf178 + idx);
    if (obj->id == 0)
        return;
    if (func_0202e2f8(obj->id) != 0)
        return;
    if (func_0202de9c(obj->id) == 3) {
        func_ov002_021ba1e8(obj->b13, obj);
        return;
    }
    func_ov002_021b91c4(slot, obj);
    *(int *)((char *)data_ov002_022cf178 + idx) =
        *(int *)((char *)data_ov002_022cf178 + idx) + 1;
}
