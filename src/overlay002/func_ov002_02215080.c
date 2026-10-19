typedef unsigned short u16;
struct Obj { u16 id; u16 side:1, rest:15; u16 pad:2, skip:1, rest4:13; };
struct Node { unsigned int id:13, flag:1, pad:8, sub:8, rest:2; };
struct State { char pad[0x5a8]; int state; };
extern struct State data_ov002_022ce288;
extern int func_ov002_021ca2b8();
extern int func_ov002_021ca3f0(int arg0, int arg1);
extern int func_ov002_021bc618(int arg0);
extern void func_ov002_021e2b3c();
extern void func_ov002_021e2c5c();
extern void func_ov002_0227ac64(int side, void *slot, int a, int b, unsigned int flags);
int func_ov002_02215080(struct Obj *p) {

    if (p->skip) return 0;
    if (func_ov002_021ca2b8(p->side) == 0) return 0;
    if (func_ov002_021ca3f0(p->side, 0x14f8) == 0) return 0;
    switch (data_ov002_022ce288.state) {
    case 0x80:
        func_ov002_021e2b3c();
        return 0x7f;
    case 0x7f: {
        if (func_ov002_021bc618(p->side) == 0) return 0x7e;
        struct Node node = {0};
        node.id = 0x14f8;
        node.flag = p->side;
        func_ov002_0227ac64(p->side, &node, 1, 1, 1);
        return 0x7f;
    }
    case 0x7e:
        func_ov002_021e2c5c();
        return 0;
    }
    return 0;
}


