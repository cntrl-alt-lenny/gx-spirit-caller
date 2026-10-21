extern int func_ov002_021bb068(int id);
extern int func_02031838(int x);
extern unsigned int func_0202b890(int id);
extern int func_ov002_021b34f4(int row_sel, int col_idx, int lo_want, int hi_want);
extern int func_ov002_021bc72c(int a0, int a1, int a2);
extern int func_ov002_021bca00(int self, int id, int player, int slot);
extern int func_ov002_021c8470(int a, int b);
extern int func_ov002_021c93cc(int a, int b, int bit);
extern char data_ov002_022cf16c[];
struct Slot { unsigned int id : 13; };

int func_ov002_021bcb10(int self, int id, int check)
{
    int player, slot, i, valid;
    int sum = 0;
    char *own, *p, *row, *q, *r;
    if (func_ov002_021bb068(0x13f2) > 0) return 0;
    own = data_ov002_022cf16c + (self & 1) * 0x868;
    for (player = 0; player < 2; player++) {
        row = data_ov002_022cf16c + (player & 1) * 0x868;
        p = row + 0x30;
        for (slot = 0; slot < 5; slot++, p += 0x14, row += 0x14) {
            unsigned int flags;
            if (((struct Slot *)p)->id == 0) continue;
            flags = *(unsigned int *)(row + 0x40);
            if (((flags >> 1) | (flags >> 2)) & 1) continue;
            if (!func_ov002_021bc72c(self, player, slot)) continue;
            valid = 1;
            switch (id) {
            case 0x164a: case 0x164b: case 0x164c:
            case 0x164d: case 0x164e: case 0x164f:
                if (check) {
                    valid = 0;
                    i = 5;
                    q = own + 0x94;
                    r = own + 0x64;
                    for (; i < 10; q += 0x14, r += 0x14, i++) {
                        if (func_02031838(id) == ((struct Slot *)q)->id && *(unsigned short *)(r + 0x38)) {
                            if (func_ov002_021b34f4(player, slot, self, i) == 0) valid = 1;
                        }
                    }
                }
                break;
            case 0x194c:
                if ((player == self || *(unsigned short *)(row + 0x38)) && func_ov002_021c8470(player, slot) >= 2000) valid = 1;
                else valid = 0;
                break;
            case 0x1a40:
                if ((player == self || *(unsigned short *)(row + 0x38)) && func_ov002_021c93cc(player, slot, func_0202b890(id))) valid = 1;
                else valid = 0;
                break;
            }
            if (valid) sum += func_ov002_021bca00(self, id, player, slot) + 1;
        }
    }
    return sum;
}


