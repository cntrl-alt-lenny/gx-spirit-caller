typedef unsigned short u16;
typedef unsigned int u32;

typedef struct {
    u16 pad0;
    u16 side : 1;
    u16 f1 : 15;
    u16 p0 : 6;
    u16 id : 9;
    u16 p1 : 1;
} Obj;

typedef struct {
    char pad[0x418];
    int arr[0x1a];
    char pad2[0x868 - 0x418 - 0x68];
} Bank;

extern Bank data_ov002_022cf16c[];
extern int func_ov002_021b99b4(int, int);
extern void func_ov002_021d7d0c(Obj *, int, void *);

int func_ov002_0222d5d8(Obj *p)
{
    int idx = func_ov002_021b99b4(p->side, p->id);
    if (idx >= 0) {
        func_ov002_021d7d0c(p, p->side, &data_ov002_022cf16c[p->side & 1].arr[idx]);
    }
    return 0;
}
