typedef unsigned int u32;
typedef struct { unsigned short opcode; unsigned short side:1; unsigned short slot:5; unsigned short rest:10; } Command;
struct State { char pad[0x5b4]; int step; };
struct List { char pad[0xd44]; u32 count; };
extern struct State data_ov002_022ce288;
extern struct List data_ov002_022d016c;
extern char data_ov002_022cf1a8[];
extern void func_ov002_021ae400(int a, int b);
extern void func_ov002_021af9d0(int a, int b, int c, int d);
extern u32 *func_ov002_021b004c(int id);
extern void func_ov002_021d8128(int arg0, void *arg1, int arg2);
extern void func_ov002_021e2b3c();
extern void func_ov002_021e2c5c();
int func_ov002_021fab74(Command *p) {
    u32 i;
    int n = 2;
    int op = p->opcode;
    if (op == 0x18f8) {
        n = *(int *)(data_ov002_022cf1a8 + (p->side & 1) * 0x868 + p->slot * 20);
    }
    switch (data_ov002_022ce288.step) {
    case 0:
        func_ov002_021ae400(p->side, 0x56);
        data_ov002_022ce288.step++;
        return 0;
    case 1:
        if (n >= 32) n = 32;
        func_ov002_021af9d0(p->side, n + 6, op, 0);
        data_ov002_022ce288.step++;
        return 0;
    case 2:
        func_ov002_021e2b3c();
        for (i = 0; i < data_ov002_022d016c.count; i++) {
            u32 *entry = func_ov002_021b004c(i + 1);
            func_ov002_021d8128(p->side, entry, 0);
        }
        func_ov002_021e2c5c();
        return 1;
    default:
        return 1;
    }
}

