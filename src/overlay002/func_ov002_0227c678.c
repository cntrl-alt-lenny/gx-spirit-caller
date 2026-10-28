extern int func_0202f218(int);
extern int func_ov002_021ba6cc(int,int);
extern int func_ov002_021bae7c(int,int,int);
extern int func_ov002_021bb068(int);
/* Original caller supplies only two arguments to the four-argument thunk. */
extern int func_ov002_021bb90c();
extern int func_ov002_021bb950(int,int);
extern int func_ov002_021bbd14(int,int);
extern int func_ov002_021bbf50(int);
extern int func_ov002_021bc000(int,int (*)(int));
extern int func_ov002_021bc0d4(int,int,int);
extern int func_ov002_021bc16c(int,unsigned short,unsigned short);
extern int func_ov002_021bcf18(int,int,int,int);
extern int func_ov002_021bd308(int);
extern int func_ov002_021bd364(int,int);
extern int func_ov002_021bd6c8(int);
extern int func_ov002_021c2624(int,int,int);
extern int func_ov002_021c2f24(int,int);
extern int func_ov002_021c3ae4(int,int);
extern int func_ov002_022536e8(void *,int,int);
extern int func_ov002_022550b8(int);
extern int func_ov002_02280980(int);
extern int func_ov002_02281920(int,int);
extern int func_ov002_02281994(void *,int);
extern char data_ov002_022cf16c[];
extern char data_ov002_022d016c[];
struct Slot { unsigned int id:13; unsigned int rest:19; char pad[16]; };
int func_ov002_0227c678(int player, int level, int id) {
    switch (id) {
    case 0xfb7: case 0xfb8: case 0xfb9: case 0xfba: case 0xfbb:
        return func_ov002_02281920(player,0x1645) == 0;
    case 0x1386: case 0x1387: case 0x1388: case 0x16ec: case 0x1725:
    case 0x1729: case 0x1985: case 0x1986: case 0x1b2e: case 0x1b2f:
        return 1;
    }
    if (level > 0) {
        switch(id) {
        case 0x10f6: case 0x10f7:
        case 0x1102: case 0x1246: case 0x1281: case 0x12be: case 0x12ea:
        case 0x12ec: case 0x12fc: case 0x12fe: case 0x12ff: case 0x1317:
        case 0x131b: case 0x1322: case 0x1468: case 0x14f0:
            return 1;
        case 0x1331:
            if (func_ov002_02280980(player) > 0) return 1;
            break;
        case 0xfd6: case 0x11e4:
            if (level == 1) return 1;
            break;
        case 0x179a:
            if (*(int *)(data_ov002_022d016c + 0xcf8) == 5) return 1;
            break;
        case 0x1906:
            if (func_ov002_021ba6cc(player,id) == 0 && func_ov002_021bbd14(player,0x1907) != 0) return 1;
            break;
        case 0x1497: case 0x1498: case 0x1499: case 0x149a:
            if (func_ov002_021ba6cc(player,id) == 0 && func_ov002_021c3ae4(player,id) <= 1) return 1;
            break;
        }
    }
    if (level > 1) {
        switch(id) {
        case 0xfe0: return func_ov002_02281994((void *)player,0x12c5) == 0;
        case 0x12bb: case 0x157b: return func_ov002_021bc0d4(1-player,1,0) == 0;
        case 0x11ed: {
            int result = 0; int other = 1-player;
            if (func_ov002_021bae7c(other,0x1102,-1) == 0) {
                int count = func_ov002_021c3ae4(other,0x1102);
                if (count + func_ov002_021c2f24(other,0x1102) > 0) result = 1;
            }
            return result;
        }
        case 0xfce: {
            int result = 0; int other = 1-player;
            if (func_ov002_021bae7c(other,0x10ef,-1) == 0) {
                int count = func_ov002_021c3ae4(other,0x10ef);
                if (count + func_ov002_021c2f24(other,0x10ef) > 0) result = 1;
            }
            return result;
        }
        case 0x1152: return func_ov002_021bd364(player,0x16) == 0;
        case 0x100c: return func_ov002_021bd364(player,0x17) == 0;
        case 0x1086: case 0x10b0: case 0x11f0: return func_ov002_021bd308(1-player) == 0;
        case 0x12a8: case 0x13cd: case 0x1709: case 0x1706:
            if (func_ov002_021bd6c8(0x10f4) == 0) {
                int count = func_ov002_021c3ae4(player,0x10f4);
                if (count + func_ov002_021c2f24(player,0x10f4) > 0) return 1;
            }
            return 0;
        case 0x1129: case 0x1133: case 0x1134: case 0x114c: case 0x118e: case 0x1221:
            return func_ov002_021bb068(0x140e) == 0;
        case 0xfb6: return func_ov002_02280980(player) > 0;
        case 0x147a: return func_ov002_021bb90c(player,0x146f) == 0;
        case 0x14cb: case 0x174d: return func_ov002_021bbf50(1-player) == 0;
        case 0x1505: return func_ov002_021bbf50(1-player) == 1;
        case 0x158b: return func_ov002_021bbd14(player,id) > 0;
        case 0x185f: {
            int result = 0; int other = 1-player;
            if (!func_ov002_021bc16c(other,result,1)) { if (!func_ov002_021bcf18(other,result,1,1)) result = 1; }
            return result;
        }
        case 0x179a: return func_ov002_021c2f24(player,0x179a) > 0;
        case 0x185d: return func_ov002_021bbf50(player) == 0;
        case 0x118a: return func_ov002_02281994((void *)player,0x142a) == 0;
        case 0x1298: {
            int i; int other = 1-player; struct Slot *p = (struct Slot *)(data_ov002_022cf16c + (other & 1)*0x868 + 0x94);
            for (i=5;i<10;i++,p++) {
                if (func_ov002_021c2624(other,i,p->id) != 0) return 0;
            }
            p = (struct Slot *)(data_ov002_022cf16c + (player & 1)*0x868 + 0x94);
            for (i=5;i<10;i++,p++) {
                if (func_ov002_021c2624(player,i,p->id) != 0) return 1;
            }
            break;
        }
        case 0x13a4:
            if (func_ov002_022550b8(player) != 0) return 1;
            break;
        case 0x1807:
            if (func_ov002_021bbd14(player,0x1807) != 0 && (func_ov002_021c3ae4(player,0x180b) != 0 || func_ov002_021c3ae4(player,0x180c) != 0)) return 1;
            break;
        case 0x1918: return func_ov002_021c2f24(player,0x1919) == 0;
        case 0x1526:
            if (func_ov002_021bc0d4(1-player,1,0) < 2 && func_ov002_02280980(player) > 0) return 1;
            return 0;
        case 0x18f7: return func_ov002_021c2f24(player,0x12e5) == 0;
        case 0x1914:
            if (func_ov002_021bb950(0,0x1784) == 0 && func_ov002_021bb950(1,0x1784) == 0) return 1;
            return 0;
        case 0x18f6: return func_ov002_021bbf50(player) > 0;
        case 0x19bc:
            if (func_ov002_021c3ae4(player,0x18f6) == 0 && func_ov002_021bbd14(player,0x18f6) == 0 && func_ov002_02281994((void *)player,0x19b5) == 0 && func_ov002_021bbd14(player,0x1870) == 0) return 1;
            return 0;
        case 0x1a1e: return func_ov002_021bc000(player,func_0202f218) == 0;
        case 0x1aae: case 0x1aaf: case 0x1ab0:
            if (func_ov002_021c3ae4(player,id) <= 1 && func_ov002_022536e8((void *)player,id,0) == 0) return 1;
            break;
        }
    }
    return 0;
}





