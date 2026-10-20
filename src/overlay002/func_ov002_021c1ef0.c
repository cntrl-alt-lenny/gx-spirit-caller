typedef struct { unsigned short id; unsigned short side:1; unsigned short rest:15; } Card;
typedef struct { unsigned int id:13; unsigned int rest:19; } Slot;
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern char data_ov002_022cf1ac[];
extern char data_ov002_022ce288[];
extern int func_ov002_021b9ecc(int, int);
extern int func_ov002_021bae7c(int, int, int);
extern int func_ov002_021bb068(int);
/* The C thunk has four formal parameters, but this original caller supplies only r0-r1. */
extern int func_ov002_021c8940();
int func_ov002_021c1ef0(Card *card, int side, int slot) {
    int off = (side & 1) * 0x868;
    int pos = slot * 0x14;
    int id;
    if (((Slot *)((data_ov002_022cf16c + off + 0x30) + pos))->id == 0) return 0;
    if (*(unsigned short *)(data_ov002_022cf1a4 + off + pos) == 0) return 1;
    if (*(int *)(data_ov002_022ce288 + 0x5c0) != 0) return 1;
    if (slot <= 4) {
        if (!((*(unsigned int *)(data_ov002_022cf1ac + off + pos) >> 6) & 1)) {
            id = func_ov002_021b9ecc(side, slot);
            switch (id) { case 0x1386: case 0x1387: case 0x1388: return 0; }
        }
        if (func_ov002_021c8940(side, slot) == 1) {
            if (func_ov002_021bb068(0x128b) != 0) return 0;
            if (func_ov002_021bae7c(1 - card->side, 0x1879, -1) != 0) return 0;
        }
        if (func_ov002_021bae7c(1 - card->side, 0x17dc, -1) != 0) {
            id = func_ov002_021b9ecc(side, slot);
            switch (id) { case 0x17d2: case 0x17d3: case 0x17d4: return 0; }
        }
    }
    return 1;
}


