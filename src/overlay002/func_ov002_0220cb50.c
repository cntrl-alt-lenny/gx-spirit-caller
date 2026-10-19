typedef unsigned short u16;
typedef unsigned int u32;
typedef struct { u16 value:13; u16 rest:3; u16 pad; } Entry;
typedef struct { u32 index:9; u32 side:1; u32 pad:7; u32 active:1; u32 rest:14; } Packed;
typedef struct {
    u16 pad0;
    u16 side:1; u16 pad1:5; u16 kind:6; u16 pad2:4;
    unsigned char pad3[0x10];
    Packed card;
} Self;
extern char data_ov002_022cf17c[];
extern char data_ov002_022ce288[];
extern Packed data_ov002_022ce884[];
extern Entry data_ov002_022d0250[];
extern unsigned int func_0202b8a8(int id);
extern int func_0202eac8(int id);
int func_ov002_0220cb50(Self *self) {
    unsigned int i; int id;
    char *p;
    Packed *card; int best = 0;
    if (self->kind != 0x1b) return 0;
    if (*(int *)(data_ov002_022cf17c + (self->side & 1) * 0x868) == 0) return 0;
    p = data_ov002_022ce288;
    i = 0;
    if (*(u32 *)(data_ov002_022ce288 + 0x5d4) > i) {
    card = data_ov002_022ce884;
    do {
        if ((unsigned char)p[0x5dc] == 0x1b) {
            id = data_ov002_022d0250[card->index].value;
            if (card->side == self->side && card->active && func_0202eac8(id) && best <= (int)func_0202b8a8(id)) {
                best = func_0202b8a8(id);
            }
        }
        i++; p++; card++;
    } while (i < *(u32 *)(data_ov002_022ce288 + 0x5d4));
    }
    if (best != 0) {
        if (best == (int)func_0202b8a8(data_ov002_022d0250[self->card.index].value)) return 1;
    }
    return 0;
}





