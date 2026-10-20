typedef struct { unsigned short id; unsigned short side:1; unsigned short rest:15; unsigned short pad[4]; unsigned short count; } Card;
typedef struct { unsigned int id:13; unsigned int rest:19; } Slot;
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern char data_ov002_022cf178[];
extern int func_ov002_021c1ef0(Card *card, int side, int slot);
/* Original caller supplies only r0-r1 to the four-parameter thunk. */
extern int func_ov002_021c84e0();
/* Original caller supplies only r0-r1 to the four-parameter thunk. */
extern int func_ov002_021b9ea4();
extern int func_ov002_021c1a2c(int side, int slot, int id);
extern int func_ov002_022536e8(void *self, int arg1, int arg2);
int func_ov002_021f2478(Card *card, int side, int slot) {
    int off;
    int pos;
    unsigned int i;
    if (slot >= 5) return 0;
    if (side == card->side) return 0;
    off = (side & 1) * 0x868;
    pos = slot * 0x14;
    if (((Slot *)(data_ov002_022cf16c + off + 0x30 + pos))->id == 0) return 0;
    if (*(unsigned short *)(data_ov002_022cf1a4 + off + pos) == 0) return 0;
    if (func_ov002_021c1ef0(card, side, slot) == 0) return 0;
    switch (card->id) {
    case 0x17b0:
        return func_ov002_021c84e0(side, slot) > 1;
    case 0x192b:
        card->count = func_ov002_021c84e0(side, slot);
        i = 0;
        if (i < *(unsigned int *)(data_ov002_022cf178 + (card->side & 1) * 0x868)) {
            do {
                if (func_ov002_022536e8(card->side, card->id, i) != 0) return 1;
                i++;
            } while (i < *(unsigned int *)(data_ov002_022cf16c + (card->side & 1) * 0x868 + 0xc));
        }
        return 0;
    case 0x1a9c:
        if (func_ov002_021b9ea4(side, slot) == 0) return 0;
        return func_ov002_021c1a2c(side, slot, card->id) != 0;
    }
    return 1;
}




