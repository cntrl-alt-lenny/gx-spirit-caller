typedef unsigned short u16;
typedef unsigned int u32;

struct Arg {
    u16 pad0;
    u16 side : 1;
    u16 idx : 5;
    u16 rest : 10;
    u16 pad4 : 6;
    u16 key : 9;
    u16 pad4b : 1;
};

struct Row {
    u32 pad0 : 13;
    u32 lo : 1;
    u32 pad1 : 8;
    u32 hi : 8;
    u32 pad2 : 2;
};

extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern char data_ov002_022ce288[];
extern int func_ov002_021b3ecc(int a, int b, int c);
extern void func_ov002_021e276c(int a, int b, int c, int d);
extern int func_ov002_022112f8(struct Arg *a, int b);

int func_ov002_02221d4c(struct Arg *a, int b) {
    int side = a->side;
    int idx = a->idx;
    int key = a->key;
    struct Row *row = (struct Row *)(data_ov002_022cf16c + (side & 1) * 0x868 + 0x30 + idx * 20);

    if (key != row->hi * 2 + row->lo) {
        return 0;
    }
    if (*(u16 *)(data_ov002_022cf1a4 + (side & 1) * 0x868 + idx * 20) == 0) {
        return 0;
    }
    if (*(int *)(data_ov002_022ce288 + 0x5a8) == 0x80) {
        if (func_ov002_021b3ecc(side, 0xb, 0x14c4) != 0) {
            return 0;
        }
        func_ov002_021e276c(a->side, 0x14c4, 1, 0);
    }
    return func_ov002_022112f8(a, b);
}
