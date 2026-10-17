struct Card {
    unsigned int a : 13;
    unsigned int bit : 1;
    unsigned int b : 8;
    unsigned int top : 8;
    unsigned int d : 2;
};

struct Side {
    char pad[0x120];
    struct Card cards[8];
};

extern char data_ov002_022cf16c[];
extern int func_ov002_021c38c4(int a, int b);

int func_ov002_0228deac(int player, int idx)
{
    char *base = data_ov002_022cf16c;
    struct Card *cards;
    struct Card *c;
    base += (player & 1) * 0x868;
    cards = ((struct Side *)base)->cards;
    c = &cards[idx];
    return func_ov002_021c38c4(player, c->top * 2 + c->bit);
}
