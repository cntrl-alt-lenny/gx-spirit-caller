typedef unsigned short u16;
typedef unsigned int u32;
struct Card {
    u16 id;
    u16 side:1; u16 slot:5; u16 kind:6; u16 flags:2; u16 flag14:1; u16 pad:1;
    u16 indexbits;
    u16 pad2;
    u32 a,b,c,value;
};
struct Global { char pad[0x5d4]; u32 count; u32 other; unsigned char kinds[32]; u32 values[32]; };
extern struct Global data_ov002_022ce288;
extern int func_ov002_02257b48(void *p, void *q);
extern void func_ov002_021e2e80(int mode, u32 packed, int index, u32 value);
void func_ov002_021e311c(u32 packed, int index) {
    struct Card card = {0};
    u32 i;
    u16 side, flag14, flags, slot;
    side = (packed & 0x80000000) >> 31;

    flag14 = (packed & 0x1000000) >> 24;
    flags = (packed & 0xe00000) >> 21;
    slot = (packed & 0x1f0000) >> 16;
    card.side = side;
    card.flag14 = flag14;
    card.flags = flags;
    card.slot = slot;
    card.indexbits = (card.indexbits & 0xffff803f) | ((u32)index << 23 >> 17);
    card.id = packed;
    if (data_ov002_022ce288.count != 0) {
        for (i=0; i<data_ov002_022ce288.count; i++) {
            card.kind = data_ov002_022ce288.kinds[i];
            card.value = data_ov002_022ce288.values[i];
            if (func_ov002_02257b48(&card, 0)) {
                func_ov002_021e2e80(0, ((card.side << 31) & 0x80000000) | ((card.kind << 25) & 0x7e000000) | ((card.flag14 << 24) & 0x1000000) | ((card.flags << 21) & 0xe00000) | ((card.slot << 16) & 0x1f0000) | card.id, index, card.value);
                return;
            }
        }
    }
    func_ov002_021e2e80(0, ((card.side << 31) & 0x80000000) | ((card.flag14 << 24) & 0x1000000) | ((card.flags << 21) & 0xe00000) | ((card.slot << 16) & 0x1f0000) | card.id, index, 0);
}


