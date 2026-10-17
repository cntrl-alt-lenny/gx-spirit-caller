typedef unsigned int u32;
typedef unsigned short u16;

typedef struct {
    u32 id : 13;
    u32 rest : 19;
} Flags;

typedef struct {
    Flags f;
    u16 pad4;
    u16 b;
    u16 a;
    u16 pad;
    u32 pad2;
    u32 pad3;
} Slot;

typedef struct {
    char pad[0x30];
    Slot slots[5];
    char pad2[0x868 - 0x30 - 5 * sizeof(Slot)];
} Side;

extern Side data_ov002_022cf16c[];

int func_ov002_021bc16c(int side, u16 x, u16 y)
{
    int count = 0;
    int i;
    Side *s = data_ov002_022cf16c + (side & 1);
    for (i = 0; i < 5; i++) {
        if (s->slots[i].f.id != 0) {
            if (x == s->slots[i].a && y == s->slots[i].b) {
                count++;
            }
        }
    }
    return count;
}
