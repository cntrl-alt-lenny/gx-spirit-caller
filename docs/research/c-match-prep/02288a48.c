/* CAMPAIGN-PREP candidate for func_02288a48 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     asymmetric-shift index, Slot.id u16 bitfield, call + const compare
 *   risk:       id holder is u16 (ldrh) not u32; const 0x19bc loaded from pool; r4 hold across call
 *   confidence: med
 */
/* func_ov002_02288a48: idx from arg0+0x14 (asym shift 23/21); id =
 * table[idx].id (13-bit, ldrh-loaded). If func_0202ef08(id) != 0 ->
 * 1; else id == 0x19bc. */
typedef unsigned short u16;
struct SlotU16_a48 { u16 id : 13; };

extern char data_ov002_022d0250[];
extern int  func_0202ef08(int id);

int func_ov002_02288a48(void *arg0) {
    int idx = (unsigned)(*(int *)((char *)arg0 + 0x14) << 23) >> 21;
    int id  = ((struct SlotU16_a48 *)(data_ov002_022d0250 + idx))->id;
    if (func_0202ef08(id) != 0) return 1;
    return id == 0x19bc;
}
