/* func_ov002_02214aa0: self carries a bit0 player flag (b0) and a 5-bit
 * row index (bits 1-5). Look up the per-player (0x868 stride) row table
 * at data_ov002_022cf16c+0x30, index by row (0x14-byte stride entries),
 * and verify self's 9-bit field4 (self+4, bits 6-14) equals the row
 * entry's packed low8*2+bit13. Then verify the parallel
 * data_ov002_022cf1a4 per-player/per-row u16 slot is nonzero. On success,
 * fire func_ov002_021d6808(self, b0, row, 0, 1) but always return 0. */
struct SelfRow {
    unsigned short f_0;
    unsigned short b0 : 1;
    unsigned short row : 5;
    unsigned short _pad2 : 10;
    unsigned short _pad3 : 6;
    unsigned short field4 : 9;
    unsigned short _pad4 : 1;
};

struct RowEntry {
    unsigned int _pad0 : 13;
    unsigned int bit13 : 1;
    unsigned int _pad1 : 8;
    unsigned int low8 : 8;
    unsigned int _pad2 : 2;
};

extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern int func_ov002_021d6808(struct SelfRow *self, int player, int idx, int arg3, int arg4);

int func_ov002_02214aa0(struct SelfRow *self) {
    int b0 = self->b0;
    int row = self->row;
    int row_off = row * 0x14;
    int player_off = (b0 & 1) * 0x868;
    struct RowEntry *entry = (struct RowEntry *)(data_ov002_022cf16c + player_off + 0x30 + row_off);
    unsigned short *slot2;

    if (self->field4 != entry->low8 * 2 + entry->bit13) {
        return 0;
    }
    slot2 = (unsigned short *)(data_ov002_022cf1a4 + player_off + row_off);
    if (*slot2 == 0) {
        return 0;
    }
    func_ov002_021d6808(self, b0, row, 0, 1);
    return 0;
}
