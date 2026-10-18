typedef unsigned short u16;
typedef unsigned int u32;

typedef struct {
    u16 pad0;
    u16 bit : 1;
} Arg;

extern struct { char pad[0x5b4]; int state; } data_ov002_022ce288;
extern int data_ov002_022cd744[];
extern struct { char pad[0xd70]; int a; int pad2; int b; } data_ov002_022d016c;

extern int func_ov002_021ae400(int a, int b);
extern void func_ov002_021d7c40(int a, int b);
extern void func_ov002_022107b4(void);
extern void func_ov002_022592ec(void *fn);
extern int func_ov002_022593f4(void);
extern void func_ov002_02290500(int a, int b, void *fn);

int func_ov002_021f8d10(Arg *arg)
{
    switch (data_ov002_022ce288.state) {
    case 0: {
        func_ov002_021ae400(arg->bit, 0x3a);
        if (data_ov002_022cd744[arg->bit] == 1) {
            func_ov002_02290500(arg->bit, 2, func_ov002_022107b4);
        } else {
            func_ov002_022592ec(func_ov002_022107b4);
        }
        data_ov002_022ce288.state++;
        return 0;
    }
    case 1:
        if (func_ov002_022593f4() != 0) {
            func_ov002_021d7c40(data_ov002_022d016c.a, data_ov002_022d016c.b);
            return 1;
        }
        data_ov002_022ce288.state--;
        return 0;
    default:
        return 0;
    }
}
