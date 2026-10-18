typedef unsigned int u32;
typedef unsigned char u8;

typedef struct {
    u8 pad0[0x14];
    u32 count;
    u8 pad1[0x868 - 0x18];
} Slot;

extern Slot data_ov002_022cf16c[];
extern u32 data_ov002_022cf180[];
extern void func_ov002_02253458(u32 a, u32 b, u32 c);

void func_ov002_0224f8ac(u32 arg)
{
    u32 idx = arg & 1;
    u32 i = 0;
    Slot *p;

    if (i < *(u32 *)((u8 *)data_ov002_022cf180 + idx * 0x868)) {
        p = &data_ov002_022cf16c[idx];
        do {
            func_ov002_02253458(arg, 0xe, i);
            i++;
        } while (i < p->count);
    }
}
