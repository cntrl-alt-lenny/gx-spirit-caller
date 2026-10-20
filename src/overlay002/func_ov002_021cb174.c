typedef unsigned short u16;
typedef unsigned int u32;
typedef struct {
    char pad0[0xd0];
    u32 flags;
    char pad1[0xc58];
    int state;
    int value;
} DuelState;
typedef struct {
    char pad0[2];
    u16 half;
    char pad1[0x808];
    int value;
} DuelAux;
extern DuelState data_ov002_022d016c;
extern DuelAux data_ov002_022ce950;
void func_ov002_021cb174(void)
{
    data_ov002_022d016c.state = 6;
    data_ov002_022d016c.value = (data_ov002_022ce950.half & 1) == 0;
    data_ov002_022d016c.flags |= 1;
    data_ov002_022ce950.value = 0;
}
