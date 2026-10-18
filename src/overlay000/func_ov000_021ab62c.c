struct Ov000Row {
    unsigned first : 7;
    unsigned second : 7;
    unsigned flag : 1;
    unsigned : 17;
    char pad_tail[40];
};
extern struct Ov000Row data_ov000_021c7530[];
void func_ov000_021ab62c(int idx, int a, int b) {
    unsigned char first;
    int second;
    first = ~a & data_ov000_021c7530[idx].first;
    second = data_ov000_021c7530[idx].second;
    b = ~b & second;
    second = (unsigned char)b;
    data_ov000_021c7530[idx].first = first;
    data_ov000_021c7530[idx].second = second;
    data_ov000_021c7530[idx].flag = 1;
}
