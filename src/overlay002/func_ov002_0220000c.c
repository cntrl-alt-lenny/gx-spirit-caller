typedef struct {
    unsigned short bit0 : 1;
    unsigned short field : 5;
    unsigned short type : 6;
    unsigned short rest : 4;
} data_field_t;
extern char data_ov002_022cf1ac[];
extern int func_ov002_021bc8c8(int player, int target, int slot);
int func_ov002_0220000c(void *a) {
    data_field_t *f = (data_field_t *)((char *)a + 2);
    if (f->type == 2) {
        int bit0 = f->bit0;
        int field = f->field;
        if ((*(unsigned int *)(data_ov002_022cf1ac + (bit0 & 1) * 0x868 + field * 0x14) >> 5 & 1) == 0)
            return 0;
        if (func_ov002_021bc8c8(bit0, bit0, field) == 0)
            return 0;
    }
    return 1;
}
