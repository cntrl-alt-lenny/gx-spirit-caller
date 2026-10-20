typedef unsigned int u32;
typedef unsigned short u16;
struct Obj { u16 id; u16 side : 1; u16 rest : 15; };
struct State { char pad[0x5a8]; int state; int count; int index; };
extern struct State data_ov002_022ce288;
extern void func_ov002_021ae400(int a, int b);
extern void func_ov002_021af9d0(int a, int b, int c, int d);
extern u32 *func_ov002_021b004c(int id);
extern int func_ov002_021bc618(int arg0);
/* Original caller supplies only r0; remaining thunk inputs are unused here. */
extern int func_ov002_021ca2b8();
/* Original caller supplies no argument to these unused-argument functions. */
extern void func_ov002_021e2b3c();
extern void func_ov002_021e2c5c();
extern int func_ov002_0225368c(int ctx, int card_id, int arg2);
extern int func_ov002_0227adb8(int a, int b, int c, int d);
int func_ov002_02238a68(struct Obj *p) {
    int n;
    switch (data_ov002_022ce288.state) {
    case 0x80:
        if (func_ov002_021ca2b8(p->side) == 0) return 0;
        n = func_ov002_0225368c(p->side, p->id, 0);
        if (n == 0) return 0;
        if (n >= func_ov002_021bc618(p->side))
            n = func_ov002_021bc618(p->side);
        func_ov002_021ae400(p->side, 0x11d);
        data_ov002_022ce288.count = n;
        data_ov002_022ce288.index = 0;
        return 0x7f;
    case 0x7f:
        n = data_ov002_022ce288.count;
        if (n >= 0x20) n = 0x20;
        func_ov002_021af9d0(p->side, n + 6, p->id, 0);
        func_ov002_021e2b3c();
        return 0x7e;
    case 0x7e:
        if (data_ov002_022ce288.index < data_ov002_022ce288.count) {
            u32 *entry = func_ov002_021b004c(data_ov002_022ce288.index + 1);
            func_ov002_0227adb8(p->side, (int)entry, 1, p->id << 16);
            data_ov002_022ce288.index++;
            return 0x7e;
        }
        func_ov002_021e2c5c();
        return 0;
    }
    return 0;
}

