typedef unsigned int u32;
typedef unsigned short u16;

typedef struct {
    u32 val : 13;
    u32 rest : 19;
    u16 pad4;
    u16 id;
    u32 pad8[3];
} Slot;

typedef struct {
    char pad[0x30];
    Slot slots[5];
    char rest[0x868 - 0x30 - 5 * 0x14];
} Side;

extern Side data_ov002_022cf16c[2];

int func_ov002_021bc22c(u32 side, u32 id) {
    int count = 0;
    int i;
    Side *s = data_ov002_022cf16c;
    s += side & 1;
    for (i = 0; i < 5; i++) {
        if (s->slots[i].val != 0) {
            if (id == s->slots[i].id) {
                count++;
            }
        }
    }
    return count;
}
