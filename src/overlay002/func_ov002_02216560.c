typedef unsigned int u32;
struct Node {
    unsigned short f0;
    unsigned short side:1; unsigned short :15;
    unsigned short :2; unsigned short blocked:1; unsigned short :13;
    unsigned short f6;
    unsigned short previous;
};
struct Key { u32 id:13; u32 flag:1; u32 :8; u32 kind:8; u32 :2; };
struct Entry { char pad[0x120]; struct Key keys[0x1d2]; };
struct Active { int active; char pad[0x864]; };
struct State { char pad[0x5a8]; int state; };
struct Choice { char pad[0xd70]; int side; int unused; int index; };
extern struct Entry data_ov002_022cf16c[];
extern struct Active data_ov002_022cf178[];
extern struct State data_ov002_022ce288;
extern struct Choice data_ov002_022d016c;
extern void func_ov002_021ae400(int a, int b);
extern int func_ov002_021d87a4(int arg0, int arg1, int arg2);
extern int func_ov002_021df708(int arg0, int arg1);
extern int func_ov002_021e278c(int arg0, int arg1);
extern int func_ov002_02216530(int a0, int a1);
extern void func_ov002_022592ec(int arg0);
extern int func_ov002_022593f4(void);
int func_ov002_02216560(struct Node *self) {
    int side;
    int blocked = self->blocked;
    int previous = self->previous & 1;
    if (blocked) return 0;
    side = self->side;
    if (previous == side) return 0;
    if (data_ov002_022cf178[(1-side)&1].active == 0) return 0;
    switch (data_ov002_022ce288.state) {
    case 0x80:
        func_ov002_021ae400(side, 0xf4);
        func_ov002_022592ec((int)func_ov002_02216530);
        return 0x7f;
    case 0x7f:
        if (func_ov002_022593f4() == 0) return 0x80;
        {
            int side2 = data_ov002_022d016c.side;
            struct Key *keys = data_ov002_022cf16c[side2&1].keys;
            int index = data_ov002_022d016c.index;
            func_ov002_021d87a4(side2, 0xb, keys[index].kind*2+keys[index].flag);
            func_ov002_021df708(side2, keys[index].id);
            func_ov002_021e278c(side2, keys[index].kind*2+keys[index].flag);
        }
        return 0;
    }
    return 0;
}


