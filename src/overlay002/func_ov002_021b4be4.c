typedef unsigned short u16;
typedef unsigned char u8;
struct node {
 u16 kind;
 u16 owner:1; u16 slot:5; u16 category:6; u16 mode:2; u16 rest:2;
 u16 pad4;
 u16 count:8; u16 rest6:8;
 u16 arr8[5]; u16 f18; int f20;
};
struct Card { unsigned id:13; unsigned rest:19; };
struct Entry { unsigned id:13; unsigned rest:19; char pad[16]; };
struct Player { char pad[48]; struct Entry cards[5]; char tail[2004]; };
extern char data_ov002_022cf16c[];
extern int func_ov002_021c8470(int a, int b);
extern u16 func_ov002_0223de94(struct node *arg0, int arg1);
extern int func_ov002_022579a8(void *self);
int func_ov002_021b4be4(struct node *self) {
 int i;
 switch (self->kind) {
 case 0x101e:
 case 0x10f6:
 case 0x10f7:
 case 0x1147:
 case 0x119a:
 case 0x119b:
 case 0x1233:
 case 0x1236:
 case 0x123a:
 case 0x123c:
 case 0x123d:
 case 0x123e:
 case 0x124f:
 case 0x1250:
 case 0x1254:
 case 0x12b1:
 case 0x12d7:
 case 0x12e3:
 case 0x12e4:
 case 0x12e7:
 case 0x12f7:
 case 0x12f8:
 case 0x1304:
 case 0x1305:
 case 0x1317:
 case 0x1331:
 case 0x134b:
 case 0x1363:
 case 0x1386:
 case 0x1387:
 case 0x138d:
 case 0x1398:
 case 0x13fa:
 case 0x1413:
 case 0x142e:
 case 0x1430:
 case 0x1436:
 case 0x143d:
 case 0x1440:
 case 0x145e:
 case 0x1461:
 case 0x1475:
 case 0x147f:
 case 0x14c5:
 case 0x14cb:
 case 0x14e4:
 case 0x14f5:
 case 0x1518:
 case 0x1542:
 case 0x154b:
 case 0x156c:
 case 0x1591:
 case 0x15f3:
 case 0x15fa:
 case 0x1613:
 case 0x161c:
 case 0x164b:
 case 0x1665:
 case 0x166d:
 case 0x166f:
 case 0x1695:
 case 0x16a7:
 case 0x16c0:
 case 0x16d1:
 case 0x16d7:
 case 0x1711:
 case 0x1718:
 case 0x174d:
 case 0x1758:
 case 0x175b:
 case 0x1773:
 case 0x179e:
 case 0x179f:
 case 0x17a8:
 case 0x17db:
 case 0x17ea:
 case 0x17f2:
 case 0x17f9:
 case 0x1868:
 case 0x186a:
 case 0x186b:
 case 0x188a:
 case 0x18be:
 case 0x18c9:
 case 0x18d6:
 case 0x18dc:
 case 0x1906:
 case 0x192e:
 case 0x1945:
 case 0x195e:
 case 0x1970:
 case 0x1977:
 case 0x198b:
 case 0x198c:
 case 0x19a9:
 case 0x19dd:
 case 0x19f4:
 case 0x1a05:
 case 0x1a09:
 case 0x1a0e:
 case 0x1abb:
 case 0x1acc:
 case 0x1af3:
 case 0x1b00:
 case 0x1b06:
 case 0x1b1e:
 case 0x1b28:
 case 0x1b3e:
 case 0x1b45:
 case 0x1b46:
 case 0x1b47:
 case 0x1b48:
 case 0x1b49:
 case 0x1b4a:
 case 0x1b52:
 case 0x1b60:
 case 0x1b63:
 case 0x1b64:
 case 0x1b68:
 return 1;
 case 0x123b:
 case 0x188c:
 for (i=0; i<=4; i++) {
 int player = 1-self->owner;
 char *p = data_ov002_022cf16c + (player & 1)*0x868 + i*0x14;
 if (((struct Card *)(p+0x30))->id && *(u16 *)(p+0x38)) {
 int result=0;
 switch (self->kind) {
 case 0x123b: result=func_ov002_021c8470(player,i)>=0x5dc; break;
 case 0x188c: result=func_ov002_021c8470(player,i)<=0x5dc; break;
 }
 if (result) return 1;
 }
 }
 break;
 case 0x1321:
 case 0x15ef:
 case 0x162d:
 case 0x16cf:
 case 0x1707:
 case 0x17bc:
 case 0x188d:
 case 0x1923:
 case 0x19d5:
 case 0x1aa8:
 return func_ov002_022579a8(self)>0;
 case 0x1388:
 case 0x14c3:
 case 0x15a8:
 case 0x15b4:
 case 0x167c:
 case 0x1708:
 case 0x185f:
 case 0x190a:
 case 0x1969:
 case 0x1a1e:
 case 0x1a35:
 case 0x1aea:
 case 0x1b4c:
 for (i=0; i<self->count; i++) {
 int pair=func_ov002_0223de94(self,i);
 u8 kind=(u16)pair >> 8;
 if (kind<=4) return 1;
 }
 break;
 case 0x14e0:
 return self->arr8[2]==2;
 case 0x1526:
 case 0x17da:
 return self->category!=5;
 case 0x152a:
 case 0x179a:
 case 0x18bb:
 case 0x1a28:
 return self->mode==1;
 case 0x158a:
 case 0x162b:
 case 0x1771:
 case 0x1774:
 return (self-1)->slot<=4;
 case 0x1615:
 return self->mode==3;
 case 0x183e:
 return func_ov002_021b4be4(self-1);
 case 0x1afe:
 {
 int slot=self->slot % 5;
 int player=1-self->owner;
 if (((struct Player *)data_ov002_022cf16c)[player & 1].cards[4-slot].id) return 1;
 }
 break;
 case 0x1517:
 if (self->category!=0x21) {
 if ((self-1)->slot<=4) return 1;
 }
 return 0;
 case 0x15fd:
 case 0x1935:
 case 0x1b3d:
 break;
 }
 return 0;
}


