typedef struct {
    unsigned short id;
    unsigned short side : 1;
    unsigned short rest : 15;
    unsigned short unk4, unk6;
    unsigned short bits, count;
    unsigned short masks[2];
} Entry;
typedef struct {
    unsigned int unused0 : 13;
    unsigned int flag : 1;
    unsigned int unused1 : 8;
    unsigned int value : 8;
    unsigned int unused2 : 2;
    char pad[16];
} Slot;
extern struct { char pad[0x5b4]; int state; } data_ov002_022ce288;
extern struct { char pad[0xd70]; int side, a, b; } data_ov002_022d016c;
extern char data_ov002_022cf16c[];
extern void func_ov002_021ae400(int a, int b);
extern void func_ov002_0225935c(int arg0, int arg1, int arg2);
extern int func_ov002_022593f4(void);
extern unsigned int func_ov002_021c92fc(unsigned int a, unsigned int b);
extern unsigned int func_ov002_021b4618(unsigned int x);
extern int func_ov002_021deb84(int arg0, int arg1);
extern int func_ov002_021fa0ec(void *a, int b, int c);
extern int func_ov002_0229ade0(int a, int b, int c, int d);
int func_ov002_021fa128(Entry *p) {
    int side, index;
    unsigned int bits;
    Slot *slot;
    switch (data_ov002_022ce288.state) {
    case 0:
        p->bits = 0;
        p->count = 0;
        p->masks[1] = 0;
        p->masks[0] = 0;
        func_ov002_021ae400(p->side, 0x12);
        data_ov002_022ce288.state++;
        return 0;
    case 1:
        func_ov002_0225935c(p->side, p->id, (int)func_ov002_021fa0ec);
        data_ov002_022ce288.state++;
        return 0;
    case 2:
        if (func_ov002_022593f4()) {
            side = data_ov002_022d016c.side;
            index = data_ov002_022d016c.a + data_ov002_022d016c.b;
            bits = func_ov002_021c92fc(side, index);
            (&p->bits)[side + 2] |= 1 << index;
            slot = (Slot *)(data_ov002_022cf16c + (side & 1) * 0x868 + 0x30);
            func_ov002_0229ade0(0x28, side, index, slot[index].value * 2 + slot[index].flag);
            if ((int)func_ov002_021b4618(bits) > 1) p->count++;
            else p->bits |= bits;
            if ((int)(p->count + func_ov002_021b4618(p->bits)) >= 4) {
                func_ov002_021deb84(p->side, p->masks[0] | (p->masks[1] << 16));
                return 1;
            }
            data_ov002_022ce288.state--;
            return 0;
        }
        func_ov002_0229ade0(0x29, 0, 0, 0);
        data_ov002_022ce288.state = 0;
        return 0;
    default:
        return 0;
    }
}

