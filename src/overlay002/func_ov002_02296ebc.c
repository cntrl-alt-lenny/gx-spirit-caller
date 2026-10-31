struct Card {
    unsigned short id;
    unsigned short side:1;
    unsigned short slot:5;
    unsigned short category:6;
    unsigned short mode:2;
    unsigned short rest:2;
};
struct Word { unsigned id:13; unsigned rest:19; };
struct Entry { struct Word card; char pad[16]; };
struct Player { char pad[48]; struct Entry cards[5]; char tail[2004]; };
extern char data_ov002_022cf16c[];
extern int func_ov002_02291160(struct Card *self, int unused1);
int func_ov002_02296ebc(struct Card *self, int unused1) {
    int i;
    struct Entry *cards;
    unsigned offset;
    int side;
    unsigned int player;
    if (self->mode == 0) return func_ov002_02291160(self, unused1);
    side = self->side;
    player = (unsigned int)&((struct Player *)data_ov002_022cf16c)[side & 1];
    cards = ((struct Player *)player)->cards;
    for (i=0, offset=0; i<5; i++, cards++, offset+=0x14) {

        if (cards->card.id) {
            char *p;
            p = (char *)(player + offset);
            if (*(unsigned short *)(p+0x38) == 0 && ((*(unsigned *)(p+0x40) >> 8) & 1)) return 1;
        }
    }
    return 0;
}









