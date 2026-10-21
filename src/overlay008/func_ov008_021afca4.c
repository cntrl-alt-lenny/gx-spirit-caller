typedef struct {
    unsigned short field0, field2, field4;
    char pad6[0xa4];
    unsigned short field_aa;
    int field_ac;
    char padb0[0x10];
    unsigned short *field_c0;
} Obj;
extern Obj data_ov008_021b2de4;
extern void *func_02005dac(int, int);
extern unsigned int func_02006194(void);
extern unsigned int func_0202b6b4(int id);
extern int func_0202bb20(int a);
extern int func_02037208(int, int, int, int);
extern void func_020944a4(int, int, int);
extern int func_ov008_021aa578(int, int, int, int);
extern void func_ov008_021ab484(int, int, int, int, int, int, int, int);
void func_ov008_021afca4(int a0, int a1, int index) {
    int i;
    int card;
    int x = a0 + 0x19;
    int y = a1 + 4;
    int pos;
    int kind;
    struct { unsigned int attr; unsigned short tile; unsigned short pad; } sprite;

    i = 0;
    do {
        pos = (index % 5) * 5 + i;
        card = data_ov008_021b2de4.field_c0[index * 5 + i];
        if (func_0202bb20(card) == 0) {
            func_ov008_021ab484(x + 7, y - 2, 1, 3, 0, 0x1f2, 0x40, 0);
        }
        sprite.attr = 0x80002000 | (unsigned char)y | (((x + 3) & 0x1ff) << 16);
        sprite.tile = ((pos << 3) + 0x2f3) | 0x1400;
        func_020944a4((int)&sprite, (int)func_02005dac(2, 0), 8);
        kind = (int)func_0202b6b4(card);
        if (kind > 0) {
            switch (kind) {
            case 4: kind = 0; break;
            case 3: kind = 1; break;
            case 1: case 2: kind = 2; break;
            default: kind = 4; break;
            }
            if (kind < 4) func_ov008_021ab484(x + 9, y + 3, 1, kind, 0, 0x1f2, 0x40, 1);
        }
        if (func_02006194() && data_ov008_021b2de4.field_aa == 0 && data_ov008_021b2de4.field_ac == 0) {
            if (func_ov008_021aa578(x + 9, y + 3, x + 0x1d, y + 0x1d)) {
                int old2 = data_ov008_021b2de4.field2;
                int old4 = data_ov008_021b2de4.field4;
                data_ov008_021b2de4.field2 = index - data_ov008_021b2de4.field0;
                data_ov008_021b2de4.field4 = i + 1;
                if (old2 != data_ov008_021b2de4.field2 || old4 != data_ov008_021b2de4.field4)
                    func_02037208(0x38, -1, 0, 1);
            }
        }
        x += 0x1a;

        i++;
    } while (i < 5);
}









