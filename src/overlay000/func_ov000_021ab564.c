struct Ov000Row2 {
    char pad0[8];
    unsigned lowbyte : 8;
    unsigned flag8 : 1;
    unsigned flag9 : 1;
    unsigned : 22;
    char pad_tail[32];
};
extern struct Ov000Row2 data_ov000_021c7530[];

void func_ov000_021ab564(int idx, int val) {
    int combined = ~val & data_ov000_021c7530[idx].lowbyte;
    if (combined != 0x3f) {
        data_ov000_021c7530[idx].flag9 = 0;
    }
    data_ov000_021c7530[idx].lowbyte = combined;
    data_ov000_021c7530[idx].flag8 = 1;
}
