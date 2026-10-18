typedef unsigned short u16;
typedef unsigned int u32;

extern char data_ov002_022cf16c[];
extern int func_0202f9e8(int x);

struct Arg {
    u16 f0;
    u16 player : 1;
    u16 kind : 5;
    u16 _p2 : 10;
    u16 a : 1;
    u16 b : 1;
    u16 c : 1;
    u16 _p4 : 3;
    u16 key : 9;
    u16 _p5 : 1;
};

struct Row {
    u32 _a : 13;
    u32 lo : 1;
    u32 _b : 8;
    u32 hi : 8;
    u32 _c : 2;
};

int func_ov002_02220904(struct Arg *p, u16 *q)
{
    int key = p->key;
    struct Row *row = (struct Row *)(data_ov002_022cf16c + (p->player & 1) * 0x868 + 0x30 + p->kind * 20);
    if (key != row->hi * 2 + row->lo) {
        return 0;
    }
    if (q != 0) {
        if (func_0202f9e8(*q) == 1) {
            p->b = 1;
            p->c = p->b;
        }
    }
    return 0;
}
