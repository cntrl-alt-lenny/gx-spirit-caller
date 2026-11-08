typedef unsigned int u32;
typedef unsigned short u16;
typedef unsigned char u8;
typedef struct State {
 u32 player:1; u32 p1:4; u32 flag:1; u32 p2:2; u32 id:15; u32 p3:9;
 u16 pad4, current; u8 count; u8 pad9[7]; u16 entries[3]; u16 x:1; u16 special:1; u16 rest:14;
} State;
typedef struct Slot { u32 id:13; u32 player:1; u32 rest:18; u32 pad; u16 active; u8 tail[10]; } Slot;
typedef struct Row { char pad[0x30]; Slot slots[10]; } Row;
extern State data_ov002_022cd300;
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern unsigned int func_0202b878(int id);
extern unsigned int func_0202b890(int id);
extern int func_0202f500(int x);
extern int func_02031838(int x);
extern int func_ov002_021b34f4(int row_sel,int col_idx,int lo_want,int hi_want);
extern int func_ov002_021b9ecc(int player,int idx);
extern int func_ov002_021bc288(int player,int idx);
extern int func_ov002_021bc618(int arg0);
extern int func_ov002_021bc72c(int a0,int a1,int a2);
extern int func_ov002_021bc8c8(int self,int player,int slot);
extern int func_ov002_021c8470(int a,int b);
/* This caller supplies only two arguments to the four-parameter thunk. */
extern int func_ov002_021c8940();
extern int func_ov002_021c93cc(int a,int b,int bit);
int func_ov002_02270184(int player,int index,int offset) {
 int slot=index+offset;
 unsigned int id;
 int count;
 if(slot>4) return 0;
 if(data_ov002_022cd300.special) {
  if(func_ov002_021bc8c8(data_ov002_022cd300.player,player,slot)==0) return 0;
 } else {
  id=data_ov002_022cd300.id;
  switch(id) {
  case 0x164a: case 0x164b: case 0x164c: case 0x164d: case 0x164e: case 0x164f:
   if(data_ov002_022cd300.flag) {
    int found=0;
    int pos;
    for(count=5,pos=100;count<10;count++,pos+=20) {
     int side=data_ov002_022cd300.player;
     char *row;
     row=data_ov002_022cf16c+(side&1)*0x868;
     if(func_02031838(data_ov002_022cd300.id)==((Slot *)(row+pos+0x30))->id && *(u16 *)(pos+(row+0x38))!=0) {
      if(func_ov002_021b34f4(player,slot,side,count)==0) found=1;
     }
    }
    if(!found) return 0;
   }
   break;
  case 0x16ec: case 0x1725: case 0x1729: case 0x1985: case 0x1986: case 0x1b2e: case 0x1b2f:
   if(player!=data_ov002_022cd300.player) return 0;
   {int v=func_ov002_021c8940(player,slot); if(v!=func_0202b878(id)) return 0;}
   break;
  case 0x194c:
   if(player!=data_ov002_022cd300.player) {
    if(*(u16 *)(data_ov002_022cf1a4+(player&1)*0x868+slot*20)==0) return 0;
   }
   if(func_ov002_021c8470(player,slot)<2000) return 0;
   break;
  case 0x1a40:
   if(player!=data_ov002_022cd300.player) {
    if(*(u16 *)(data_ov002_022cf1a4+(player&1)*0x868+slot*20)==0) return 0;
   }
   if(func_ov002_021c93cc(player,slot,func_0202b890(id))==0) return 0;
   break;
  case 0x1a96:
   if(data_ov002_022cd300.current==id) {
    int side=data_ov002_022cd300.player;
    if(player!=side) return 0;
    if(side==((Slot *)(data_ov002_022cf16c+(player&1)*0x868+slot*20+0x30))->player) return 0;
   }
   break;
  case 0x1b2d:
   if(data_ov002_022cd300.current==id) {
    if(player!=data_ov002_022cd300.player) {
     if(*(u16 *)(data_ov002_022cf1a4+(player&1)*0x868+slot*20)==0) return 0;
    }
    if(func_0202f500(func_ov002_021b9ecc(player,slot))==0) return 0;
   }
   break;
  }
  if(func_ov002_021bc72c(data_ov002_022cd300.player,player,slot)==0) return 0;
 }
 {
 count=data_ov002_022cd300.count;
 if(count==0) {
  if(func_ov002_021bc618(data_ov002_022cd300.player)==0) {
   if(player!=data_ov002_022cd300.player || func_ov002_021bc288(player,slot)==0) return 0;
  }
 } else {
  int i;
  for(i=0;i<count;i++) if((u16)((u8)player|((u8)slot<<8))==data_ov002_022cd300.entries[i]) return 0;
 }
 }
 return 0x800;
}


