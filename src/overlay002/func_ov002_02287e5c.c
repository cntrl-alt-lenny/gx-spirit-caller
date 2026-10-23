struct Self { unsigned short f0; unsigned short bit0:1; unsigned short rest:15; };
extern char data_ov002_022cf17c[];
extern char data_ov002_022cf180[];
extern int func_ov002_021c3ae4(int arg0, int arg1);
extern int func_ov002_021bbd14(int self, int arg2);
int func_ov002_02287e5c(struct Self *self) {
    int bit = self->bit0;
    int other = 1 - bit;
    int off = bit & 1;
    off *= 0x868;
    other = (other & 1) * 0x868;
    unsigned int value = *(unsigned int *)(data_ov002_022cf17c + off);
    unsigned int count = *(unsigned int *)(data_ov002_022cf180 + other);
    if (value < 5) {
        if (*(unsigned int *)(data_ov002_022cf17c + other) > value) return 1;
    }
    if (count >= *(unsigned int *)(data_ov002_022cf17c + other)) return 0;
    if (count >= *(unsigned int *)(data_ov002_022cf180 + off)) return 0;
    if (count != 0) {
        if (func_ov002_021c3ae4(bit, 0x12f9) != 0 || func_ov002_021bbd14(self->bit0, 0x12f9) != 0) return 0;
    }
    return 1;
}


