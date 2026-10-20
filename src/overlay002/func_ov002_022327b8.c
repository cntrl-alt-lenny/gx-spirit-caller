typedef unsigned short u16;
typedef struct Card {
    u16 id;
    u16 side : 1;
    u16 unused2 : 13;
    u16 flipped : 1;
    u16 unused3 : 1;
    u16 unused4 : 5;
    u16 active : 1;
    u16 unused5 : 10;
    u16 pad[9];
    u16 effect;
    u16 owner : 1;
    u16 unused6 : 15;
} Card;
extern int func_ov002_021c848c(int a, int b);
extern int func_ov002_021de408(int a, int b);
extern int func_ov002_021df818(Card *card, int side, int amount);
extern void func_ov002_021e2b3c(int unused0);
extern void func_ov002_021e2c5c(int unused0);
extern int func_ov002_02257704(void *self);
int func_ov002_022327b8(Card *self) {
    int i, j;
    int total = 0;
    int mask;
    func_ov002_021e2b3c((int)self);
    mask = func_ov002_021de408((int)self, func_ov002_02257704(self));
    for (i = 0; i < 2; i++) {
        for (j = 0; j <= 4; j++) {
            if (mask & (1 << (j + i * 16)))
                total += func_ov002_021c848c(i, j);
        }
    }
    func_ov002_021e2c5c(func_ov002_021df818(self, 1 - self->side, total));
    return 0;
}

