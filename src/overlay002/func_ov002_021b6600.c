typedef unsigned short u16;
struct node {
 u16 kind;
 u16 owner:1; u16 zone:5; u16 type:6; u16 mode:2; u16 rest:2;
 u16 pad4; u16 count;
 u16 arr8[5]; u16 f18;
 int value;
};
extern int func_ov002_021bae7c(int player, int id, int except);
extern unsigned int func_0202b878(int id);
extern int func_ov002_021b4120(int arg0, int arg1, int arg2);
extern u16 func_ov002_0223de94(struct node *arg0, int arg1);
extern void func_ov002_0220eb00(struct node *self, int *values);
extern char data_ov002_022d016c[];
int func_ov002_021b6600(struct node *self)
{
 int flags = 0;

 int result;
 int a, b, v, owner;
 if (func_ov002_021bae7c(self->owner, 0x1256, -1)) flags |= 2;
 if (func_ov002_021bae7c(1 - self->owner, 0x1256, -1)) flags |= 1;
 switch (self->kind) {
 case 0xfff:
 case 0x10b0:
 case 0x10fd:
 case 0x10fe:
 case 0x10ff:
 case 0x1100:
 case 0x1190:
 case 0x11a6:
 case 0x11bc:
 case 0x129a:
 case 0x12e9:
 case 0x1301:
 case 0x1307:
 case 0x1339:
 case 0x1355:
 case 0x135a:
 case 0x135c:
 case 0x13a8:
 case 0x1404:
 case 0x1435:
 case 0x144b:
 case 0x144e:
 case 0x144f:
 case 0x1460:
 case 0x1491:
 case 0x14aa:
 case 0x14f5:
 case 0x1520:
 case 0x1525:
 case 0x1565:
 case 0x1586:
 case 0x158c:
 case 0x15f4:
 case 0x161d:
 case 0x1627:
 case 0x1637:
 case 0x1641:
 case 0x16c5:
 case 0x16d7:
 case 0x16dc:
 case 0x16e4:
 case 0x1702:
 case 0x173f:
 case 0x174a:
 case 0x174b:
 case 0x1756:
 case 0x1767:
 case 0x1770:
 case 0x1794:
 case 0x179b:
 case 0x17c7:
 case 0x17c8:
 case 0x17e1:
 case 0x17f6:
 case 0x1804:
 case 0x1855:
 case 0x188b:
 case 0x18b6:
 case 0x18b7:
 case 0x18c8:
 case 0x18d6:
 case 0x18da:
 case 0x18dc:
 case 0x1906:
 case 0x191d:
 case 0x1926:
 case 0x1929:
 case 0x192c:
 case 0x193b:
 case 0x1943:
 case 0x194a:
 case 0x198b:
 case 0x19a4:
 case 0x19bb:
 case 0x19ce:
 case 0x19cf:
 case 0x19de:
 case 0x19f0:
 case 0x1a0d:
 case 0x1a0e:
 case 0x1aa0:
 case 0x1abb:
 case 0x1acc:
 case 0x1ae0:
 case 0x1af7:
 case 0x1af8:
 case 0x1b03:
 case 0x1b1e:
 case 0x1b2d:
 case 0x1b4f:
 case 0x1b5d:
 case 0x1b7f:
 return 2;
 case 0x10dd:
 case 0x14b2:
 case 0x1574:
 case 0x15ee:
 case 0x16cc:
 case 0x172f:
 case 0x1762:
 case 0x187b:
 case 0x18d0:
 case 0x18d1:
 case 0x19b0:
 case 0x1a51:
 case 0x1a69:
 case 0x1aba:
 if (self->mode != 0) return 2;
 break;
 case 0x1984:
 if (self->mode == 0) return 2;
 break;
 case 0x16fa:
 if (self->mode == 1) return 2;
 break;
 case 0x11cf:
 case 0x1282:
 if (self->type == 2) return 2;
 break;
 case 0x1421:
 if (self->arr8[0] != 0) return 2;
 break;
 case 0x19d3:
 case 0x1ab0:
 case 0x1b51:
 if (self->type == 22) return 2;
 break;
 case 0x14e0:
 if (self->arr8[2] == 1) return 2;
 break;
 case 0x190a:
 if (self->mode != 2 && func_0202b878(self->value) == 22) return 2;
 break;
 case 0x118a:
 case 0x1578:
 return 1;
 case 0x12a1:
 if (self->mode != 1) return 1;
 break;
 case 0x169a:
 if (self->mode == 1) return 1;
 break;
 case 0x1101:
 case 0x138d:
 case 0x1718:
 case 0x1950:
 case 0x195e:
 case 0x1a40:
 case 0x1b19:
 return 3;
 case 0x15a0:
 if (self->mode != 0) return 3;
 break;
 case 0x12dc:
 return self->owner != *(int *)(data_ov002_022d016c + 0xcec) ? 1 : 2;
 case 0x14e1:
 return (unsigned char)func_ov002_0223de94(self, 0) == self->owner ? 1 : 2;
 case 0x16de:
 v = func_ov002_021b4120(self->owner, self->zone, self->kind);
 if (v == self->owner) return 1;
 if (self->owner == 1 - v) return 2;
 break;
 case 0x10f8:
 case 0x13f0:
 case 0x13f3:
 case 0x141f:
 case 0x15e7:
 case 0x163f:
 case 0x1666:
 case 0x16fe:
 case 0x174e:
 case 0x1761:
 case 0x1802:
 case 0x1869:
 case 0x18d7:
 case 0x1914:
 case 0x1aad:
 {
 int values[2];
 result = 0;
 func_ov002_0220eb00(self, values);
 owner = self->owner;
 a = values[owner];
 if (a < 0) result |= 1;
 b = values[1 - owner];
 if (b < 0) result |= 2;
 if (a > 0) result |= flags & 1;
 if (b > 0) result |= flags & 2;
 return result;
 }
 case 0x104c:
 case 0x10f9:
 case 0x10fa:
 case 0x10fb:
 case 0x10fc:
 case 0x12a2:
 case 0x12e8:
 case 0x133a:
 case 0x1352:
 case 0x137a:
 case 0x1380:
 case 0x138f:
 case 0x1450:
 case 0x1451:
 case 0x1454:
 case 0x1455:
 case 0x1459:
 case 0x14e6:
 case 0x14f3:
 case 0x151b:
 case 0x1635:
 case 0x1665:
 case 0x16a0:
 case 0x170b:
 case 0x170f:
 case 0x1757:
 case 0x175a:
 case 0x176a:
 case 0x1792:
 case 0x1793:
 case 0x1987:
 case 0x19cd:
 case 0x19e0:
 case 0x1a14:
 case 0x1a23:
 case 0x1a71:
 case 0x1aa2:
 case 0x1b02:
 return flags & 1;
 case 0x1174:
 if (self->mode == 1) return flags & 1;
 break;
 case 0x1370:
 if (self->type == 2) return flags & 1;
 break;
 case 0x137b:
 case 0x1405:
 case 0x142c:
 case 0x1467:
 case 0x14c0:
 case 0x14ed:
 case 0x16da:
 case 0x17a4:
 case 0x17a5:
 if (self->mode != 0) return flags & 1;
 break;
 case 0x1506:
 if (self->type != 5) return flags & 1;
 break;
 case 0x11c9:
 case 0x131f:
 case 0x166f:
 case 0x16f5:
 return flags & 2;
 case 0x1322:
 if (self->mode != 0) return flags & 2;
 break;
 case 0x1877:
 if (self->type == 2) return flags & 2;
 break;
 case 0x1b18:
 return flags;
 case 0x143e:
 return self->mode == 0 ? flags & 3 : 2;
 case 0x199e:
 case 0x1b14:
 case 0x1b15:
 break;
 }
 return 0;
}
