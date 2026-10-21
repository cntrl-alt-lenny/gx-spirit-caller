typedef struct {
    unsigned short w0;
    unsigned short bit0 : 1;
    unsigned short pad1 : 13;
    unsigned short bit14 : 1;
    unsigned short pad15 : 1;
} S021ff400;
extern struct { char pad[0x5a8]; int state; } data_ov002_022ce288;
extern int func_ov002_02257704(void *self);
extern int func_ov002_021de408(int a, int b);
extern int func_ov002_021ff400(S021ff400 *p, int unused1);
extern void func_ov002_021ae400(int a, int b);
extern void func_ov002_021af9d0(int a, int b, int c, int d);
extern int *func_ov002_021afb74(void);
extern int func_ov002_0227adb8(int a, int b, int c, int d);
extern void func_ov002_021e276c(int self, int a, int b, int c);
int func_ov002_0221e548(S021ff400 *self, int arg1) {
    switch (data_ov002_022ce288.state) {
    case 0x80:
        if (func_ov002_021de408((int)self, func_ov002_02257704(self))) return 0x7f;
        return 0x64;
    case 0x7f:
        if (!func_ov002_021ff400(self, arg1)) return 0x64;
        func_ov002_021ae400(self->bit0, 0x5e);
        return 0x7e;
    case 0x7e:
        func_ov002_021af9d0(self->bit0, 6, self->w0, 0);
        return 0x7d;
    case 0x7d:
        func_ov002_0227adb8(self->bit0, (int)func_ov002_021afb74(), 1, 0);
        return 0x64;
    case 0x64:
        func_ov002_021e276c(self->bit0, self->w0, 1, 0);
        return 0;
    }
    return 0;
}
