/* func_ov002_02294d5c: gate on func_ov002_021bb90c(self->b0, 0xfbc), then
 * scan 5 slots (idx 0..4) of the OPPOSITE row ((1-self->b0)&1), each slot at
 * row+idx*0x14+0x30 with a 13-bit id and u16 "extra" at +8. For live slots,
 * return 1 if func_ov002_021c84a8(1-self->b0, idx) <= 0x9c4 (C-39f
 * stride-reuse: 0x9c4 = 0x868+0x15c, mwcc derives the row stride from it). */
typedef struct {
    unsigned short f0;
    unsigned short b0 : 1;
} SelfB0v2;

struct Slot2 { unsigned int id : 13; };

extern char data_ov002_022cf16c[];
extern int func_ov002_021bb90c(int b0, int c);
extern int func_ov002_021c84a8(int a, int b);

int func_ov002_02294d5c(SelfB0v2 *self) {
    int idx;
    int byteOff;

    if (func_ov002_021bb90c(self->b0, 0xfbc) == 0)
        return 0;

    for (idx = 0, byteOff = 0; idx < 5; idx++, byteOff += 0x14) {
        char *row = data_ov002_022cf16c + ((1 - self->b0) & 1) * 0x868;
        char *slotBase = row + byteOff + 0x30;
        int id = ((struct Slot2 *)slotBase)->id;
        int extra;

        if (id == 0)
            continue;
        extra = *(unsigned short *)(slotBase + 8);
        if (extra == 0)
            continue;

        if (func_ov002_021c84a8(1 - self->b0, idx) <= 0x9c4)
            return 1;
    }
    return 0;
}
