extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern char data_ov002_022cf1a8[];
extern char data_ov002_022cf1ac[];
extern int func_ov002_021c1d4c(int a, int b);
extern int func_ov002_021b9ecc(int a, int b);
extern int func_ov002_021b3ecc(int arg0, int arg1, int arg2);
extern int func_ov002_021b4120(int arg0, int arg1, int arg2);
extern int func_ov002_021bd198(int player);
struct Slot { unsigned int id:13; unsigned int rest:19; char pad[16]; };
int func_ov002_021bff50(int a, int b) {
    int state = func_ov002_021c1d4c(a,b);
    int off = (a & 1) * 0x868;
    int idx = b * 20;
    unsigned int v = *(unsigned int *)(data_ov002_022cf1ac + off + idx);
    unsigned int h = *(unsigned short *)(data_ov002_022cf1a4 + off + idx);
    if ((h & ~((v >> 6) & 1)) & ~(((v >> 1) | (v >> 2)) & 1)) {
        switch (func_ov002_021b9ecc(a,b)) {
        case 0x147d: return 0;
        case 0x1505: case 0x1644: case 0x1958: case 0x1a4e:
            if ((*(unsigned int *)(data_ov002_022cf1ac + off + idx) >> 22) & 1) return 0;
            if (func_ov002_021b4120(a,b,0x1505) != -1) return 0;
            break;
        case 0x127d: case 0x127e: case 0x127f: case 0x12a5: case 0x154a:
            if (func_ov002_021bd198(1-a) != 0) return 0;
            break;
        case 0x1a79:
            if (*(int *)(data_ov002_022cf1a8 + off + idx) != 0) {
                if (func_ov002_021b4120(a,b,0x1505) == 1) return 0;
            }
            break;
        }
    }
    if (func_ov002_021b3ecc(a,11,0x15ff) != 0) {
        if (func_ov002_021b4120(1-a,11,0x15ff) != -1) return 0;
    }
    if ((state & 2) <= 0) {
        int i;
        struct Slot *s;
        int other = 1-a;
        s = (struct Slot *)(data_ov002_022cf16c + (other & 1)*0x868 + 0x30);
        for (i=0; i<=4; i++,s++) {
            if (s->id != 0) {
                if (func_ov002_021b3ecc(other,i,0x17fc) != 0) return 0;
            }
        }
    }
    if (func_ov002_021b3ecc(a,b,0x1619) != 0) return 0;
    if (func_ov002_021b3ecc(a,b,0x1890) != 0) return 0;
    if (func_ov002_021b3ecc(a,11,0x1669) != 0) return 0;
    return func_ov002_021b3ecc(a,11,0x195b) == 0;
}



