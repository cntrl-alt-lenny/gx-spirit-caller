typedef unsigned int u32;
typedef unsigned short u16;
struct Self { u16 f0; u16 player:1; u16 rest:15; u16 low:6; u16 field:9; u16 top:1; };
struct Entry { u32 id:13; u32 lo:1; u32 pad:8; u32 hi:8; u32 end:2; };
extern int func_ov002_021ca2b8();
extern int func_ov002_021b99b4(int player, int id);
extern int func_ov002_021c23ac(int player, int index);
extern int func_ov002_021c8940();
extern int func_ov002_021ca5bc(int arg0);
extern unsigned int func_0202b878(int id);
extern char data_ov002_022cf178[];
extern char data_ov002_022cf16c[];
int func_ov002_02207818(struct Self *self) {
    int i; int offset;
    int type;
    if (!func_ov002_021ca2b8(self->player)) return 0;
    if (func_ov002_021b99b4(self->player, self->field) < 0) return 0;
    for (i = 0; i <= 4; i++) {
        if (func_ov002_021c23ac(self->player, i)) {
            type = func_ov002_021c8940(self->player, i);
            switch (type) { case 11: case 12: case 16: return 1; }
        }
    }
    i = 0;
    if (i < *(u32 *)(data_ov002_022cf178 + (self->player & 1)*0x868)) {
      offset = 0;
      do {
        struct Entry *e = (struct Entry *)(data_ov002_022cf16c + (self->player & 1)*0x868 + 0x120 + offset);
        int id = e->id;
        if (func_ov002_021ca5bc(e->hi*2 + e->lo)) {
            type = func_0202b878(id);
            switch (type) { case 11: case 12: case 16: return 1; }
        }
        offset += 4;

    } while (++i < *(u32 *)(data_ov002_022cf16c + (self->player & 1)*0x868 + 0xc));
    }
    return 0;
}












