typedef unsigned short u16;
typedef unsigned int u32;

typedef struct {
    u16 keys;
    u16 aux;
    char pad[0x808 - 4];
    int pad2;
    int field_80c;
    int state;
} Ov002State;

typedef struct {
    u32 flags;
    char pad[0x868 - 4];
} Ov002Slot;

extern Ov002State data_ov002_022ce950;
extern Ov002Slot data_ov002_022cf288[];

extern int func_ov002_021b9aa8(int a, int b);
extern int func_ov002_0229ade0(int a, int b, int c, int d);
extern int func_ov002_0229c7f8(int a);

void func_ov002_021d2140(void)
{
    int idx;
    int r;
    u16 aux;

    idx = (data_ov002_022ce950.keys & 0x8000) ? 1 : 0;
    aux = data_ov002_022ce950.aux;
    r = func_ov002_021b9aa8(idx, aux);

    switch (data_ov002_022ce950.state) {
    case 0:
        data_ov002_022ce950.state++;
        break;
    case 1:
        if (r >= 0) {
            func_ov002_0229ade0(0x11, idx, r, 0);
            data_ov002_022cf288[idx & 1].flags |= 4;
        }
        data_ov002_022ce950.state++;
        break;
    case 2:
        if (func_ov002_0229c7f8(0x11) == 0) {
            data_ov002_022ce950.field_80c = 0;
        }
        break;
    }
}
