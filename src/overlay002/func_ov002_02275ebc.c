typedef unsigned int u32;
typedef unsigned short u16;
struct State {
 u32 side:1; u32 pad0:5; u32 flags:2; u32 card:15; u32 slot:9;
 u16 unk4; u16 id; unsigned char count; unsigned char pad9[7];
 u16 list[3];
 u16 pad22:1; u16 flag:1; u16 pad23:1; u16 error:1; u16 rest:12;
};
extern struct State data_ov002_022cd300;
extern u16 data_ov002_022cd310[];
extern unsigned int func_0202b878(int id);
extern int func_0202eac8(int id);
extern int func_0202f050(int x);
extern int func_ov002_021bc288(int player,int idx);
extern int func_ov002_021bc6c4(int arg0);
extern int func_ov002_021e358c(int arg0,int arg1);
extern void func_ov002_0227aa80(int a,int b,int c,int d,int e);
extern void func_ov002_0227adcc(int a,int b,int c,int d,int e);
extern void func_ov002_0229ade0(int a,int b,int c,int d);
extern int func_ov002_02271ab4(void);
extern int func_ov002_02272414(void);
extern int func_ov002_022726b4(void);
extern int func_ov002_02272a24(void);
extern int func_ov002_02272b98(void);
extern int func_ov002_02272d30(void);
extern int func_ov002_02272e84(void);
extern int func_ov002_0227309c(void);
extern int func_ov002_02273218(void);
extern int func_ov002_0227332c(void);
/* This caller consumes r0 from the tail call, despite the existing void definition. */
extern int func_ov002_02273500();
extern int func_ov002_0227352c(void);
extern int func_ov002_022737dc(void);
extern int func_ov002_02273ad4(void);
extern int func_ov002_02273b1c(void);
extern int func_ov002_02273b54(void);
extern int func_ov002_02273b94(void);
extern int func_ov002_02273ca4(void);
extern int func_ov002_02273d74(void);
extern int func_ov002_022742dc(void);
extern int func_ov002_02274454(void);
extern int func_ov002_022745f0(void);
extern int func_ov002_02274880(void);
extern int func_ov002_02274bc0(void);
extern int func_ov002_022752b8(void);
extern int func_ov002_02275670(void);
extern int func_ov002_02275c28(void);
int func_ov002_02275ebc(void) {
 int result;
 int i;
 int player;
 int slot;
 switch (data_ov002_022cd300.card) {
 case 0xfde:
 case 0xfdf:
 case 0xfe9:
  result = func_ov002_02272b98(); break;
 case 0x111c:
  result = func_ov002_0227332c(); break;
 case 0x112e:
 case 0x128c:
 case 0x1758:
 case 0x176c:
 case 0x17c2:
 case 0x1894:
 case 0x18b9:
 case 0x18e8:
 case 0x1982:
 case 0x198c:
 case 0x19f0:
 case 0x19f7:
 case 0x19f8:
  result = func_ov002_02272d30(); break;
 case 0x1299:
 case 0x164c:
 case 0x18f6:
 case 0x18f9:
  result = func_ov002_02273ad4(); break;
 case 0x19aa:
  result = func_ov002_02273b1c(); break;
 case 0x138a:
  result = func_ov002_0227352c(); break;
 case 0x13e9:
  result = func_ov002_022737dc(); break;
 case 0x1466:
 case 0x1483:
 case 0x1484:
 case 0x1485:
 case 0x1486:
 case 0x1487:
 case 0x16c5:
 case 0x16c6:
 case 0x16c7:
 case 0x16c8:
 case 0x16c9:
 case 0x16cb:
 case 0x16e4:
 case 0x18b4:
 case 0x19ca:
  result = func_ov002_02273d74(); break;
 case 0x147b:
 case 0x1838:
 case 0x1a20:
  result = func_ov002_022742dc(); break;
 case 0x1864:
 case 0x1a21:
 case 0x1a96:
 case 0x1b2d:
  result = func_ov002_02274454(); break;
 case 0x1578:
  result = func_ov002_022745f0(); break;
 case 0x1a92:
  result = func_ov002_02274880(); break;
 case 0x15b1:
 case 0x15b4:
 case 0x15f9:
 case 0x15fa:
 case 0x1953:
 case 0x1954:
 case 0x1a6d:
 case 0x1a6e:
 case 0x1a6f:
 case 0x1b4c:
 case 0x1b4d:
 case 0x1b4e:
  result = func_ov002_02274bc0(); break;
 case 0x13b5:
 case 0x154b:
  result = func_ov002_022752b8(); break;
 case 0x17c6:
 case 0x19a5:
 case 0x1a65:
  result = func_ov002_02272e84(); break;
 case 0x17c7:
 case 0x17c8:
  result = func_ov002_02273b54(); break;
 case 0x19a6:
  result = func_ov002_0227309c(); break;
 case 0x1895:
  result = func_ov002_02273218(); break;
 case 0x1806:
  result = func_ov002_02273b94(); break;
 case 0x194c:
  result = func_ov002_02273ca4(); break;
 case 0x196b:
 case 0x196c:
 case 0x196d:
 case 0x196e:
  result = func_ov002_02275670(); break;
 case 0x19a3:
 case 0x19a4:
 case 0x19c8:
  result = func_ov002_02275c28(); break;
 case 0x1386:
 case 0x1387:
 case 0x1388:
 case 0x16ec:
 case 0x1725:
 case 0x1729:
 case 0x1905:
 case 0x1985:
 case 0x1986:
 case 0x1b2e:
 case 0x1b2f:
  result = func_ov002_02273500(); break;
 default:
  if (func_0202eac8(data_ov002_022cd300.card)) result=func_ov002_02272414();
  else if (func_0202f050(data_ov002_022cd300.card)) result=func_ov002_022726b4();
  else if (func_0202b878(data_ov002_022cd300.card)==9) result=func_ov002_02272a24();
  else result=func_ov002_02271ab4();
  break;
 }
 if(result<0) {
  data_ov002_022cd300.error=1;
  func_ov002_0229ade0(0x29,0,0,0);
  return 1;
 }
 if(result==1) {
  int special=1;
  if(data_ov002_022cd300.id!=0x1578 && data_ov002_022cd300.id!=0x1a92) special=0;
  player=special ^ data_ov002_022cd300.side;
  slot=func_ov002_021bc6c4(player);
  for(i=0;i<data_ov002_022cd300.count;i++) {
   if(player==(unsigned char)data_ov002_022cd300.list[i] && func_ov002_021bc288(player,(unsigned char)(data_ov002_022cd300.list[i]>>8))) {
    slot=(unsigned char)(data_ov002_022cd310[i]>>8);
    break;
   }
  }
  if(slot<0) func_ov002_0229ade0(0x29,0,0,0);
  else if(data_ov002_022cd300.flag) func_ov002_0227adcc(data_ov002_022cd300.side,data_ov002_022cd300.slot,slot,data_ov002_022cd300.flags,data_ov002_022cd300.count);
  else func_ov002_0227aa80(data_ov002_022cd300.side,data_ov002_022cd300.slot,slot,data_ov002_022cd300.count,data_ov002_022cd300.flags==0);
  if(data_ov002_022cd300.card==0x1488 && data_ov002_022cd300.flag) {
   u32 packed;
   int value=func_ov002_021bc6c4(data_ov002_022cd300.side);
   packed=((data_ov002_022cd300.side<<31) & 0x80000000) | 0x200000 | ((value<<16) & 0x1f0000) | (u16)data_ov002_022cd300.card;
   func_ov002_021e358c(packed,(u16)data_ov002_022cd300.slot);
  }
  return 1;
 }
 return 0;
}
