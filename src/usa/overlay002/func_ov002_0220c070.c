typedef unsigned short u16;
extern int data_ov002_022cf09c[];

struct Self0220c160 {
    u16 f_0;
    u16 b0 : 1;
    u16 : 5;
    u16 kind : 6;
    u16 : 4;
};

extern int func_ov002_021bbf20(int bit0, void *fn);
extern void func_0202effc(void);
extern int func_ov002_021ff264(void *self, int arg1);

int func_ov002_0220c070(struct Self0220c160 *self, int arg1) {
    if (self->kind != 0x23) {
        if (func_ov002_021bbf20(self->b0, (void *)func_0202effc) == 0)
            return 0;
    }
    if (*(int *)((char *)data_ov002_022cf09c + (self->b0 & 1) * 0x868) == 0)
        return 0;
    return func_ov002_021ff264(self, arg1);
}
