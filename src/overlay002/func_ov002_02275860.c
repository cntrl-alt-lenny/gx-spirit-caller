typedef struct { unsigned int bit0 : 1; } Flag;
typedef struct { unsigned int id : 13; } Slot;

typedef struct { int w[5]; } Ent;
extern Flag data_ov002_022cd300;
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern int func_0202b878(int id);
extern int func_ov002_021b8fcc(int a0, int a1);
extern int func_ov002_021c23ac(int a0, int a1);

int func_ov002_02275860(int a0, int a1, int a2) {
    int idx = a1 + a2;
    int side;
    int off;
    int id;
    if (a0 != data_ov002_022cd300.bit0)
        return 0;
    if (idx > 10)
        return 0;
    side = (a0 & 1) * 0x868;
    off = idx * 20;
    id = ((Slot *)(data_ov002_022cf16c + side + 0x30 + off))->id;
    if (id == 0)
        return 0;
    if (*(unsigned short *)(off + (data_ov002_022cf1a4 + side)) == 0)
        return 0;
    if (func_0202b878(id) != 0x17)
        return 0;
    if (idx >= 5 || func_ov002_021b8fcc(a0, idx) != 0) {
        if (func_ov002_021c23ac(a0, idx) != 0)
            return 0x800;
    }
    return 0;
}
