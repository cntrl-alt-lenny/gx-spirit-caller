typedef unsigned short u16;
typedef unsigned char u8;
struct node {
 u16 kind;
 u16 owner:1; u16 zone:5; u16 type:6; u16 mode:2; u16 rest:2;
 u16 pad4;
 u16 count:8; u16 rest6:8;
 u16 arr8[5]; u16 f18;
};
struct slot { u16 owner:1; u16 zone:5; u16 rest:10; };
struct entry { unsigned value:13; unsigned rest:19; char pad[16]; };
struct player { char pad[0x30]; struct entry entries[10]; char tail[0x770]; };
extern struct player data_ov002_022cf16c[];
extern u16 func_ov002_0223de94(struct node *arg0, int arg1);
extern int func_ov002_021bcf00(int a);
extern int func_ov002_02257a44(int a);
int func_ov002_021b59b0(struct node *self) {
 int i;
 int pair;
 int type;
 switch(self->kind) {
 case 0x12fe:
 case 0x12ff:
 case 0x140d:
 case 0x1470:
 case 0x148c:
 case 0x148f:
 case 0x14c7:
 case 0x153e:
 case 0x1541:
 case 0x158a:
 case 0x15f1:
 case 0x15fc:
 case 0x1634:
 case 0x16a6:
 case 0x16dd:
 case 0x1721:
 case 0x176b:
 case 0x1774:
 case 0x17c6:
 case 0x17d4:
 case 0x183a:
 case 0x18dd:
 case 0x18de:
 case 0x1960:
 case 0x1a24:
 case 0x1a25:
 return 1;
 case 0xffa:
 case 0x1086:
 case 0x117b:
 case 0x11f0:
 case 0x128e:
 case 0x12e6:
 case 0x12eb:
 case 0x132d:
 case 0x134c:
 case 0x134d:
 case 0x1364:
 case 0x137c:
 case 0x14e1:
 case 0x152b:
 case 0x15b1:
 case 0x15d6:
 case 0x15d7:
 case 0x15f9:
 case 0x1617:
 case 0x161e:
 case 0x16b2:
 case 0x16b8:
 case 0x1753:
 case 0x17e2:
 case 0x185f:
 case 0x1962:
 case 0x19a3:
 case 0x19c8:
 case 0x19f3:
 case 0x1a9a:
 case 0x1ab9:
 case 0x1afa:
 case 0x1b36:
 case 0x1b37:
 case 0x1b3f:
 case 0x1b57:
 return 1;
 case 0x14c3:
 case 0x1514:
 case 0x15a8:
 case 0x15b4:
 case 0x167c:
 case 0x1708:
 case 0x174c:
 case 0x190a:
 case 0x1969:
 case 0x1970:
 case 0x1a1e:
 case 0x1adf:
 case 0x1aea:
 case 0x1b4c:
 pair = func_ov002_0223de94(self, 0);
 if ((u8)((u16)pair >> 8) >= 5) return 2;
 break;
 case 0xfce:
 case 0x11ed:
 case 0x1246:
 case 0x131b:
 case 0x131c:
 case 0x13b5:
 case 0x13c3:
 case 0x1406:
 case 0x14aa:
 case 0x14df:
 case 0x1575:
 case 0x1633:
 case 0x16c7:
 case 0x170f:
 case 0x17a9:
 case 0x17b8:
 case 0x1848:
 case 0x1851:
 case 0x185c:
 case 0x18e0:
 case 0x18f8:
 case 0x19b0:
 case 0x1a0a:
 case 0x1a11:
 case 0x1aff:
 return 4;
 case 0x1321:
 case 0x15ef:
 case 0x162d:
 case 0x16cf:
 case 0x1707:
 case 0x17a8:
 case 0x17bc:
 case 0x188d:
 case 0x1923:
 case 0x19d5:
 case 0x1aa8:
 if (func_ov002_02257a44((int)self)) return 6;
 break;
 case 0x1a35:
 for (i = 0; i < self->count; i++) {
 pair = func_ov002_0223de94(self, i);
 if ((u8)((u16)pair >> 8) >= 5) return 6;
 }
 break;
 case 0x1298:
 case 0x1a80:
 if (self->arr8[2] == 1) return 1;
 break;
 case 0x12fd:
 case 0x1517:
 type = self->type;
 switch (type) {
 case 31: case 32: case 33: return 0;
 default: return 1;
 }
 case 0x14de:
 return self->arr8[0] == 1;
 case 0x162b:
 return ((struct slot *)self)[-11].zone >= 5 && ((struct slot *)self)[-11].zone <= 10;
 case 0x1a28:
 if (self->mode != 1) return 0;
 if (func_ov002_021bcf00(1 - self->owner)) return 6;
 break;
 case 0x1a9f:
 if (self->mode == 1) return 1;
 break;
 case 0x1afe:
 if (data_ov002_022cf16c[(1 - self->owner) & 1].entries[9 - self->zone % 5].value) return 1;
 break;
 case 0x1b3d: break;
 }
 return 0;
}
