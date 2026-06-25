/* CAMPAIGN-PREP candidate for func_021f1d54 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     slot.id:13 bitfield + (player&1)*0x868 base + bit0 cmp
 *   risk:       CSE of the two 0x868/idx*20 scaled bases may not bind to one reg each; struct offsets +0x30/table2 layout guessed
 *   confidence: med
 */
/* func_ov002_021f1d54: slot/parity/table predicate (brief 286 cluster-A).
 *   id = ((slot*)(cf16c + (player&1)*0x868 + idx*20 + 48))->id  (13-bit)
 *   if (id == 0) return 0;
 *   if (player == self->f2.bit0) return 0;
 *   return *(u16*)(cf1a4 + (player&1)*0x868 + idx*20) == 0;
 * Per-player stride 0x868 indexed (player&1); slot.id is a 13-bit field
 * read lsl#19;lsr#19 -> type as a bitfield (gotcha 6). r3=(player&1)*0x868
 * and ip=idx*20 are held across both table reads (CSE/bind).
 */
typedef unsigned short u16;

struct Ov002Self021f1d54 {
    u16 f0;
    u16 bit0 : 1;
};

struct Ov002Slot021f1d54 { unsigned int id : 13; };

extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];

int func_ov002_021f1d54(struct Ov002Self021f1d54 *self, int player, int idx) {
    int id = ((struct Ov002Slot021f1d54 *)(data_ov002_022cf16c + (player & 1) * 0x868 + idx * 20 + 48))->id;
    if (id == 0) return 0;
    if (player == self->bit0) return 0;
    return *(u16 *)(data_ov002_022cf1a4 + (player & 1) * 0x868 + idx * 20) == 0;
}
