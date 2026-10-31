typedef unsigned short u16;
struct Card {
    u16 id;
    u16 side:1; u16 slot:5; u16 category:6; u16 mode:2; u16 rest:2;
};
struct Entry { unsigned id:13; unsigned rest:19; char pad[16]; };
extern char data_ov002_022cf16c[];
extern int func_ov002_02291160(struct Card *self, int unused1);
int func_ov002_02296ebc(struct Card *self, int unused1) {
    int i;
    struct Entry *p;
    int offset;
    char *row;
    if (self->mode == 0) return func_ov002_02291160(self, unused1);
    row = data_ov002_022cf16c + (self->side & 1) * 0x868;
    p = (struct Entry *)(row + 0x30);
    for (i = 0, offset = 0; i < 5; i++, offset += 0x14) {
        if (p->id && *(u16 *)(row + offset + 0x38) == 0) {
            if ((*(unsigned *)(row + offset + 0x40) >> 8) & 1) return 1;
        }
        p++;
    }
    return 0;
}

