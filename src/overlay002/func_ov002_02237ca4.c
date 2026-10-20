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
/* The original preserves and forwards r1, as do other matched callers. */
extern int func_ov002_0220e74c(void *x, int arg);
int func_ov002_02237ca4(struct Self *self, int arg) {
    char *rowBase = data_ov002_022cf16c + (self->b0 & 1) * 0x868 + 0x30;
    struct RowFields *row = (struct RowFields *)(rowBase + self->p5 * 20);
    if (self->nine != row->fieldA * 2 + row->bit13)
        return 0;
    if (*(unsigned short *)(data_ov002_022cf1a4 + (self->b0 & 1) * 0x868 + self->p5 * 20) == 0)
        return 0;
    return func_ov002_0220e74c(self, arg);
}


