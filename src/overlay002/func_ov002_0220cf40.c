typedef unsigned short u16;
typedef unsigned int u32;

typedef struct {
    u16 f0;
    u16 side : 1;
    u16 pad2 : 5;
    u16 kind : 6;
    u16 pad3 : 4;
    u32 pad[4];
    void *ptr;
} S;

typedef struct {
    u32 n;
    u32 pad[0x219];
} T;

extern u32 data_ov002_022cd3f4;
extern T data_ov002_022cf17c[];

extern int func_ov002_021bbf50(int side);
extern int func_ov002_022577dc(S *p);

int func_ov002_0220cf40(S *p) {
    if (p->kind != 0x12)
        return 0;
    if (p->ptr == 0)
        return 0;
    if (data_ov002_022cd3f4 != 1 - p->side)
        return 0;
    if (data_ov002_022cf17c[p->side & 1].n < 2)
        return 0;
    if (func_ov002_021bbf50(p->side) != 0) {
        int a = func_ov002_021bbf50(p->side);
        if (a == func_ov002_022577dc(p))
            return 2;
    }
    return 0;
}
