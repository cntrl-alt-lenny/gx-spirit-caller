typedef unsigned int u32;
typedef unsigned short u16;
struct Self { u16 f0; u16 side:1; u16 rest:15; };
struct Card { u32 id:13; u32 rest:19; };
struct Player { char pad[0xc]; u32 count; char pad10[0x110]; struct Card cards[0x1d2]; };
struct Count { u32 count; char pad[0x864]; };
extern struct Player data_ov002_022cf16c[];
extern struct Count data_ov002_022cf178[];
extern int func_ov002_0227db10(int id, int flag, int enabled);
int func_ov002_0228ad68(struct Self *self) {
    u32 i = 0;
    if (i < data_ov002_022cf178[self->side & 1].count) {
        do {
            if (func_ov002_0227db10(data_ov002_022cf16c[self->side & 1].cards[i].id, 0, 1)) return 1;
            i++;
        } while (i < data_ov002_022cf16c[self->side & 1].count);
    }
    return 0;
}

