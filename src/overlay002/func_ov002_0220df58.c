struct Self {
    unsigned short id;
    unsigned short b0 : 1;
};
extern char data_ov002_022ce288[];
extern char data_ov002_022cf17c[];
extern int func_ov002_0220dd34(int a, int b);

int func_ov002_0220df58(int a, int b)
{
    struct Self *self = (struct Self *)a;
    if (*(int *)(data_ov002_022ce288 + 0x484) + 1 < 4)
        return 0;
    if (func_ov002_0220dd34(a, b)) {
        return *(unsigned int *)(data_ov002_022cf17c + (self->b0 & 1) * 0x868) >= 2;
    }
    return 0;
}
