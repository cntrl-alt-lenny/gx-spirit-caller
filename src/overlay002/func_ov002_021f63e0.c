typedef struct {
    unsigned short id;
    unsigned short bit : 1;
    unsigned short pad : 5;
    unsigned short tag : 6;
    unsigned short top : 4;
    unsigned short rest[3];
    unsigned short result;
} Self;
typedef struct { char pad[0x5b4]; int state; } Global;
typedef struct { char pad[0xd70]; int slot, index, offset; } Request;
typedef struct { char pad[0x30]; unsigned int value : 13; unsigned int rest : 19; } Entry;
extern Global data_ov002_022ce288;
extern Request data_ov002_022d016c;
extern char data_ov002_022cf16c[];
extern void func_ov002_021ae400(int a, int b);
extern int func_ov002_021decdc(void *arg0, int arg1, int arg2);
extern int func_ov002_022575c8(int a0, int a1, int a2);
extern void func_ov002_0225935c(int arg0, int arg1, int arg2);
extern int func_ov002_022593f4(void);
int func_ov002_021f63e0(Self *p) {
    if (p->tag == 0x23) return 1;
    switch (data_ov002_022ce288.state) {
    case 0:
        func_ov002_021ae400(p->bit, 0x3a);
        func_ov002_0225935c(p->bit, p->id, (int)func_ov002_022575c8);
        data_ov002_022ce288.state++;
        return 0;
    case 1:
        if (func_ov002_022593f4()) {
            int slot = data_ov002_022d016c.slot;
            int index = data_ov002_022d016c.index + data_ov002_022d016c.offset;
            p->result = ((Entry *)(data_ov002_022cf16c + (slot & 1) * 0x868 + index * 0x14))->value;
            func_ov002_021decdc(p, slot, index);
            return 1;
        }
        data_ov002_022ce288.state--;
        return 0;
    default:
        return 1;
    }
}
