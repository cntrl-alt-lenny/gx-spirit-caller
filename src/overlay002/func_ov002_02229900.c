typedef unsigned short u16;
struct Self { u16 f0; u16 bit0:1; u16 rest:15; char pad[8]; u16 fc; };
struct State { char pad[0x5a8]; int mode; };
extern struct State data_ov002_022ce288;
extern void func_ov002_021ae400(int a, int b);
extern void func_ov002_021af9d0(int a, int b, int c, int d);
extern int *func_ov002_021afb74(void);
extern int func_ov002_021d7d0c(struct Self *, int, int *);
extern int func_ov002_021d8288();
extern int func_ov002_021e286c(int arg0);
extern int func_ov002_0225368c(int ctx, int card_id, int arg2);
extern void func_ov002_0226b054(int arg0);
int func_ov002_02229900(struct Self *self) {
    int n = self->fc;
    switch (data_ov002_022ce288.mode) {
    case 128:
        if (func_ov002_0225368c(self->bit0, self->f0, n) == 0) {
            if (n != 1) return 0;
            func_ov002_021ae400(self->bit0, 21);
            return 120;
        }
        func_ov002_021af9d0(self->bit0, 6, self->f0, n);
        return 127;
    case 127:
        if (n == 1) {
            func_ov002_021d8288(self->bit0, (int)func_ov002_021afb74());
            return 100;
        }
        func_ov002_021d7d0c(self, self->bit0, func_ov002_021afb74());
        return 0;
    case 120:
        func_ov002_0226b054(1 - self->bit0);
        return 100;
    case 100:
        func_ov002_021e286c(self->bit0);
        return 0;
    }
    return 0;
}

