typedef unsigned int u32;
struct State {
    u32 side : 1;
    u32 spare : 7;
    u32 id : 15;
    u32 rest : 9;
    char pad[0x14];
    u32 phase : 8;
    u32 high : 24;
};
struct Phase { u32 phase : 8; u32 rest : 24; };
extern struct State data_ov002_022cd300;
extern struct Phase data_ov002_022cd318;
extern int data_ov002_022cd744[];
extern struct { char pad[0xd70]; int a, b, c; } data_ov002_022d016c;
extern void func_ov002_021ae400(int a, int b);
extern int func_ov002_021de5d4(int a, int b, int c);
extern void func_ov002_022592ec(int arg0);
extern int func_ov002_022593f4(void);
extern int func_ov002_02270ca8(int a, int b, int c);
extern void func_ov002_02290500(int a, int b, int (*cb)(int, int, int));
int func_ov002_02273218(void) {
    switch (data_ov002_022cd300.phase) {
    case 0:
        if (data_ov002_022cd744[data_ov002_022cd300.side] == 1) {
            func_ov002_02290500(data_ov002_022cd300.side, data_ov002_022cd300.id, func_ov002_02270ca8);
        } else {
            func_ov002_021ae400(data_ov002_022cd300.side, 0x7e);
            func_ov002_022592ec((int)func_ov002_02270ca8);
        }
        data_ov002_022cd318.phase++;
        return 0;
    case 1:
        if (func_ov002_022593f4() == 0) return -1;
        func_ov002_021de5d4(data_ov002_022d016c.a, data_ov002_022d016c.b + data_ov002_022d016c.c, 0);
        data_ov002_022cd318.phase++;
        return 0;
    case 2:
        return 1;
    }
    return 0;
}
