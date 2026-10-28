typedef unsigned int u32;
typedef unsigned short u16;
struct Row { u32 prefix[12]; u32 id:13; u32 rest:19; u32 pad; u16 state; u16 pad2; u32 tail[2]; };
struct Bits { u32 id:13; u32 rest:19; };
struct Slot { u16 id:13; u16 rest:3; u16 pad; };
extern char data_ov002_022cf16c[];
extern u16 data_ov002_022cf1a4[];
extern struct Slot data_ov002_022d0254[];
extern unsigned int func_0202b878(int id);
extern unsigned int func_ov002_021b00d0(unsigned int x);
/* Original calls omit the unused third and fourth parameters of the C thunk. */
extern int func_ov002_021c8940();
extern int func_ov002_02280c40(int a, int b, int c, int d, int e);
int func_ov002_02281d78(int player, int id) {
 int result=0;
 int i, opponent, index;
 int card;
 struct Slot *slot;
 struct Bits *ids;
 struct Row *row;
 switch(id) {
 case 0x1357:
  for(i=1, slot=data_ov002_022d0254; i<256; i++) {
   if((i&1)==player) {
    card=slot->id;
    switch(card) {
    case 0x119a:
    case 0x128b:
    case 0x1377:
    case 0x14ce:
    case 0x14de:
    case 0x14df:
    case 0x14e0:
    case 0x14e1:
    case 0x14e2:
    case 0x14e3:
    case 0x14e4:
    case 0x157e:
    case 0x15fc:
    case 0x16ec:
    case 0x1879:
    case 0x1921:
     return 1;
    case 0xff9:
    case 0x10e8:
    case 0x153e:
    case 0x1744:
    case 0x1893:
     return 2;
    case 0x14b5:
    case 0x14b9:
    case 0x14bc:
    case 0x14be:
    case 0x14c1:
    case 0x14c2:
    case 0x14cd:
    case 0x170d:
    case 0x1755:
    case 0x1985:
    case 0x19a5:
     return 3;
    case 0x1756:
    case 0x1835:
    case 0x1950:
     return 4;
    case 0x10eb:
    case 0x113d:
    case 0x12c6:
    case 0x13b0:
    case 0x1409:
    case 0x157a:
    case 0x16ac:
    case 0x1825:
    case 0x184b:
    case 0x18fe:
    case 0x191c:
    case 0x19be:
    case 0x1a07:
    case 0x1a4e:
    case 0x1a51:
    case 0x1a5b:
    case 0x1a7f:
     return 7;
    case 0x10ec:
    case 0x1aa3:
    case 0x1aa6:
     return 9;
    case 0x10d7:
    case 0x10d8:
    case 0x12e0:
    case 0x13a9:
    case 0x13fc:
    case 0x1702:
    case 0x1703:
    case 0x1704:
    case 0x1941:
     return 10;
    case 0x10da:
    case 0x16ce:
    case 0x16f9:
    case 0x16fc:
    case 0x1862:
    case 0x187b:
    case 0x1882:
    case 0x1889:
     return 11;
    case 0x10e5:
    case 0x1729:
     return 12;
    case 0x1091:
    case 0x10dc:
    case 0x13a0:
    case 0x1753:
     return 13;
    case 0x10ee:
     return 14;
    case 0x10d3:
    case 0x1399:
    case 0x13aa:
    case 0x13f6:
    case 0x149f:
    case 0x14c5:
    case 0x14c6:
    case 0x14c9:
    case 0x14ca:
    case 0x14cf:
    case 0x14d3:
    case 0x150c:
    case 0x170e:
    case 0x175d:
    case 0x18fb:
    case 0x1938:
    case 0x193a:
    case 0x1980:
     return 15;
    case 0x10ed:
    case 0x1725:
    case 0x183f:
    case 0x1a35:
     return 16;
    case 0x10de:
    case 0x14ed:
    case 0x175e:
    case 0x1986:
    case 0x1a28:
     return 17;
    case 0x10e9:
    case 0x15ff:
    case 0x1678:
    case 0x16ed:
    case 0x17c6:
    case 0x1818:
    case 0x1819:
    case 0x1984:
     return 18;
    case 0x10e2:
    case 0x1475:
    case 0x1a2f:
     return 19;
    case 0x1715:
     return 20;
    }
   }
  slot++;
  }
  break;
 case 0x1358:
  opponent=1-player;
  index=func_ov002_02280c40(player,opponent,-1,1,0);
  if(index>=0) {
   row=(struct Row *)(data_ov002_022cf16c+(opponent&1)*0x868+index*0x14);
   result=func_0202b878(row->id);
  }
  break;
 case 0x161c:
  opponent=1-player;
  index=func_ov002_02280c40(player,opponent,-1,1,1);
  if(index>=0 && *(u16 *)((char *)data_ov002_022cf1a4+(opponent&1)*0x868+index*0x14)!=0)
   result=func_ov002_021c8940(opponent,index);
  if(result==0) {
   row=(struct Row *)(data_ov002_022cf16c+(opponent&1)*0x868);
   ids=(struct Bits *)((char *)row+0x30);
   for(i=0;i<=4;i++,ids=(struct Bits *)((char *)ids+0x14),row=(struct Row *)((char *)row+0x14)) {
    if(ids->id!=0 && row->state!=0) { result=func_ov002_021c8940(opponent,i); break; }
   }
  }
  if(result==0) {
   struct Bits *ids2;
   struct Row *row2;
   row2=(struct Row *)(data_ov002_022cf16c+(player&1)*0x868);
   ids2=(struct Bits *)((char *)row2+0x30);
   for(i=0;i<=4;i++,ids2=(struct Bits *)((char *)ids2+0x14),row2=(struct Row *)((char *)row2+0x14)) {
    if(ids2->id!=0 && row2->state!=0) { result=func_ov002_021c8940(player,i); break; }
   }
  }
  break;
 }
 if(result==0 || result>20) result=func_ov002_021b00d0(20)+1;
 return result;
}
