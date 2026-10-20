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
    char pad2[0x7d4];
} Side;
extern Side data_ov002_022cf16c[];
int func_ov002_021bc0d4(int side, int x, int y)
{
    Side *s = data_ov002_022cf16c;
    int count = 0;
    int i;
    s += side & 1;
    for (i = 0; i < 5; i++) {
        if (s->slots[i].f.id != 0) {
            int a = 0;
            int b = 0;
            if (x == 0 || s->slots[i].a != 0) {
                a = 1;
            }
            if (y == 0 || s->slots[i].b == 0) {
                b = 1;
            }
            if (a != 0 && b != 0) {
                count++;
            }
        }
    }
    return count;
}


