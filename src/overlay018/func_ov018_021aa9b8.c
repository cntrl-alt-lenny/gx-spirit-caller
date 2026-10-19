extern char data_ov018_021ad860[];
extern char data_ov018_021ad8a8[];
extern void func_ov018_021ad118(unsigned short *src, unsigned short *dst, unsigned int packed);

void func_ov018_021aa9b8(unsigned short *dst) {
    unsigned int src = (unsigned int)data_ov018_021ad8a8;
    int phase = (*(int *)(data_ov018_021ad860 + 0x9cc) >> 12) % 60;
    int scale;
    if (phase < 30) {
        scale = phase * 255 / 30;
    } else {
        scale = (60 - phase) * 255 / 30;
    }
    func_ov018_021ad118((unsigned short *)(src + 0x966), dst, ((unsigned short)scale << 16) | 0xb);
}
