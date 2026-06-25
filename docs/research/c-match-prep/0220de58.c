/* CAMPAIGN-PREP candidate for func_0220de58 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     dual-bitfield(tag6/bit0); player&1*0x868 mla; Ov002Slot 13-bit; slot-walk loop
 *   risk:       operator precedence: (1 - self->f2.bit0 & 1) binds as 1-(bit0&1); fine since bit0 is 0/1 but confirm mla emits; mwcc may CSE differently
 *   confidence: med
 */
/* func_ov002_0220de58: tag6 guard, then scan 5 slot-ids (idx 5..9) in the
 * per-player 0x868 row; return 0 on the first empty id, 1 if all set.
 *
 *   ldrh r0,[r0,#2]; tag6=bits[11:6]; if(tag6==0x23) return 0
 *   player = 1 - bit0; base = cf16c + (player&1)*0x868   (mla)
 *   slot = base + 0x30; for(i=5;i<10;i++) if(slot[i].id==0) return 0
 *   return 1
 */
typedef unsigned short u16;
typedef unsigned int   u32;

struct F0220de58_F2 {
    u16 bit0 : 1;
    u16 pad  : 5;
    u16 tag6 : 6;
    u16 rest : 4;
};
struct F0220de58_Self {
    u16 f0;
    struct F0220de58_F2 f2;
};
struct F0220de58_Slot { u32 id : 13; };

extern char data_ov002_022cf16c[];

int func_ov002_0220de58(struct F0220de58_Self *self) {
    char *base;
    struct F0220de58_Slot *slot;
    int i;
    if (self->f2.tag6 == 0x23) return 0;
    base = data_ov002_022cf16c + (1 - self->f2.bit0 & 1) * 0x868;
    slot = (struct F0220de58_Slot *)(base + 0x30);
    for (i = 5; i < 10; i++) {
        if (slot[i].id == 0) return 0;
    }
    return 1;
}
