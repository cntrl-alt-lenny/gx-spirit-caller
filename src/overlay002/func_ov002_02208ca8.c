typedef unsigned short u16;
typedef unsigned int u32;
struct Self { u16 val; u16 side:1; u16 rest:15; char pad[8]; u16 result; };
struct Entry { u32 id:13; u32 bit13:1; u32 pad:8; u32 index:8; u32 rest:2; };
struct State { char pad[12]; u32 count; char gap[0x110]; struct Entry entries[0x1d2]; };
extern char data_ov002_022cf178[];
extern char data_ov002_022cf16c[];
extern int func_0202b950(int unused0);
extern int func_0202e234(int x);
extern int func_ov002_021ca5bc(int arg0);
extern int func_ov002_022575c8(int a0, int a1, int a2);
int func_ov002_02208ca8(struct Self *self) {
    u32 i;
    int best = -1;
    int id, value;
    int j;
    i = 0;
    if (i < *(u32 *)(data_ov002_022cf178 + (self->side & 1) * 0x868)) {
        do {
            id = ((struct Entry *)(data_ov002_022cf16c + (self->side & 1) * 0x868 + 0x120))[i].id;
            value = func_0202b950(id);
            if (func_0202e234(id) != 0 && best < value && value != 0xffff) {
                if (func_ov002_021ca5bc(((struct Entry *)(data_ov002_022cf16c + (self->side & 1) * 0x868 + 0x120))[i].index * 2 + ((struct Entry *)(data_ov002_022cf16c + (self->side & 1) * 0x868 + 0x120))[i].bit13) != 0) best = value;
            }
            i++;
        } while (i < *(u32 *)(data_ov002_022cf16c + (self->side & 1) * 0x868 + 0xc));
    }
    if (best < 0) return 0;
    self->result = best;
    for (j = 0; j <= 4; j++) {
        if (func_ov002_022575c8((int)self, 1 - self->side, j) != 0) return 2;
    }
    return 0;
}



