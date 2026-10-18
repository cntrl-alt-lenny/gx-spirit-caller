struct Ov000Row {
    char pad0[12];
    unsigned lowbyte : 8;
    unsigned : 24;
    char pad_tail[28];
};
extern struct Ov000Row data_ov000_021c7530[];

void func_ov000_021ab4bc(int idx, int val) {
    unsigned char combined = val | data_ov000_021c7530[idx].lowbyte;
    data_ov000_021c7530[idx].lowbyte = combined;
}
