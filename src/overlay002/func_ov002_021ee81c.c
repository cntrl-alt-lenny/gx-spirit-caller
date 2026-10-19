typedef unsigned short u16;
typedef struct {
    u16 f0;
    u16 flag0:1;
    u16 field:5;
    u16 :10;
    u16 low:6;
    u16 value:9;
    u16 :1;
    u16 f6;
    u16 f8;
} Card021c1e44;
struct Slot { unsigned int id:13; unsigned int :19; };
struct Entry { struct Slot slot; char pad[16]; };
struct Row { char pad[0x30]; struct Entry entries[11]; };
struct List { char pad[0x5d4]; unsigned int count; char pad2[4]; unsigned char types[1]; };
struct Item { unsigned int :9; unsigned int player:1; unsigned int index:4; unsigned int :2; unsigned int flag:1; unsigned int :15; };
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern struct List data_ov002_022ce288;
extern struct Item data_ov002_022ce884[];
extern int func_ov002_021c1e44(Card021c1e44 *a0, int a1, int a2);
extern int func_ov002_021c8470(int a, int b);
extern int func_ov002_021b3fd8(int arg0, int arg1, int arg2, int arg3);
int func_ov002_021ee81c(Card021c1e44 *self, int player, int idx) {
    int poff = (player & 1) * 0x868;
    int ioff = idx * 20;
    unsigned int i;
    if (((struct Row *)(data_ov002_022cf16c + poff))->entries[idx].slot.id == 0) return 0;
    if (*(u16 *)(data_ov002_022cf1a4 + poff + ioff) == 0) return 0;
    if (func_ov002_021c1e44(self, player, idx) != 0) return 0;
    if (self->f0 == 0x1518) {
        if (func_ov002_021c8470(player, idx) < 0x5dc) return 0;
    }
    if (self->f8 == 0) {


        int count = data_ov002_022ce288.count;
        for (i = 0; i < count; i++) {
            unsigned int type = data_ov002_022ce288.types[i];
            switch (type) {
            case 6: case 7: case 8:

                struct Item *item = &data_ov002_022ce884[i];
                if (player == item->player && idx == item->index) {
                    return self->flag0 != (item->flag ^ item->player);
                }
            }
        }
    } else {
        return func_ov002_021b3fd8(player, idx, 0x1518, self->value);
    }
    return 0;
}









