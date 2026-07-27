typedef unsigned short u16;
extern int data_ov002_022cf17c[];
extern int data_ov002_022cf188[];
extern int data_ov002_022cf180[];

struct Self02207528 {
    u16 f_0;
    u16 b0 : 1;
    u16 : 5;
    u16 kind : 6;
    u16 : 4;
};

int func_ov002_02207528(struct Self02207528 *self) {
    int b0 = self->b0 & 1;
    if ((unsigned)(*(int *)((char *)data_ov002_022cf17c + b0 * 0x868)) < 2)
        return 0;
    if (self->kind == 0x23)
        return 1;
    if ((unsigned)(*(int *)((char *)data_ov002_022cf188 + b0 * 0x868)) < 4)
        goto ret0;
    if (*(int *)((char *)data_ov002_022cf180 + b0 * 0x868) == 0)
        return 1;
ret0:
    return 0;
}
