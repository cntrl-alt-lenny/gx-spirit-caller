typedef unsigned short u16;
typedef unsigned int u32;

typedef struct {
    u16 a;
    u16 type : 4;
    u16 rest : 12;
    u16 c;
    u16 next;
} Entry;

extern Entry data_ov002_022d0650[];

int func_ov002_021b3dd0(u32 idx, u16 x, u16 y) {
    int count = 0;
    Entry *e;

    if (idx != 0) {
        do {
            e = &data_ov002_022d0650[idx];
            idx = e->next;
            if (e->type < 6) {
                if (e->a == x && e->c == y) {
                    count++;
                }
            }
        } while (idx != 0);
    }
    return count;
}
