typedef unsigned short u16;
typedef unsigned int u32;

typedef struct {
    char pad0[0xd0];
    u32 flags;
    char padd4[0xcec - 0xd4];
    int idx;
    char pad2[0xd0c - 0xcf0];
    int active;
    char pad3[0xd2c - 0xd10];
    int v2c;
    int v30;
} DuelState;

typedef struct {
    char pad0[2];
    u16 half;
    char pad1[0x80c - 4];
    int v80c;
} DuelAux;

extern DuelState data_ov002_022d016c;
extern DuelAux data_ov002_022ce950;
extern int data_ov002_022cd744[];
extern char data_ov002_022cf282[];

extern void func_ov002_021b212c(int a, int b, int c);
extern void func_ov002_021b2ab4(void);
extern int func_ov002_0229ade0(int cmd, int a, int b, int c);

void func_ov002_021cb0ac(void)
{
    u16 h = data_ov002_022ce950.half;
    if (data_ov002_022d016c.active == 0 || data_ov002_022cd744[data_ov002_022d016c.idx] != 2) {
        if (h != 0) {
            func_ov002_021b212c(*(u16 *)(data_ov002_022cf282 + (data_ov002_022d016c.idx & 1) * 0x868), 0x11ed, 1);
        }
        data_ov002_022d016c.v2c = 12;
        data_ov002_022d016c.v30 = 0;
    }
    data_ov002_022d016c.flags &= ~2;
    data_ov002_022d016c.flags &= ~1;
    func_ov002_021b2ab4();
    func_ov002_0229ade0(0x24, 0, 0, 0);
    data_ov002_022ce950.v80c = 0;
}
