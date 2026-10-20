typedef struct {
    unsigned int id : 9;
    unsigned int side : 1;
    unsigned int pad10 : 5;
    unsigned int flag15 : 1;
    unsigned int flag16 : 1;
    unsigned int pad17 : 2;
    unsigned int kind : 4;
    unsigned int pad23 : 9;
} Card;
typedef struct {
    unsigned short pad0;
    unsigned short side : 1;
    unsigned short pad3 : 5;
    unsigned short kind : 6;
    unsigned short pad12 : 4;
    char pad4[16];
    Card card;
} Self;
typedef struct {
    char pad[0x5d4];
    unsigned int count;
    char pad2[4];
    unsigned char kinds[1];
} State;
extern State data_ov002_022ce288;
extern Card data_ov002_022ce884[];
/* The C definition takes four arguments; this original caller supplies only side. */
extern int func_ov002_021ca2b8();
extern unsigned int func_ov002_021b947c(int id);
extern int func_ov002_021bc6c4(int arg0);
extern void *func_ov002_021c93f0(int player, int kind, int extra);
extern int func_0202e234(int x);
extern int func_ov002_021c33e4(int side, int player, int extra);
extern int func_0202e310(int unused0);
extern int func_0203058c(int a);
extern int func_ov002_021bbe8c(int arg);
int func_ov002_02200140(Self *self) {
    int count = 0;
    unsigned int i;
    unsigned int result;
    unsigned char player, kind;
    unsigned short extra;
    struct CardEntry { unsigned int id : 13; unsigned int rest : 19; } *card;
    if (self->kind != 22) return 0;
    if (func_ov002_021ca2b8(self->side) == 0) return 0;
    for (i = 0; i < data_ov002_022ce288.count; i++) {
        if (data_ov002_022ce288.kinds[i] == 22 &&
            data_ov002_022ce884[i].flag16 && data_ov002_022ce884[i].flag15 &&
            data_ov002_022ce884[i].kind == 14) count++;
    }
    if (count == 1 && self->card.flag16 && self->card.flag15 && self->card.kind == 14) {
        result = func_ov002_021b947c(self->card.id);
        player = result;
        kind = (unsigned short)result >> 8;
        extra = result >> 16;
        if (func_ov002_021bc6c4(self->card.side) < 0) return 0;
        if (kind == 14) {
            card = func_ov002_021c93f0(player, kind, extra);
            if (func_0202e234(card->id) &&
                func_ov002_021c33e4(self->side, player, extra)) {
                if (!func_0202e310(card->id) ||
                    !func_0203058c(card->id) ||
                    func_ov002_021bbe8c(self->side)) return 1;
            }
        }
    }
    return 0;
}

