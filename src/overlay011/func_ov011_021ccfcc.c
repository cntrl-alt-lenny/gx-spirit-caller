typedef unsigned int u32;
extern u32 data_ov011_021d4000[];

void func_ov011_021ccfcc(void) {
    u32 f = data_ov011_021d4000[0xab];
    f = (f & ~0xff00000u) | 0xff00000u;
    data_ov011_021d4000[0xab] = f;
    f |= 0x10000000u;
    data_ov011_021d4000[0x98] = data_ov011_021d4000[0x8e] - data_ov011_021d4000[0x96] + 0x80000;
    data_ov011_021d4000[0x99] = data_ov011_021d4000[0x8f] - data_ov011_021d4000[0x97] + 0x60000;
    data_ov011_021d4000[0xac] &= ~0xffu;
    data_ov011_021d4000[0xab] = f;
}
