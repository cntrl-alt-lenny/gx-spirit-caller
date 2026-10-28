struct RowFields {
    unsigned int id:13;
    unsigned int bit13:1;
    unsigned int pad:8;
    unsigned int fieldA:8;
    unsigned int pad2:2;
};
struct Self {
    unsigned short f0;
    unsigned short b0:1;
    unsigned short p5:5;
    unsigned short pad1:10;
    unsigned short pad2:6;
    unsigned short nine:9;
    unsigned short pad3:1;
};
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern char data_ov002_022cf1a8[];
extern int func_ov002_021d59cc(int arg0, int arg1, int arg2, int arg3, unsigned short arg4);
extern int func_ov002_021d90c0(int flag, int arg1, int arg2);
int func_ov002_02237bc0(struct Self *self) {
    char *rowBase = data_ov002_022cf16c + (self->b0 & 1) * 0x868 + 0x30;
    struct RowFields *row = (struct RowFields *)(rowBase + self->p5 * 20);
    int value;
    if (self->nine != row->fieldA * 2 + row->bit13)
        return 0;
    if (*(unsigned short *)(data_ov002_022cf1a4 + (self->b0 & 1) * 0x868 + self->p5 * 20) == 0)
        return 0;
    value = *(unsigned int *)(data_ov002_022cf1a8 + (self->b0 & 1) * 0x868 + self->p5 * 20) / 10;
    switch (value) { case 0x18c3:
        func_ov002_021d59cc(self->b0, self->p5, self->f0, 3, 0);
    break; default:
        func_ov002_021d90c0(self->b0, self->p5, value);
    }
    return 0;
}



