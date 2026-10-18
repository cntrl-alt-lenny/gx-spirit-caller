typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;

typedef struct {
    u16 pad;
    u16 side : 1;
    u16 slot : 5;
} Arg;

typedef struct {
    u32 flags;
    u8 pad[0x864];
} Side;

typedef struct {
    u16 val;
    u8 pad[0x12];
} Slot;

typedef struct {
    Slot slots[0x2e];
    u8 pad[0x868 - 0x2e * 0x14];
} Slots;

extern Side data_ov002_022cf288[];
extern Slots data_ov002_022cf1a2[];
extern int func_ov002_021ff320(Arg *a, int b);

int func_ov002_0220c8d0(Arg *a, int b)
{
    u32 side = a->side & 1;

    if ((data_ov002_022cf288[side].flags >> 0x13) & 1) {
        return 0;
    }
    if (data_ov002_022cf1a2[side].slots[a->slot].val != 0) {
        return 0;
    }
    return func_ov002_021ff320(a, b);
}
