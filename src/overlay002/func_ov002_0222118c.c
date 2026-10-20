typedef unsigned short u16;
typedef struct Card {
    u16 id;
    u16 side : 1;
    u16 unused2 : 13;
    u16 flipped : 1;
    u16 unused3 : 1;
    u16 unused4a : 2;
    u16 blocked : 1;
    u16 unused4b : 2;
    u16 active : 1;
    u16 unused5 : 10;
    u16 pad[9];
    u16 effect;
    u16 owner : 1;
    u16 unused6 : 15;
} Card;
struct State { char pad[0x5a8]; int state; int index; };
extern struct State data_ov002_022ce288;
extern unsigned int func_ov002_021b4618(unsigned int x);
extern int func_ov002_021de408(int a, int b);
extern int func_ov002_021df818(Card *card, int side, int amount);
extern void func_ov002_021e05fc(int side, int amount);
extern int func_ov002_02257704(void *self);
int func_ov002_0222118c(Card *self) {
    int mask;
    if (self->blocked) return 0;
    switch (data_ov002_022ce288.state) {
    case 0x80:
        mask = func_ov002_02257704(self);
        data_ov002_022ce288.index = func_ov002_021b4618(mask & func_ov002_021de408((int)self, mask));
        return 0x7f;
    case 0x7f:
        switch (self->id) {
        case 0x14aa:
            func_ov002_021df818(self, 1 - self->side, data_ov002_022ce288.index * 500);
            break;
        case 0x16d7:
            func_ov002_021df818(self, 1 - self->side, data_ov002_022ce288.index * 300);
            break;
        case 0x1665:
            func_ov002_021e05fc(self->side, data_ov002_022ce288.index * 800);
            break;
        case 0x170f:
            func_ov002_021e05fc(self->side, data_ov002_022ce288.index * 500);
            break;
        case 0x18dc:
            func_ov002_021df818(self, 1 - self->side, data_ov002_022ce288.index * 300);
            break;
        case 0x19b0:
            func_ov002_021df818(self, 1 - (self->side ^ self->flipped), data_ov002_022ce288.index * 100);
            break;
        }
        return 0;
    }
    return 0;
}
