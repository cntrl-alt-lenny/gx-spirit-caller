typedef unsigned short u16;

typedef struct {
    int v;
    char pad[0x10];
} Ent;

typedef struct {
    Ent e[1];
    char pad[0x868 - 0x14];
} Grp;

extern Grp data_ov002_022cf1a8[];

extern int func_ov002_021b9ecc(void);
extern int func_020312a0();
extern void func_ov002_021d479c(u16 a, u16 b, u16 c, int d);

void func_ov002_021d93e0(int a, int b, int c)
{
    int v;

    func_ov002_021b9ecc();
    if (func_020312a0() == 0) {
        return;
    }
    v = *(int *)((char *)&data_ov002_022cf1a8[a & 1] + b * 0x14);
    if (c > 0) {
        func_ov002_021d479c((a != 0 ? 0x8000 : 0) | 0x3c, b, (short)c, 1);
    } else if (v > 0) {
        func_ov002_021d479c((a != 0 ? 0x8000 : 0) | 0x3c, b, (short)c, 1);
    }
}
