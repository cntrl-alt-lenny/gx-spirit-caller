struct Record {
    unsigned short id;
    unsigned short owner : 1;
    unsigned short pad : 5;
    unsigned short zone : 6;
    unsigned short mode : 2;
    unsigned short toggle : 1;
    unsigned short spare : 1;
    char rest[16];
    unsigned int unused : 9;
    unsigned int other : 1;
    unsigned int tail : 22;
};
extern struct { int pad; int side; } data_ov002_022cd73c;
extern struct { char pad[0xcec]; int side; } data_ov002_022d016c;
extern unsigned int func_0202b878(int id);
extern unsigned int func_0202b8c0(int id);
extern void func_ov002_021b0b54(int id, int value);
extern int func_ov002_021b0c04(void *self, int arg1);

void func_ov002_021b0c54(struct Record *p, int n) {
    int flag;
    unsigned int zone;
    if (data_ov002_022cd73c.side != (p->owner ^ p->toggle)) return;
    if (func_0202b878(p->id) == 0x17) {
        func_ov002_021b0b54(0x3a, 1);
        if (p->mode != 0) return;
        func_ov002_021b0c04((void *)0x21, 1);
        if (func_0202b8c0(p->id) != 1) return;
        flag = 0;
        if (n > 0 && p[-1].owner != p->owner) {
            flag = 1;
        } else {
            if (p->id == 0x12c4) {
                flag = data_ov002_022d016c.side != p->owner;
            }
            zone = p->zone;
            switch (zone) {
            case 0x1f: case 0x20: case 0x21:
                flag = p->other != p->owner;
                break;
            }
        }
        if (flag) func_ov002_021b0c04((void *)0x22, 1);
    } else if (func_0202b878(p->id) == 0x16) {
        func_ov002_021b0b54(0x39, 1);
        if (p->mode != 0) return;
        func_ov002_021b0c04((void *)0x1f, 1);
        if (data_ov002_022d016c.side != (data_ov002_022cd73c.side ^ 1)) return;
        if (func_0202b8c0(p->id) != 5) return;
        func_ov002_021b0c04((void *)0x20, 1);
    }
}



