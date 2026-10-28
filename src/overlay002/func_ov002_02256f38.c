extern char data_ov002_022cf16c[];
extern char data_ov002_022d016c[];
extern char data_ov002_022d0650[];
extern int func_0202df78(int a, int b);
extern void func_ov002_021df6d4(int arg0, int arg1);
extern int func_ov002_021df938(int side, int amount, int check, int card);
extern int func_ov002_021d5c50(int arg0, int arg1, int unused2, int unused3);
typedef struct { unsigned short id; unsigned short kind:4; unsigned short rest:12; unsigned short card; unsigned short next; } Entry;
void func_ov002_02256f38(int card)
{
    int i, side;
    unsigned int index;
    Entry *entry;
    for (i = 0; i < 2; i++) {
        side = *(int *)(data_ov002_022d016c + 0xcec) ^ i;
        index = *(unsigned short *)(data_ov002_022cf16c + (side & 1) * 0x868 + 0x116);
        while (index != 0) {
            entry = (Entry *)(data_ov002_022d0650 + index * 8);
            index = entry->next;
            if (entry->kind == 1 && entry->id == 0x1a9d && func_0202df78(entry->card, card) != 0) {
                func_ov002_021df6d4(side, 0x1a9d);
                func_ov002_021df938(side, 1000, 0, 0x1a9d);
                func_ov002_021d5c50(side, 11, 0x1a9d, entry->card);
            }
        }
    }
}

