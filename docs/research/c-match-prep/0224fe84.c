/* CAMPAIGN-PREP candidate for func_0224fe84 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     no loop, base-as-mla +0x120+idx*4; reload slot; hi8/b13 bitfield key; MMIO u16
 *   risk:       base mla fusion: orig mla r0,(p&1),0x868,022cf16c then add #0x120 — mwcc may split mul/add (then base reload diverges); reshape-able via the single pointer expr shown. Packed-decode shift-fusion residual.
 *   confidence: low
 */
/* func_ov002_0224fe84 (ov002, D) — single indexed slot (NO loop), MMIO compare.
 * base = data_022cf16c + (player&1)*0x868  (emitted as mla); slot = base+0x120,
 * elem = slot[idx] (idx = arg2). id = elem.id (:13). if !0202e234(id) return.
 * elem reloaded: key = ((e>>22)&0xff)*2 + ((e>>13)&1) (hi8:8@b22, b13:1@b13).
 * r = 021c38c4(player, key); mmio = *(u16*)(*(int*)(022ce288+0x48c) + 0xc);
 * if (mmio != r) return; if !021ca440(player,id) return; 02253458(player,0xb,idx). */
struct Ov002Slot {
    unsigned int id : 13;
    unsigned int b13 : 1;
    unsigned int : 8;
    unsigned int hi8 : 8;
    unsigned int : 2;
};

extern char data_ov002_022cf16c[];
extern char data_ov002_022ce288[];
extern int  func_0202e234(int id);
extern int  func_ov002_021c38c4(int player, int key);
extern int  func_ov002_021ca440(int player, int id);
extern void func_ov002_02253458(int player, int a, int idx);

void func_ov002_0224fe84(int player, int arg1, int idx) {
    struct Ov002Slot *slot;
    int id;
    int r;

    slot = (struct Ov002Slot *)(data_ov002_022cf16c + (player & 1) * 0x868 + 0x120) + idx;
    id = slot->id;
    if (func_0202e234(id) == 0)
        return;
    r = func_ov002_021c38c4(player, slot->hi8 * 2 + slot->b13);
    if (*(unsigned short *)(*(int *)(data_ov002_022ce288 + 0x48c) + 0xc) != r)
        return;
    if (func_ov002_021ca440(player, id) == 0)
        return;
    func_ov002_02253458(player, 0xb, idx);
}
