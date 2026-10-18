struct Ov000Row {
    unsigned : 15;
    unsigned flag : 1;
    unsigned field1 : 5;
    unsigned field2 : 5;
    unsigned : 6;
    char pad[40];
};
extern struct Ov000Row data_ov000_021c7530[];
void func_ov000_021ab688(int idx, int a, int b) {
    data_ov000_021c7530[idx].field1 = (unsigned char)a;
    data_ov000_021c7530[idx].field2 = (unsigned char)b;
    data_ov000_021c7530[idx].flag = 1;
}
