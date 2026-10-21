typedef struct { unsigned short id; unsigned short side:1; } Card;
typedef struct { unsigned int id:13; unsigned int rest:19; } Entry;
typedef struct { char pad[0x120]; Entry entries[1]; } Table;
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf178[];
extern int func_ov002_02291160(Card *card);
extern int func_0202e310(int unused0);
int func_ov002_02291d10(Card *card) {
    unsigned int i;
    if (func_ov002_02291160(card) == 0) return 0;
    i = 0;
    if (i < *(unsigned int *)(data_ov002_022cf178 + (card->side & 1) * 0x868)) {
        do {
            Entry *entry = &((Table *)(data_ov002_022cf16c + (card->side & 1) * 0x868))->entries[i];
            if (func_0202e310(entry->id) != 0) return 1;
            i++;
        } while (i < *(unsigned int *)(data_ov002_022cf16c + (card->side & 1) * 0x868 + 0xc));
    }
    return 0;
}


