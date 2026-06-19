/* func_ov002_021ff5a0: C-39f bit0^bit14 strided index -> bool ((idx)&1 for redundant and). */
typedef unsigned short u16;
struct S690 { u16 f0; u16 bit0:1; u16 b1_13:13; u16 bit14:1; u16 b15:1; };
extern char data_ov002_022cf09c[];
int func_ov002_021ff5a0(struct S690 *self) {
    int idx = (self->bit0 ^ self->bit14) & 1;
    return *(int *)(data_ov002_022cf09c + idx * 0x868) != 0;
}
