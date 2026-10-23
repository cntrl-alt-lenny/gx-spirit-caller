extern unsigned int func_0202b878(int);
extern int func_020310d8(int);
extern char data_ov002_022d016c[];
extern char data_ov002_022cf16c[];
extern int func_ov002_021b3ecc(int,int,int);
extern int func_ov002_021b9e00(int,int);
extern int func_ov002_021b9ecc(int,int);
extern int func_ov002_021bae7c(int,int,int);
extern int func_ov002_021bb068(int);
extern int func_ov002_021bb950(int,int);
extern int func_ov002_021bbd14(int,int);
extern int func_ov002_021bbf50(int);
extern int func_ov002_021bc16c(int,unsigned short,unsigned short);
extern int func_ov002_021bc1d0(int,int);
extern int func_ov002_021bc618(int);
extern int func_ov002_021bd45c(int,int);
extern int func_ov002_021bd6c8(int);
extern int func_ov002_021c3a6c(int,int);
extern int func_ov002_021c3ae4(int,int);
extern int func_ov002_022536e8(void *,int,int);
extern int func_ov002_02259f74(int);
extern int func_ov002_0227b8bc(int);
extern int func_ov002_0227d400(int);
extern int func_ov002_02280d18(int,int,int,int,int);
extern int func_ov002_02281994(void *,int);
extern int func_ov002_02281a74(int);
/* The four-argument thunks below receive only two arguments here. */
extern int func_ov002_021bb90c();
extern int func_ov002_021bbc58();
int func_ov002_0227b9b8(int player, int id, int flag, int other) {
    int temp;
    int i;
    if (*(int *)(data_ov002_022d016c + 0xcf8) == 3) {
        if (func_ov002_021b3ecc(player, 11, 0x1669) != 0) return 1;
    }
    if (func_ov002_021bb068(0x135d) > 0) flag = 1;
    switch (id) {
    case 0xfe0:
        if (flag != 0 && func_ov002_021bc618(player) >= 2 && func_ov002_021bbd14(player, 0x12c5) != 0) return 0;
        break;
    case 0x119a:
    case 0x128a:
    case 0x128e:
    case 0x1293:
    case 0x1334:
    case 0x1341:
    case 0x14c6:
    case 0x1617:
    case 0x170c:
    case 0x1918:
    case 0x19c6:
        if (other == 0 && flag == 0) return 0;
        break;
    case 0xfb6:
    case 0x101e:
    case 0x11a6:
    case 0x139c:
    case 0x13ad:
    case 0x144d:
    case 0x148c:
    case 0x14cb:
    case 0x156b:
    case 0x158b:
    case 0x15da:
    case 0x172e:
    case 0x1807:
    case 0x180b:
    case 0x180c:
    case 0x183a:
    case 0x1868:
    case 0x19bc:
    case 0x1a1e:
    case 0x1a80:
        if (flag == 0) return 0;
        break;
    case 0x1ae0:
    case 0x1ae2:
    case 0x1ae3:
    case 0x1ae4:
    case 0x1ae5:
    case 0x1ae6:
    case 0x1ae7:
        if (flag == 0 && *(int *)(data_ov002_022cf16c + (player & 1) * 0x868) >= 3000) return 0;
        break;
    case 0x1aae:
    case 0x1aaf:
    case 0x1ab0:
        if (other == 0 && flag == 0 && func_ov002_022536e8((void *)player, id, 0) != 0) return 0;
        break;
    case 0x1ab1:
        if (func_ov002_022536e8((void *)player, id, 0) != 0) return 0;
        break;
    case 0x12bb:
        if (flag == 0 && func_ov002_021bc1d0(1 - player, 1) != 0) return 0;
        break;
    case 0x1694:
        if (flag == 0) { temp = func_ov002_021bbf50(0); return temp + func_ov002_021bbf50(1) > 0; }
        break;
    case 0x1281:
    case 0x1284:
        if (func_ov002_021bbf50(1 - player) != 0) return 0;
        break;
    case 0x12a8:
    case 0x13cd:
    case 0x1706:
    case 0x1709:
        if (flag == 0 && func_ov002_021bd6c8(0x10f4) != 0) return 0;
        break;
    case 0x13a7:
        if (*(int *)(data_ov002_022cf16c + (player & 1) * 0x868) > 2000) return 0;
        break;
    case 0x14d7:
        if (func_ov002_021c3a6c(player, 1) > 1) return 0;
        break;
    case 0x147a:
        if (func_ov002_021bb90c(player, 0x146f) == 0) return 1;
        break;
    case 0x118a:
        if (func_ov002_02281994((void *)player, 0x142a) != 0) return 0;
        break;
    case 0x14ac:
        if (other == 0 && func_ov002_021bbf50(1 - player) != 0) return 0;
        break;
    case 0x1612:
        for (i = 0; i < 10; i++) { temp = func_020310d8(func_ov002_021b9ecc(player, i)); if (temp != 0 && func_ov002_021b9e00(player, i) < temp) return 0; }
        break;
    case 0x161c:
        if (flag == 0 && func_ov002_02281a74(player) != 0) return 0;
        break;
    case 0x1399:
        if (flag == 0) { temp = func_ov002_021bbf50(player); if (temp >= func_ov002_021bbf50(1 - player)) return 0; }
        break;
    case 0x1744:
    case 0x1755:
    case 0x1756:
    case 0x1863:
        if (flag == 0) { temp = func_ov002_021bbc58(player, func_0202b878(id)); if (temp >= func_ov002_021bbf50(1 - player)) return 0; }
        break;
    case 0x17dd:
        if (flag == 0 && func_ov002_021c3ae4(player, 0xff8) != 0) return 0;
        break;
    case 0x1836:
        if (flag == 0 && *(int *)(data_ov002_022cf16c + (player & 1) * 0x868) >= 4000) return 0;
        break;
    case 0x1523:
        if (flag == 0) { temp = func_ov002_02280d18(player, 1 - player, -1, 1, 0); if (temp <= 1100 || temp >= 1900) return 0; }
        break;
    case 0x189a:
        if (flag == 0 && func_ov002_021c3ae4(player, 0xfa7) != 0) return 0;
        break;
    case 0x1821:
        if (flag == 0 && func_ov002_021c3ae4(player, 0x1820) != 0) return 0;
        break;
    case 0x185d:
        if (flag == 0 && func_ov002_021bbf50(player) != 0) return 0;
        break;
    case 0x18b6:
        if (flag == 0 && func_ov002_021bc16c(player, 0, 1) != 0) return 0;
        break;
    case 0x16bc:
        if (flag == 0 && func_ov002_021bd45c(player, 3) != 0) return 1;
        break;
    case 0x17de:
        if (flag == 0 && func_ov002_02281994((void *)player, 0x12dc) != 0) return 0;
        break;
    case 0x1813:
    case 0x1815:
    case 0x195a:
        return 1;
        break;
    case 0x129a:
    case 0x1439:
    case 0x1621:
    case 0x1639:
    case 0x1743:
    case 0x1829:
    case 0x18c3:
    case 0x1a07:
        return 0;
        break;
    case 0x191c:
        if (func_ov002_021bbc58(player, 7) != 0) return 0; if (func_ov002_021bae7c(player, 0x1357, -1) != 0 && func_ov002_02281994((void *)player, 0x198e) != 0) return 0;
        break;
    case 0x182d:
        if (func_ov002_021bb068(0x140e) != 0 || func_ov002_021bb068(0x17a6) != 0) return 0;
        break;
    case 0x1914:
        if (flag == 0) { if (func_ov002_021bb950(0, 0x1784) == 0 && func_ov002_021bb950(1, 0x1784) == 0) return 1; return 0; }
        break;
    case 0x16bf:
        if (flag != 0) return 0;
        break;
    }
    if (func_ov002_02259f74(player) != 0 && func_ov002_02281994((void *)player, 0x142a) != 0 && func_ov002_0227d400(id) != 0) return 0;
    if (flag == 0 && func_ov002_0227b8bc(id) != 0) return 1;
    return -1;
}
