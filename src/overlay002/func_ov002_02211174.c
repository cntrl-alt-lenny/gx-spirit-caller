struct Ov002Self { unsigned short f0; unsigned short f2; unsigned short pad:2, blocked:1, rest:13; };
struct Slot { unsigned int id:13, rest:19; };
extern char data_ov002_022ce288[];
extern char data_ov002_022cf16c[];
extern char data_ov002_022d016c[];
/* Original supplies only player and index to this four-argument thunk. */
extern int func_ov002_021c8940();
extern int func_ov002_021d6808(struct Ov002Self *self, int player, int idx, int arg3, int arg4);
extern int func_ov002_021de408(int a, int b);
int func_ov002_02211174(struct Ov002Self *self) {
    int mask, side, idx, shift;
    struct Slot *card;
    char *base;
    if (self->blocked) return 0;
    switch (*(int *)(data_ov002_022ce288 + 0x5a8)) {
    case 0x80:
        mask = 0;
        for (side = 0, shift = 0; side < 2; side++, shift += 16) {
            idx = 5;
            card = (struct Slot *)(data_ov002_022cf16c + (side & 1) * 0x868 + 0x94);
            base = data_ov002_022cf16c + (side & 1) * 0x868 + 0x64;
            for (; idx < 10; idx++) {
                if (card->id == 0x10ef && *(unsigned short *)(base + 0x38))
                    mask |= 1 << (idx + shift);
                card = (struct Slot *)((char *)card + 20);
                base += 20;
            }
        }
        func_ov002_021de408((int)self, mask);
        return mask ? 0x7f : 1;
    case 0x7f: {
        int side;
        struct Slot *card;
        char *base;
        int player, idx;
        for (side = 0; side < 2; side++) {
            player = *(int *)(data_ov002_022d016c + 0xcec) ^ side;
            card = (struct Slot *)(data_ov002_022cf16c + (player & 1) * 0x868 + 0x30);
            base = data_ov002_022cf16c + (player & 1) * 0x868;
            for (idx = 0; idx < 5; idx++) {
                if (card->id && *(unsigned short *)(base + 0x38) && *(unsigned short *)(base + 0x36) && func_ov002_021c8940(player, idx) == 1)
                    func_ov002_021d6808(self, player, idx, 0, 0);
                card = (struct Slot *)((char *)card + 20);
                base += 20;
            }
        }
        return 1;
    }
    }
    return 0;
}





