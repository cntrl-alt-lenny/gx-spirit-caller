extern int func_ov002_021c988c(int player, int kind, int index);
extern int func_ov002_021e30b4(int arg0, int arg1, int arg2);
typedef struct { unsigned a:13; unsigned flag:1; unsigned b:6; unsigned f20:1; unsigned f21:1; unsigned id:8; unsigned c:2; } Flags;
typedef struct { char pad[0x1c]; int count; char pad2[0x5b0]; Flags entry[166]; } Bank;
extern Bank data_ov002_022cf16c[];
int func_ov002_02263754(int player) {
    int i;
    for (i = 0; i < 2; i++) {
        int j;
        int id = player ^ i;
        Bank *bank = &data_ov002_022cf16c[id & 1];
        for (j = bank->count - 1; j >= 0; j--) {
            Flags *f = &bank->entry[j];
            if (f->a == 0x16be && f->f21 == 0 && f->f20 == 0 && func_ov002_021c988c(id, 15, j)) {
                unsigned packed = ((unsigned)(id << 31) & 0x80000000) | 0x4f0000 | 0xa000000 | (unsigned short)f->a;
                if (func_ov002_021e30b4(packed, (unsigned short)(f->id * 2 + f->flag), 0))
                    return 0;
            }
        }
    }
    return 1;
}

