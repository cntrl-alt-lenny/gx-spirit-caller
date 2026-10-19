typedef unsigned int u32;
typedef struct { u32 id:13; u32 lo:1; u32 mid:8; u32 hi:8; u32 top:2; } Ent;
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf17c[];
extern char data_ov002_022cf184[];
extern int func_0202df78(int a, int b);
extern int func_ov002_021b3fd8(int arg0, int arg1, int arg2, int arg3);
extern void func_ov002_02253458(int a, int b, int c);
void func_ov002_02251484(int a, int b, int c) {
    u32 off = (a & 1) * 0x868;



    u32 i = 0;
    Ent *p;
    char *base;
    if (i < *(u32 *)(data_ov002_022cf17c + off)) {
        base = data_ov002_022cf16c + off;
        p = (Ent *)(base + 0x260);
        do {
            if (func_0202df78(c, p->id) != 0) {
                if (func_ov002_021b3fd8(a, 11, 0x12a1, p->hi * 2 + p->lo) == 0)
                    func_ov002_02253458(a, 13, i);
            }
            i++;
            p++;
        } while (i < *(u32 *)(base + 0x10));
    }
    { Ent *q; char *base2; i = 0;
    if (i < *(u32 *)(data_ov002_022cf184 + off)) {
        base2 = data_ov002_022cf16c + off;
        q = (Ent *)(base2 + 0x3a0);
        do {
            if (func_0202df78(c, q->id) != 0)
                func_ov002_02253458(a, 12, i);
            i++;
            q++;
        } while (i < *(u32 *)(base2 + 0x18));
    }
}
}







