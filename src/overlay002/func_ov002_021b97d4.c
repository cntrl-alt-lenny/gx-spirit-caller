typedef unsigned short u16;
typedef unsigned int u32;

typedef struct {
    u16 v;
    u16 pad;
} Ent;

extern Ent data_ov002_022d0250[];

int func_ov002_021b97d4(int a, u32 b)
{
    int base;
    int j;
    int i;
    int idx;

    for (i = 0; i < 2; i++) {
        base = a ^ i;
        for (j = 0, idx = base; j < 0x80; j++) {
            if ((u32)(data_ov002_022d0250[idx].v << 19) >> 19 == b) {
                return base + j * 2;
            }
            idx += 2;
        }
    }
    return 0;
}
