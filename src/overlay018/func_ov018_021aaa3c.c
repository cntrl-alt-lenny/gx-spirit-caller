extern char data_ov018_021ad860[];
extern char data_ov018_021ad8a8[];
extern void func_ov018_021ad1f4(unsigned short *src, unsigned short *dst, unsigned int packed);

void func_ov018_021aaa3c(unsigned short *dst) {
    unsigned short scale = ((*(int *)(data_ov018_021ad860 + 0x9cc) >> 12) & 2) ? 0xff : 0;
    func_ov018_021ad1f4((unsigned short *)((unsigned int)data_ov018_021ad8a8 + 0x966), dst, (scale << 16) | 0xc);
}
