typedef unsigned short u16;
typedef unsigned int u32;

typedef struct {
    u16 f0;
    u16 bit0 : 1;
    u16 idx : 5;
    u16 kind : 6;
    u16 pad : 4;
} Obj;

typedef struct {
    int a;
    int b;
    int pad[5];
    int c;
    int d;
} Pair;

extern char data_ov002_022cf1a8[];
extern Pair data_ov002_022cd3f4;
extern int func_ov002_021c8940(int a, int b);

int func_ov002_0220419c(Obj *self) {
    int val = *(int *)(data_ov002_022cf1a8 + (self->bit0 & 1) * 0x868 + self->idx * 0x14);
    u32 bit = self->bit0;
    u32 idx = self->idx;
    int r;

    if (self->kind != 13) {
        return 1;
    }
    if (data_ov002_022cd3f4.a == bit && data_ov002_022cd3f4.c == idx) {
        r = func_ov002_021c8940(data_ov002_022cd3f4.b, data_ov002_022cd3f4.d);
        if (r != 0 && r == val) {
            return 1;
        }
        return 0;
    }
    if (data_ov002_022cd3f4.b == bit && data_ov002_022cd3f4.d == idx) {
        r = func_ov002_021c8940(data_ov002_022cd3f4.a, data_ov002_022cd3f4.c);
        if (r != 0 && r == val) {
            return 1;
        }
        return 0;
    }
    return 0;
}
