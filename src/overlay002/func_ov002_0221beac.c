typedef unsigned short u16;
typedef struct {
    u16 f0;
    u16 side : 1;
    u16 pad2 : 15;
    u16 f4;
    u16 pad6 : 8;
    u16 mode : 8;
    u16 f8;
    u16 slot;
} State;
typedef struct { char pad[0x48c]; State *state; } Global;
typedef struct { unsigned int id : 13; unsigned int rest : 19; } Card;
extern Global data_ov002_022ce288;
extern char data_ov002_022cf16c[];
extern int func_0202e234(int x);
extern int func_ov002_021ca440(int arg0, int arg1);
int func_ov002_0221beac(int side, int kind, int slot) {
    State *state = data_ov002_022ce288.state;
    int card;
    int flag;
    if (side == state->side && kind == 0xb) {
        card = ((Card *)(data_ov002_022cf16c + (side & 1) * 0x868 + slot * 4 + 0x120))->id;
        flag = 0;
        switch (state->mode) {
        case 0:
            if (func_0202e234(card) && func_ov002_021ca440(side, card)) flag = 1;
            else flag = 0;
            break;
        case 1:
            flag = func_0202e234(card) == 0;
            break;
        case 2:
            if (func_0202e234(card) == 0 && slot != data_ov002_022ce288.state->slot) flag = 1;
            else flag = 0;
            break;
        }
        if (flag) return 0x800;
    }
    return 0;
}
