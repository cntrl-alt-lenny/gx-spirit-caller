typedef unsigned int u32;
typedef unsigned short u16;
struct E { u32 id:13; u32 lo:1; u32 middle:8; u32 hi:8; u32 end:2; };
struct S { char pad[0x10]; u32 count1; u32 count2; char pad2[0x248]; struct E first[110]; struct E second[276]; };
struct D { char pad[0xcec]; int player; };
extern struct D data_ov002_022d016c;
extern char data_ov002_022cf16c[];
extern int func_0202de9c(int unused0);
extern int func_ov002_021b3fd8(int arg0, int arg1, int arg2, int arg3);
extern void func_ov002_021d479c(u16 a0, u16 a1, u16 a2, u16 a3);
extern int func_ov002_021e286c(int arg0);
void func_ov002_021e291c(void) {
    int i;
    int j;
    for(i=0; i<2; i++) {
        u32 n;
        struct E *p;
        int base;
        struct S *s;
        int side = (data_ov002_022d016c.player ^ i) & 1;
        s = (struct S *)(data_ov002_022cf16c + side * 0x868);
        n = 0;
        if (n < s->count2) {
        p = s->second;
        base = side | 0x1c;
        do {
            if (func_0202de9c(p->id) == 3) {
                func_ov002_021d479c(0x3f, (u16)(base | (u16)((p->lo + (p->hi << 1)) << 6)), (u16)(side | 0x58), 0);
            }
        n++; p++;
        } while (n < s->count2);
        }
    }
    for(j=0; j<2; j++) {
        struct E *p;
        int base;
        struct S *s;
        int side;
        u32 n;
        side = data_ov002_022d016c.player ^ j;
        s = (struct S *)(data_ov002_022cf16c + (side & 1) * 0x868);
        n = 0;
        if (n < s->count1) {
        p = s->first;
        base = (side & 1) | 0x1a;
        do {
            if (p->id == 0x12a1 && func_ov002_021b3fd8(side, 11, 0x12a1, p->lo + (p->hi << 1))) {
                func_ov002_021d479c(0x3f, (u16)(base | (u16)((p->lo + (p->hi << 1)) << 6)), (u16)(((1-side) & 1) | 0x5a), 0);
            }
        n++; p++;
        } while (n < s->count1);
        }
    }
    func_ov002_021d479c(0x5b, 0, 0, 0);
    func_ov002_021e286c(data_ov002_022d016c.player);
    func_ov002_021e286c(1-data_ov002_022d016c.player);
}




