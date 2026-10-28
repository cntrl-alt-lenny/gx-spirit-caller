typedef unsigned short u16;
struct Node { u16 id; u16 side:1; u16 pad:13; u16 other:1; u16 rest:1; u16 unused[4]; u16 mode; };
extern int func_0202b100(int a0);
extern char *func_0202b7ec(int idx);
extern void func_ov002_0229ce5c(char *dst, const char *fmt, const char *str);
extern void func_ov002_021ae400(int a, int b);
void func_ov002_0223e21c(struct Node *self, int unused1) {
    char buf[256];
    char tmp[256];
    int message;
    switch (self->id) {
    case 0x13e9:
        func_ov002_0229ce5c(buf, (const char *)0x45, (const char *)func_0202b100(0x13ea));
        message = (int)buf;
        break;
    case 0x1298:
        message = self->mode == 2 ? 0x8b : 0x119;
        break;
    case 0x12bb:
        message = 0x44;
        break;
    case 0x140a:
    case 0x148a:
        message = 0xf;
        break;
    case 0x1476:
        message = 0x10;
        break;
    case 0x1485:
    case 0x1487:
    case 0x1503:
    case 0x158d:
    case 0x1913:
        message = 0x57;
        break;
    case 0x1005:
    case 0x16ba:
    case 0x186e:
    case 0x18ba:
    case 0x1b4e:
        message = 0x61;
        break;
    case 0xffa:
    case 0x1086:
    case 0x128e:
    case 0x12e6:
    case 0x16b8:
        message = 0x5f;
        break;
    case 0x101e:
    case 0x128d:
    case 0x139e:
    case 0x142e:
    case 0x152a:
    case 0x15fa:
    case 0x1613:
    case 0x164b:
    case 0x166f:
    case 0x179a:
    case 0x17da:
    case 0x1868:
    case 0x186b:
    case 0x18bb:
    case 0x19f4:
    case 0x1a09:
    case 0x1b1e:
        message = 0x62;
        break;
    case 0x1281:
    case 0x1284:
        message = 0x63;
        break;
    case 0x1103:
    case 0x1243:
    case 0x128a:
    case 0x13eb:
    case 0x14ac:
    case 0x14b2:
    case 0x1581:
    case 0x15d8:
    case 0x15f5:
    case 0x160e:
    case 0x1685:
    case 0x17b0:
    case 0x1863:
    case 0x192b:
    case 0x1953:
    case 0x19b4:
    case 0x19db:
    case 0x1a02:
    case 0x1a0d:
    case 0x1a74:
    case 0x1a90:
    case 0x1a96:
    case 0x1ad6:
    case 0x1ad7:
    case 0x1ad8:
    case 0x1af2:
        message = 0x64;
        break;
    case 0x13e3:
    case 0x1842:
        message = 0x65;
        break;
    case 0x10e6:
        message = 0x66;
        break;
    case 0x117b:
    case 0x12eb:
        message = 0x6b;
        break;
    case 0x119a:
    case 0x119b:
    case 0x12f8:
    case 0x134b:
    case 0x138d:
    case 0x145e:
    case 0x14c5:
    case 0x14cb:
    case 0x14e0:
    case 0x156c:
    case 0x1615:
    case 0x16c0:
    case 0x174d:
    case 0x1773:
    case 0x186a:
    case 0x18be:
    case 0x18c9:
    case 0x19a9:
    case 0x1b3e:
    case 0x1b63:
    case 0x1b64:
        message = 0x6d;
        break;
    case 0x11c3:
    case 0x14e9:
    case 0x1579:
    case 0x1587:
    case 0x171a:
    case 0x1889:
        message = 0x6e;
        break;
    case 0x1280:
    case 0x12a9:
    case 0x1388:
    case 0x148d:
    case 0x14b9:
    case 0x14bb:
    case 0x14eb:
    case 0x1511:
    case 0x1537:
    case 0x157b:
    case 0x15e4:
    case 0x15ff:
    case 0x1763:
    case 0x1844:
    case 0x184b:
    case 0x1909:
    case 0x190e:
    case 0x1945:
    case 0x19f1:
    case 0x1a6d:
    case 0x1afb:
        message = 0x6f;
        break;
    case 0x11ea:
    case 0x158e:
    case 0x18f0:
        message = 0x70;
        break;
    case 0x1227:
        message = 0x76;
        break;
    case 0x12d1:
    case 0x12fc:
    case 0x13ab:
    case 0x17e0:
    case 0x18bf:
    case 0x18c0:
    case 0x18c1:
    case 0x18c2:
    case 0x18c6:
    case 0x1a9c:
    case 0x1b41:
    case 0x1b42:
    case 0x1b43:
        message = 0x77;
        break;
    case 0x12c3:
    case 0x1322:
    case 0x1466:
    case 0x169a:
        message = 0x78;
        break;
    case 0x1253:
        message = 0x7a;
        break;
    case 0x1718:
    case 0x19dd:
        message = 0x7b;
        break;
    case 0x1362:
    case 0x1420:
    case 0x157a:
    case 0x1669:
    case 0x167b:
    case 0x169b:
    case 0x16a2:
    case 0x16e3:
    case 0x175d:
    case 0x179f:
    case 0x17b8:
    case 0x17fc:
    case 0x17ff:
    case 0x1819:
    case 0x1853:
    case 0x188a:
    case 0x1893:
    case 0x18cb:
    case 0x18d3:
    case 0x1957:
    case 0x195b:
    case 0x1978:
    case 0x19ab:
    case 0x19dc:
    case 0x1a0f:
    case 0x1a32:
    case 0x1aa6:
    case 0x1abb:
    case 0x1afd:
    case 0x1b21:
        message = 0x7c;
        break;
    case 0x140c:
    case 0x15b8:
        message = 0x7e;
        break;
    case 0x12e2:
        message = 0x80;
        break;
    case 0x12f1:
    case 0x1329:
    case 0x1492:
    case 0x1690:
    case 0x16ce:
    case 0x1890:
    case 0x18ca:
    case 0x192d:
        message = 0x85;
        break;
    case 0x12f2:
    case 0x132a:
        message = 0x86;
        break;
    case 0x1330:
        message = 0x87;
        break;
    case 0x130a:
        message = 0x88;
        break;
    case 0x1326:
        message = 0x89;
        break;
    case 0x132d:
    case 0x134c:
    case 0x134d:
    case 0x14e1:
    case 0x152b:
    case 0x15d6:
    case 0x15d7:
    case 0x1617:
    case 0x161e:
    case 0x1753:
    case 0x183f:
    case 0x1962:
    case 0x19f3:
    case 0x1a1c:
    case 0x1a9a:
    case 0x1a9e:
    case 0x1afa:
    case 0x1b3f:
    case 0x1b57:
        message = 0x8d;
        break;
    case 0x137c:
    case 0x15b1:
    case 0x15f9:
    case 0x16b2:
    case 0x19a3:
    case 0x19c8:
    case 0x1ab9:
        message = 0x8e;
        break;
    case 0x1363:
        message = 0x8f;
        break;
    case 0x1364:
        message = 0x90;
        break;
    case 0x1475:
        func_ov002_0229ce5c(tmp, (const char *)0x97, (const char *)func_0202b100(0xfbc));
        func_ov002_0229ce5c(buf, tmp, func_0202b7ec(0x13));
        message = (int)buf;
        break;
    case 0x13b0:
        func_ov002_0229ce5c(buf, (const char *)0x98, func_0202b7ec(7));
        message = (int)buf;
        break;
    case 0x14cd:
        func_ov002_0229ce5c(buf, (const char *)0x98, func_0202b7ec(3));
        message = (int)buf;
        break;
    case 0x14ce:
        func_ov002_0229ce5c(buf, (const char *)0x98, func_0202b7ec(1));
        message = (int)buf;
        break;
    case 0x1402:
        func_ov002_0229ce5c(buf, (const char *)0x99, (const char *)func_0202b100(0x13c7));
        message = (int)buf;
        break;
    case 0x143b:
        func_ov002_0229ce5c(buf, (const char *)0x99, (const char *)func_0202b100(0x1439));
        message = (int)buf;
        break;
    case 0x14fc:
        func_ov002_0229ce5c(buf, (const char *)0x127, (const char *)func_0202b100(0x1414));
        message = (int)buf;
        break;
    case 0x17f6:
        func_ov002_0229ce5c(buf, (const char *)0x127, (const char *)func_0202b100(0xff8));
        message = (int)buf;
        break;
    case 0x1412:
        message = 0x9d;
        break;
    case 0x13f0:
        message = 0x9e;
        break;
    case 0x146b:
        message = 0xa3;
        break;
    case 0x147e:
        message = 0xa6;
        break;
    case 0x149b:
        message = 0xa7;
        break;
    case 0x13fe:
        message = 0xa8;
        break;
    case 0x14c3:
    case 0x1514:
    case 0x15a8:
    case 0x15b4:
    case 0x167c:
    case 0x1708:
    case 0x174c:
    case 0x185f:
    case 0x1a1e:
    case 0x1a35:
    case 0x1adf:
    case 0x1aea:
        message = 0x119;
        break;
    case 0x14d3:
    case 0x1538:
    case 0x1694:
    case 0x172a:
    case 0x178e:
        message = 0x11a;
        break;
    case 0x15e9:
    case 0x16c9:
    case 0x16cb:
        message = 0x125;
        break;
    case 0x1925:
        message = 0x95;
        break;
    default:
        message = 0x112;
        break;
    }
    func_ov002_021ae400(self->side ^ self->other, message);
}
