struct Self {
    unsigned short f0;
    struct { unsigned short bit0:1; unsigned short rest:15; } f2;
};
struct State { char pad[0x5a8]; int state; };
struct Word { unsigned int pad:13; unsigned int bit:1; unsigned int pad2:8; unsigned int value:8; unsigned int top:2; };
extern struct State data_ov002_022ce288;
extern int func_ov002_0225368c(int ctx, int card_id, int arg2);
extern void func_ov002_021ae400(int a, int b);
extern void func_ov002_021af9d0(int a, int b, int c, int d);
extern int *func_ov002_021afb74(void);
extern int func_ov002_021e1aec(int arg0, int arg1, int arg2);
extern void func_ov002_021e276c(void *self, int a, int b, int c);
extern int func_ov002_021e286c(int arg0);
int func_ov002_0222f67c(struct Self *self) {
    struct Word *p;
    unsigned int v;
    switch (data_ov002_022ce288.state) {
    case 0x80:
        if (func_ov002_0225368c(self->f2.bit0, self->f0, 0) == 0) return 0;
        func_ov002_021ae400(self->f2.bit0, 0x5e);
        return 0x7f;
    case 0x7f:
        func_ov002_021af9d0(self->f2.bit0, 6, self->f0, 0);
        return 0x7e;
    case 0x7e:
        p = (struct Word *)func_ov002_021afb74();
        v = ((struct Word *)func_ov002_021afb74())->value * 2 + p->bit;
        func_ov002_021e1aec(self->f2.bit0, v, 0);
        func_ov002_021e276c(self->f2.bit0, self->f0, 0x41, (unsigned short)v);
        func_ov002_021e286c(self->f2.bit0);
        return 0;
    default:
        return 0;
    }
}
