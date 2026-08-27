/* func_ov002_02209c14: a0->kind (6-bit field at bits[11:6] of a0+2)
 * must be 13 or 20. data_ov002_022cd314.f_8 must be 0. f_0 must differ
 * from a0->bit0 and f_4 must equal it. Then look up the Ov002Slot at
 * row((f_4&1))+f_20*20+0x30 in data_ov002_022cf08c -- must be occupied
 * -- and return 1 iff the matching u16 in data_ov002_022cf0c4 (same
 * row/sub-row offset, no +0x30) is nonzero.
 */
typedef unsigned short u16;

struct SA0 {
    u16 val0;
    u16 bit0 : 1;
    u16 pad1_5 : 5;
    u16 kind : 6;
    u16 pad12_15 : 4;
};

struct D3f4 {
    int f_0;
    int f_4;
    int f_8;
    char _pad[0x14];
    int f_20;
};

struct Ov002Slot {
    unsigned int id : 13;
};

extern struct D3f4 data_ov002_022cd314;
extern char data_ov002_022cf08c[];
extern char data_ov002_022cf0c4[];

int func_ov002_02209c14(struct SA0 *a0) {
    int bit0;
    int rowOff;
    struct Ov002Slot *s;

    if (a0->kind != 13 && a0->kind != 20) {
        goto return_zero;
    }
    if (data_ov002_022cd314.f_8 != 0) {
        goto return_zero;
    }

    bit0 = a0->bit0;
    if (data_ov002_022cd314.f_0 == bit0) {
        goto return_zero;
    }
    if (data_ov002_022cd314.f_4 != bit0) {
        goto return_zero;
    }

    rowOff = (data_ov002_022cd314.f_4 & 1) * 0x868;
    s = (struct Ov002Slot *)((char *)data_ov002_022cf08c
        + rowOff + 0x30 + data_ov002_022cd314.f_20 * 20);
    if (s->id == 0) {
        goto return_zero;
    }

    if (*(u16 *)(data_ov002_022cf0c4 + rowOff + data_ov002_022cd314.f_20 * 20) != 0) {
        return 1;
    }

return_zero:
    return 0;
}
