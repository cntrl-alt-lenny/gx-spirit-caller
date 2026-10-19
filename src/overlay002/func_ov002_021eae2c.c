typedef unsigned int u32;
typedef unsigned short u16;
struct Self { u16 id; };
struct Id { u32 id:13; };
struct Entry { u32 :9; u32 side:1; u32 slot:4; u32 :18; };
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern char data_ov002_022ce288[];
extern struct Entry data_ov002_022ce884[];
extern int func_ov002_021c1ef0(struct Self *, int, int);
extern int func_ov002_021c8470(int a, int b);
extern int func_ov002_021c8940();
int func_ov002_021eae2c(struct Self *self, int player, int idx) {
    int off = (player & 1) * 0x868;
    int o = idx * 0x14;
    unsigned int i;
    if (((struct Id *)(data_ov002_022cf16c + off + 0x30 + o))->id == 0) return 0;
    if (idx >= 5) return 0;
    if (*(u16 *)(data_ov002_022cf1a4 + off + o) == 0) return 0;
    if (func_ov002_021c1ef0(self, player, idx) == 0) return 0;
    switch (self->id) {
    case 0x12cd:
        for (i = 0; i < *(u32 *)(data_ov002_022ce288 + 0x5d4); i++) {
            int type = (unsigned char)data_ov002_022ce288[0x5dc+i];
            switch (type) {
            case 6: case 7: case 8:
                if (player == data_ov002_022ce884[i].side && idx == data_ov002_022ce884[i].slot)
                    return func_ov002_021c8470(player, idx) <= 2000;
            }
        }
        break;
    case 0x184b:
        return func_ov002_021c8940(player, idx) == 7;
    }
    return 0;
}





