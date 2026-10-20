typedef unsigned int u32;
typedef unsigned short u16;
struct Self { u16 f0; u16 bit0:1; u16 pad:5; u16 tag:6; u16 rest:4; };
struct Card { u32 id:13; u32 rest:19; };
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf178[];
extern int func_ov002_021bbf50(int arg0);
extern int func_0202f9e8(int id);
int func_ov002_02287af8(struct Self *self, int arg1) {
    u32 i;
    u32 count;
    if (arg1 != 0) return 0;
    switch (self->tag) {
    case 0x12:
    case 0x13:
        if (func_ov002_021bbf50(self->bit0) == 0) return 1;
        if (func_ov002_021bbf50(self->bit0) >= 3) {


            for (i = 0; i < *(u32 *)(data_ov002_022cf178 + (self->bit0 & 1) * 0x868); i++) {
                switch (((struct Card *)(data_ov002_022cf16c + (self->bit0 & 1) * 0x868 + 0x120))[i].id) {
                case 0x1386: case 0x1387: case 0x1388: case 0x13b5: case 0x154b: case 0x1905:
                    return 1;
                }
            }
        }
        break;
    case 0x17:
        count = *(u32 *)(data_ov002_022cf178 + (self->bit0 & 1) * 0x868);
        for (i = 0; i < count; i++) {
            if (func_0202f9e8(((struct Card *)(data_ov002_022cf16c + (self->bit0 & 1) * 0x868 + 0x120))[i].id) != 0) return 1;
            count = *(u32 *)(data_ov002_022cf16c + (self->bit0 & 1) * 0x868 + 0xc);
        }
        break;
    }
    return 0;
}



