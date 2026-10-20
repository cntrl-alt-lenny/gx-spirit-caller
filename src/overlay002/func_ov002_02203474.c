typedef struct {
    unsigned short unused;
    unsigned short flag : 1;
    unsigned short : 15;
} Card;
typedef struct {
    volatile unsigned int id : 13;
    volatile unsigned int side : 1;
    unsigned int : 18;
    unsigned int pad4;
    unsigned short active;
    unsigned char padA[10];
} Entry;
typedef struct {
    unsigned char pad[0x30];
    Entry entries[5];
} Bank;
extern unsigned char data_ov002_022cf16c[];
int func_ov002_02203474(Card *card)
{
    int side = card->flag;
    int i = 0;
    Bank *bank = (Bank *)(data_ov002_022cf16c + (side & 1) * 0x868);
    Entry *entry = bank->entries;
    for (; i <= 4; entry++, i++) {
        if (entry->id) {
        Bank *current = (Bank *)((unsigned int)bank + i * 0x14);
        if (current->entries[0].active && side != current->entries[0].side)
            return 1;
        }
    }
    return 0;
}

