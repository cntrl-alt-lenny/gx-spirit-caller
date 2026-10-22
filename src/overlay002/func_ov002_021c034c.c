extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern char data_ov002_022cf1a8[];
extern char data_ov002_022cf1ac[];
/* The assembly reads r0 from this wrapper, whose current C definition says void. */
extern int func_ov002_021b314c(int arg0, int arg1, int arg2);
extern int func_ov002_021b3ecc(int arg0, int arg1, int arg2);
extern int func_ov002_021b9ecc(int a, int b);
extern int func_ov002_021bbe8c(int arg);
extern int func_ov002_021bc0d4(int side, int x, int y);
extern int func_ov002_021bcf18(int player, int a, int b, int extra);
extern int func_ov002_021bd198(int player);
extern int func_ov002_021bd200(int a);
extern int func_ov002_021bd6c8(int arg0);
extern int func_ov002_021bff50(int a, int b);
extern int func_ov002_021c1d4c(int a, int b);
extern int func_ov002_021c8470(int a, int b);
struct Side { char b[0x868]; };
struct Slot { unsigned int id:13; unsigned int rest:19; char pad[16]; };
int func_ov002_021c034c(int a, int b, int c) {
    int state = func_ov002_021c1d4c(a,b);
    int id;
    if (func_ov002_021bff50(a,b) == 0) return 0;
    if (func_ov002_021b314c(a,b,0x1561) != 0) return 2;
    if (func_ov002_021b314c(a,b,0x1852) != 0) return 2;
    if ((state & 2) <= 0) {
        if (func_ov002_021b3ecc(a,11,0x17fd) != 0) return 2;
    }
    id = func_ov002_021b9ecc(a,b);
    if (id == 0x14fe && c != 0) {
        unsigned int v = *(unsigned int *)(data_ov002_022cf1ac + (a&1)*0x868 + b*20);
        unsigned int h = *(unsigned short *)(data_ov002_022cf1a4 + (a&1)*0x868 + b*20);
        if ((h & ~((v>>6)&1)) & ~(((v>>1)|(v>>2))&1)) return 2;
    }
    if (id == 0x1a79) {
        int off = (a&1)*0x868;
        int idx = b*20;
        unsigned int v = *(unsigned int *)(data_ov002_022cf1ac + off + idx);
        unsigned int h = *(unsigned short *)(data_ov002_022cf1a4 + off + idx);
        if ((h & ~((v>>6)&1)) & ~(((v>>1)|(v>>2))&1)) {
            if (*(int *)(data_ov002_022cf1a8 + off + idx) != 0) return 0;
        }
    }
    if (func_ov002_021b3ecc(a,11,0x15ff) != 0) return 0;
    if (c != 0) {
        unsigned int v = *(unsigned int *)(data_ov002_022cf1ac + (a&1)*0x868 + b*20);
        unsigned int h = *(unsigned short *)(data_ov002_022cf1a4 + (a&1)*0x868 + b*20);
        if ((h & ~((v>>6)&1)) & ~(((v>>1)|(v>>2))&1)) {
            switch (id) {
            case 0x14fe: return 2;
            case 0x1129: case 0x1133: case 0x1134: case 0x114c: case 0x118e:
            case 0x1221: case 0x13b2: case 0x13b3: case 0x1597: case 0x1598:
            case 0x182d: case 0x1a52: case 0x1aaf: return 1;
            case 0x1563: case 0x1564: case 0x1565: case 0x1566:
                if (func_ov002_021bbe8c(a) == 0) break;
            case 0x127d: case 0x127e: case 0x127f: case 0x12a5: case 0x154a:
                if (func_ov002_021bd198(1-a) == 0) return 1;
                break;
            case 0x1295:
                if (func_ov002_021b3ecc(a,b,0x1295) != 0) return 1;
                break;
            case 0x138b:
                if (func_ov002_021bd200(1-a) != 0) return 1;
                break;
            case 0x15ba: {
                int other = 1-a;
                int i;
                int clear = 1;
                struct Slot *s = (struct Slot *)(data_ov002_022cf16c + ((unsigned int)(1-a)%2)*0x868 + 0x94);
                for (i=5; i<=10; i++,s++) {
                    if (s->id != 0) { clear=0; break; }
                }
                if (clear != 0) {
                    int j;
                    int ok;
                    struct Slot *q;
                    char *p = data_ov002_022cf16c + (other&1)*0x868;
                    q = (struct Slot *)(p+0x30);
                    ok=1;
                    for (j=0; j<=4; j++,q++,p+=20) {
                        if (q->id != 0) {
                            if (*(unsigned short *)(p+0x38) == 0 || func_ov002_021c8470(other,j) < 0x640) { ok=0; break; }
                        }
                    }
                    if (ok != 0) return 1;
                }
                break;
            }
            case 0x1705:
                if (func_ov002_021bd6c8(0x10f4) != 0) return 1;
                break;
            case 0x1701: case 0x1747: {
                int i;
                int clear=1;
                struct Slot *s=(struct Slot *)(data_ov002_022cf16c + ((unsigned int)(1-a)%2)*0x868 + 0x94);
                for (i=5; i<=10; i++,s++) {
                    if (s->id != 0) { clear=0; break; }
                }
                if (clear == 0) break;
            }
            case 0x186d:
                if (func_ov002_021bc0d4(1-a,0,1) == 0) return 1;
                break;
            case 0x1a01:
                if (func_ov002_021bcf18(a,0,1,1) != 0) return 1;
                break;
            case 0x1a08: {
                int i;
                struct Slot *s;
                char *p;
                int other=1-a;
                int ok=1;
                p=data_ov002_022cf16c + (other&1)*0x868;
                s=(struct Slot *)(p+0x30);
                for (i=0; i<=4; i++,s++,p+=20) {
                    if (s->id != 0) {
                        if (*(unsigned short *)(p+0x38) == 0 || func_ov002_021c8470(other,i) <= func_ov002_021c8470(a,b)) { ok=0; break; }
                    }
                }
                if (ok != 0) return 1;
                break;
            }
            case 0x1a41: {
                int i;
                int clear=1;
                struct Slot *s=(struct Slot *)(data_ov002_022cf16c + ((unsigned int)(1-a)%2)*0x868 + 0x94);
                for (i=5; i<10; i++,s++) {
                    if (s->id != 0) { clear=0; break; }
                }
                if (clear != 0) return 1;
                break;
            }
            case 0x1af1: {
                char *p=data_ov002_022cf16c + ((1-a)&1)*0x868;
                if (((struct Slot *)(p+(4-b)*20+0x30))->id == 0 && ((struct Slot *)(p+(9-b)*20+0x30))->id == 0) return 1;
                break;
            }
            }
        }
    }
    if (func_ov002_021b3ecc(a,b,0x13ab) != 0) return 1;
    if (func_ov002_021b3ecc(a,b,0x15cf) != 0) return 1;
    if (func_ov002_021b3ecc(a,b,0x169b) != 0) return 1;
    if (func_ov002_021b3ecc(a,b,0x16a3) != 0) return 1;
    if (func_ov002_021b3ecc(a,b,0x17aa) != 0) return 1;
    if (func_ov002_021b3ecc(a,b,0x1893) != 0) return 1;
    if (func_ov002_021b3ecc(a,b,0x1a13) != 0) return 1;
    if (func_ov002_021b314c(a,b,0x1759) != 0) return 1;
    if (func_ov002_021b314c(a,b,0x165d) != 0) return 1;
    return 0;
}








