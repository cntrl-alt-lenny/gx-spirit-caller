typedef struct {
    unsigned short w0;
    unsigned short bit0 : 1;
    unsigned short pad1 : 13;
    unsigned short bit14 : 1;
    unsigned short pad15 : 1;
    unsigned short low6 : 6;
    unsigned short value : 9;
    unsigned short top : 1;
} S021ff400;
extern int func_ov002_021ff400(S021ff400 *p, int unused1);
extern int func_ov002_021ca698(int arg0, int arg1);
extern void func_ov002_021ae400(int a, int b);
extern void func_ov002_021af9d0(int a, int b, int c, int d);
extern int *func_ov002_021afb74(void);
extern void func_ov002_021d8128(int arg0, void *arg1, int arg2);
extern struct { char pad[0x5b4]; int state; } data_ov002_022ce288;
int func_ov002_021fa4d8(S021ff400 *p, int arg) {
    switch (data_ov002_022ce288.state) {
    case 0:
        if (func_ov002_021ca698(p->bit0, p->bit0) == 0) return -1;
        if (func_ov002_021ff400(p, arg) == 0) return -1;
        func_ov002_021ae400(p->bit0, 0x56);
        data_ov002_022ce288.state++;
        return 0;
    case 1:
        func_ov002_021af9d0(p->bit0, 6, p->w0, p->value);
        data_ov002_022ce288.state++;
        return 0;
    case 2:
        func_ov002_021d8128(p->bit0, func_ov002_021afb74(), 0);
        data_ov002_022ce288.state++;
        return 0;
    default:
        return 1;
    }
}
