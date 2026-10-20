struct CardId { unsigned int id:13; unsigned int rest:19; };
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf178[];
extern int func_ov002_021bae7c(int arg0, int arg1, int arg2);
extern int func_ov002_021c3ae4(int arg0, int arg1);
int func_ov002_022979bc(int player, int flag) {
    int count = 0;
    int off;
    int i;
    char *p;
    struct CardId *id;
    off = 0;
    if (func_ov002_021bae7c(player, 0x145d, -1)) return 1;
    if (func_ov002_021bae7c(player, 0x146f, -1)) return 1;
    if (func_ov002_021bae7c(player, 0x1a6f, -1)) return 1;
    off = (player & 1) * 0x868;
    p = data_ov002_022cf16c + off;
    id = (struct CardId *)(p + 0x30);
    for (i = 0; i < 5; i++, p += 0x14, id = (struct CardId *)((char *)id + 0x14)) {
        if (*(unsigned short *)(p + 0x38) != 0) continue;
        switch (id->id) { case 0x11f5: return 1; default: break; }
    }
    if (flag == 0) return 0;
    if (*(unsigned int *)(data_ov002_022cf178 + off) >= 7) return 1;
    if (func_ov002_021c3ae4(player, 0x19a3)) return 1;
    {
    struct CardId *id2;
    char *p2;
    p2 = (char *)((unsigned int)data_ov002_022cf16c + off);
    id2 = (struct CardId *)(p2 + 0x94);
    p2 += 0x64;
    for (i = 5; i < 10; i++, id2 = (struct CardId *)((char *)id2 + 0x14), p2 += 0x14) {
        if (id2->id != 0 && *(unsigned short *)(p2 + 0x38) == 0 && (*(unsigned int *)(p2 + 0x40) >> 20 & 1)) count++;
    }
    }
    return count < 2;
}









