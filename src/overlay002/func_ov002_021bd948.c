struct Card { unsigned id:13; unsigned rest:19; };
struct Entry { struct Card c; char pad[16]; };
struct Player { char pad[48]; struct Entry cards[5]; char tail[2004]; };
struct Flags { unsigned f0:1; unsigned f1:1; unsigned f2:1; unsigned f3:3; unsigned f6:1; unsigned f7:14; unsigned f21:1; unsigned f22:10; };
struct G73c { int pad; int side; };
struct G16c { char pad[0xd80]; int code; };
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1ac[];
extern char data_ov002_022cf1a4[];
extern struct G73c data_ov002_022cd73c;
extern struct G16c data_ov002_022d016c;
extern int func_ov002_021b3ecc(int a, int b, int c);
extern int func_ov002_021b314c(int a, int b, int c);
extern int func_ov002_021b30ac(int a, int b, int c);
extern int func_ov002_021b9ecc(int a, int b);
extern int func_ov002_021bae7c(int player, int id, int except);
extern int func_ov002_021bb068(int a);
extern int func_ov002_021bb264(int a, int b, int c);
extern int func_ov002_021bb9b4(int a, int b);
extern int func_ov002_021bd710(int a, int b);
extern int func_ov002_021c1ad0(int a, int b);
extern int func_ov002_021c1d4c(int a, int b);
extern int func_ov002_021c8940(int a, int b);

int func_ov002_021bd948(int arg0, int arg1) {
    int r4 = arg0 & 1;
    int r5;
    unsigned eo = arg1 * 0x14;
    int po = r4 * 0x868;
    if (!((struct Player *)(data_ov002_022cf16c + po))->cards[arg1].c.id) return 0;
    if ((*(unsigned *)(data_ov002_022cf1ac + po + eo) >> 21) & 1) {
        if (arg0 == data_ov002_022cd73c.side) data_ov002_022d016c.code = 3;
        return 0;
    }
    r4 = func_ov002_021c1ad0(arg0, arg1);
    r5 = func_ov002_021c1d4c(arg0, arg1);
    if (!func_ov002_021b3ecc(arg0, 0xb, 0x12ce)
        && !func_ov002_021b3ecc(arg0, 0xb, 0x131e)
        && !func_ov002_021b3ecc(arg0, arg1, 0x17b3)
        && !func_ov002_021b3ecc(arg0, arg1, 0x1990)
        && !func_ov002_021b314c(arg0, arg1, 0x1103)
        && !func_ov002_021b314c(arg0, arg1, 0x1243)
        && !func_ov002_021b314c(arg0, arg1, 0x14b2)
        && !func_ov002_021b314c(arg0, arg1, 0x1842)
        && !func_ov002_021b30ac(arg0, arg1, 0x1743)) {
        if (func_ov002_021bb068(0x1284) - (func_ov002_021b9ecc(arg0, arg1) == 0x1284) <= 0) {
            if (!(func_ov002_021bb264(0x10ef, arg0, r5) != 0 && *(unsigned short *)(&(data_ov002_022cf1a4 + po)[eo]) != 0 && func_ov002_021c8940(arg0, arg1) == 1)) {
                if (!(func_ov002_021bb264(0x15fb, arg0, r5) != 0 && *(unsigned short *)(&(data_ov002_022cf1a4 + po)[eo]) != 0)) {
                    if (func_ov002_021bd710(arg0, arg1) != 0) {
                        if (arg0 == data_ov002_022cd73c.side) data_ov002_022d016c.code = 0x10;
                        return 0;
                    }
                    {
                        if (!((*(unsigned short *)(&(data_ov002_022cf1a4 + po)[eo]) & ~((*(unsigned *)(&(data_ov002_022cf1ac + po)[eo]) >> 6) & 1)) & ~(((*(unsigned *)(&(data_ov002_022cf1ac + po)[eo]) >> 1) | (*(unsigned *)(&(data_ov002_022cf1ac + po)[eo]) >> 2)) & 1))
                            || !func_ov002_021b3ecc(arg0, arg1, 0x1419)) {
                            if ((r4 & 2) > 0 || (r4 = 1 - arg0, !func_ov002_021bae7c(r4, 0x165e, -1) && !func_ov002_021bb9b4(r4, 0x187c))) return 1;
                        }
                    }
                }
            }
        }
    }
    if (arg0 == data_ov002_022cd73c.side) data_ov002_022d016c.code = 0x12;
    return 0;
}
