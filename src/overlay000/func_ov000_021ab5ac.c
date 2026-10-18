struct Ov000Row {
    char pad0[8];
    unsigned : 10;
    unsigned field : 6;
    unsigned : 16;
    char pad_tail[32];
};
extern struct Ov000Row data_ov000_021c7530[];

void func_ov000_021ab5ac(int idx, int val) {
    data_ov000_021c7530[idx].field = (unsigned char)val;
}
