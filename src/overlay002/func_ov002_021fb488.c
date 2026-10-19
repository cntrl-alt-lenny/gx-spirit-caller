typedef unsigned int u32;
typedef signed int s32;
struct Self {
    unsigned short f0;
    unsigned short bit : 1;
    unsigned short pad : 15;
    unsigned short pad4 : 6;
    unsigned short id : 9;
    unsigned short pad5 : 1;
};
struct State { char pad[0x5b4]; int step; };
struct Result { char pad[0xd70]; void *slot; int pad2; int index; };
extern struct State data_ov002_022ce288;
extern int data_ov002_022cd744[];
extern struct Result data_ov002_022d016c;
extern void func_ov002_021ae400(int a, int b);
extern s32 func_ov002_021b9aa8(u32 a, u32 b);
extern void func_ov002_021d7c40(void *arg0, int arg1);
extern int func_ov002_022107b4(int a, int b, int c);
extern void func_ov002_022592ec(int arg0);
extern int func_ov002_022593f4(void);
extern void func_ov002_02290500(int a, int b, int (*callback)(int,int,int));

int func_ov002_021fb488(struct Self *self) {
    int index;
    switch (data_ov002_022ce288.step) {
    case 0:
        index = func_ov002_021b9aa8(self->bit, self->id);
        if (index >= 0)
            func_ov002_021d7c40((void *)self->bit, index);
        data_ov002_022ce288.step++;
        return 0;
    case 1:
        func_ov002_021ae400(self->bit, 0x3a);
        if (data_ov002_022cd744[self->bit] == 1)
            func_ov002_02290500(self->bit, 2, func_ov002_022107b4);
        else
            func_ov002_022592ec((int)func_ov002_022107b4);
        data_ov002_022ce288.step++;
        return 0;
    case 2:
        if (func_ov002_022593f4() != 0) {
            func_ov002_021d7c40(data_ov002_022d016c.slot, data_ov002_022d016c.index);
            return 1;
        }
        data_ov002_022ce288.step--;
        return 0;
    }
    return 0;
}
