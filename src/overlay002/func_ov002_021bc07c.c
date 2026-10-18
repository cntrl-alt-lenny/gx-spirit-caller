typedef unsigned int u32;
typedef int s32;

typedef struct {
    u32 bits : 13;
    u32 rest : 19;
    u32 pad[4];
} Slot;

typedef struct {
    char pad0[0x30];
    Slot slots[11];
    char pad1[0x868 - 0x30 - 11 * 0x14];
} Side;

extern Side data_ov002_022cf16c[];
extern s32 func_0202e2f8(u32 id);

s32 func_ov002_021bc07c(u32 side)
{
    Side *s = &data_ov002_022cf16c[side & 1];
    s32 i;
    s32 count;
    i = count = 0;
    Slot *p = s->slots;

    do {
        s32 r = func_0202e2f8(p->bits);
        i++;
        if (r != 0) {
            count++;
        }
        p++;
    } while (i <= 10);
    return count;
}
