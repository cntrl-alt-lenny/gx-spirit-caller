extern int func_ov002_021baca8(int a0, int a1, int a2);
extern int func_ov002_021b9ecc(int a0, int a1);
extern int func_ov002_021e358c(int arg0, int arg1);
extern int func_ov002_021fd81c(unsigned int packed, unsigned short value, int extra);
extern void func_ov002_0226b094(int arg0, int arg1);
typedef struct { unsigned a:13; unsigned flag:1; unsigned b:8; unsigned id:8; unsigned c:2; } Flags;
typedef struct { Flags flags; char pad[16]; } Entry;
typedef struct { char pad[0x30]; Entry entry[10]; char tail[0x770]; } Bank;
extern Bank data_ov002_022cf16c[];
extern struct State { char pad[0xd28]; unsigned counter; } data_ov002_022d016c;
extern struct Other { char pad[0xb0]; unsigned short flag; } data_ov002_022d0e6c;
int func_ov002_02267a44(int player, int card) {
    if (data_ov002_022d016c.counter == 0) {
        data_ov002_022d016c.counter = 5;
        while (data_ov002_022d016c.counter < 10) {
            unsigned slot = data_ov002_022d016c.counter;
            if (func_ov002_021baca8(player, slot, card)) {
                Flags *f = &data_ov002_022cf16c[player & 1].entry[slot].flags;
                if (func_ov002_021fd81c(((unsigned)(player << 31) & 0x80000000) | 0x4200000 | ((slot << 16) & 0x1f0000) | (unsigned short)card, (unsigned short)(f->id * 2 + f->flag), 0)) {
                    func_ov002_0226b094(player, card);
                    return 0;
                }
            }
            data_ov002_022d016c.counter++;
        }
    } else if (data_ov002_022d0e6c.flag) {
        unsigned slot = data_ov002_022d016c.counter;
        Flags *f = &data_ov002_022cf16c[player & 1].entry[slot].flags;
        int id = func_ov002_021b9ecc(player, slot);
        unsigned packed = ((unsigned)(player << 31) & 0x80000000) | 0x4200000 | ((slot << 16) & 0x1f0000);
        packed |= (unsigned short)id;
        func_ov002_021e358c(packed, (unsigned short)(f->id * 2 + f->flag));
        data_ov002_022d016c.counter = 0;
        return 0;
    }
    return 1;
}


