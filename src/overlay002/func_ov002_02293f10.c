typedef unsigned short u16;
typedef unsigned int u32;
struct Ent { u16 pad; u16 side:1; u16 rest:15; };
struct Card { u32 id:13; u32 rest:19; };
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf178[];
extern int func_ov002_021bae7c(int side, int id, int index);
extern int func_ov002_0227c678(int side, int mode, int id);
extern int func_ov002_0227db10(int id, int a, int b);
int func_ov002_02293f10(struct Ent *self) {
    u32 i;
    int count = 0;
    u32 id;
    if (*(u32 *)(data_ov002_022cf178 + ((1 - self->side) & 1) * 0x868) < 3)
        return 0;
    if (func_ov002_021bae7c(self->side, 0x1306, -1) != 0)
        return 1;
    i = 0;
    if (i < *(u32 *)(data_ov002_022cf178 + (self->side & 1) * 0x868)) {
      do {
        id = ((struct Card *)(data_ov002_022cf16c + (self->side & 1) * 0x868 + 0x120))[i].id;
        if (func_ov002_0227c678(self->side, 1, (u16)id) != 0)
            return 0;
        if (func_ov002_0227db10(id, 0, 0) != 0)
            count++;
        i++;
      } while (i < *(u32 *)(data_ov002_022cf16c + (self->side & 1) * 0x868 + 0xc));
    }
    if (*(u32 *)(data_ov002_022cf178 + ((1 - self->side) & 1) * 0x868) >= 5)
        return 1;
    return count > 0;
}


