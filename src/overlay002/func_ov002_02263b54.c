typedef struct { unsigned packed; unsigned pad; unsigned short value; char pad2[6]; unsigned flags; } Slot;
typedef struct { char pad[0x30]; Slot slots[5]; char tail[0x7d4]; } Bank;
extern char data_ov002_022cf16c[];
extern int func_ov002_021b9ecc(int player, int slot);
extern void func_ov002_021df62c(int arg0, int arg1, int idx);
extern int func_ov002_021dec2c(int p, int slot, int q, unsigned short v);
int func_ov002_02263b54(int self) {
    int k;
    for (k = 0; k < 2; k++) {
        int player = self ^ k;
        Bank *base = (Bank *)((player & 1) * 0x868 + (int)data_ov002_022cf16c);
        int i;
        
        for (i = 0; i <= 4; i++) {
            int id = func_ov002_021b9ecc(player, i);
            unsigned flags = base->slots[i].flags;
            if ((flags >> 4) & 1) {
                unsigned value = base->slots[i].value;
                value &= ~((flags >> 6) & 1);
                unsigned other = ~(((flags >> 1) | (flags >> 2)) & 1);
                if (!(value & other)) continue;
                if (id != 0x1386 && id != 0x1387 && id != 0x1388) continue;
                {
                    char *p = (char *)base + 0x30;
                    p = p + i * 20;
                    unsigned w = *(unsigned *)p;
                    func_ov002_021df62c(player, i, ((w << 2) >> 24) * 2 + ((w << 18) >> 31));
                    func_ov002_021dec2c(player, i, 0, 0);
                    return 0;
                }
            }
        }
    }
    return 1;
}








