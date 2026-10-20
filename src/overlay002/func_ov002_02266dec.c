extern int func_ov002_021baca8(int a0, int a1, int a2);
extern int func_ov002_021b9ecc(int a0, int a1);
extern int func_ov002_021e30b4(int arg0, int arg1, int arg2);
typedef struct { char pad[0xd28]; unsigned int index; } State;
extern State data_ov002_022d016c;
extern char data_ov002_022cf16c[];
struct Slot { unsigned int lo:13; unsigned int bit:1; unsigned int mid:8; unsigned int hi:8; unsigned int rest:2; };
int func_ov002_02266dec(int player) {
    unsigned int i;
    i = data_ov002_022d016c.index;
    if (i < 10) {
        do {
            int side = player ^ (i / 5);
            int idx = i % 5;
            if (func_ov002_021baca8(side, idx, 0x1690) != 0) {
                struct Slot *s = (struct Slot *)(data_ov002_022cf16c + (side & 1) * 0x868 + 0x30 + idx * 20);
                int id = func_ov002_021b9ecc(side, idx);
                unsigned sign = side << 31;
                unsigned field = idx << 16;
                unsigned short param = s->hi * 2 + s->bit;
                unsigned packed;
                sign &= 0x80000000;
                sign |= 0x4200000;
                field &= 0x1f0000;
                packed = sign | field;
                packed |= (unsigned short)id;
                func_ov002_021e30b4(packed, param, 0);
                i = data_ov002_022d016c.index;
                data_ov002_022d016c.index = i + 1;
                return 0;
            }
            i = data_ov002_022d016c.index + 1;
            data_ov002_022d016c.index = i;
        } while (i < 10);
    }
    return 1;
}



