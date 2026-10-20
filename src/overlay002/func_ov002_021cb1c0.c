typedef unsigned short u16;
typedef unsigned int u32;
typedef struct { char pad[0xd0]; u32 flags; } DuelState;
typedef struct { char pad[0x16]; u16 index; } First;
typedef struct { char pad[0x7e]; u16 index; } Second;
typedef struct { char pad[0x80c]; int value; } DuelAux;
extern DuelState data_ov002_022d016c;
extern First data_ov002_022cf26c;
extern Second data_ov002_022cfa6c;
extern DuelAux data_ov002_022ce950;
extern void func_ov002_021b218c(int idx, int arg1, int arg2, int arg3);
extern void func_ov002_021b2ab4(void);
void func_ov002_021cb1c0(void)
{
    if (data_ov002_022d016c.flags & 1) {
        func_ov002_021b218c(data_ov002_022cf26c.index, 0x19b8, 1, 1);
        func_ov002_021b218c(data_ov002_022cfa6c.index, 0x19b8, 1, 1);
    }
    data_ov002_022d016c.flags &= ~1;
    func_ov002_021b2ab4();
    data_ov002_022ce950.value = 0;
}
