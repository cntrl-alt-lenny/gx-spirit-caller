typedef unsigned short u16;
struct Self { u16 id; u16 side:6; u16 kind:6; u16 :4; u16 :2; u16 blocked:1; u16 :13; u16 pad; u16 masks[2]; u16 counts[2]; };
struct State { char pad[0x5a8]; int mode, player, timer; };
struct Global { char pad[0xcec]; int player; };
struct Key { unsigned id:13; unsigned side:1; unsigned :18; };
struct Row { char pad[0x260]; struct Key key; char tail[0x604]; };
extern struct State data_ov002_022ce288;
extern struct Global data_ov002_022d016c;
extern char data_ov002_022cf17c[];
extern struct Row data_ov002_022cf16c[];
extern int data_ov002_022cdc88;
extern unsigned int func_0202b8a8(int id);
extern int func_0202e234(int x);
extern void func_ov002_021b91c4(int *dst,const int *src);
extern int func_ov002_021bc618(int arg0);
extern int func_ov002_021bc6c4(int arg0);
extern int func_ov002_021c988c(int player,int kind,int extra);
/* Original supplies only a; the remaining definition parameters are unused here. */
extern int func_ov002_021ca2b8();
extern int func_ov002_021ca440(int arg0,int arg1);
extern int func_ov002_021d8298(int arg0,struct Key *rec,int arg2);
extern void func_ov002_021d87dc(int arg0);
extern void func_ov002_021d8840(unsigned player,unsigned mask);
extern int func_ov002_021de408(int a,int b);
extern int func_ov002_021dee94(struct Self *,int);
extern int func_ov002_021df708(int arg0,int arg1);
/* Original omits the unused fourth parameter. */
extern int func_ov002_021e13f4();
extern void func_ov002_021e2818(int player);
extern void func_ov002_021e28b4(int arg0);
extern int func_ov002_021e2b1c(int arg0);
/* Original omits the unused parameter. */
extern void func_ov002_021e2b3c();
/* Original omits the unused parameter. */
extern void func_ov002_021e2c5c();
extern int func_ov002_0227adb8(int a,int b,int c,int d);
int func_ov002_02217d5c(struct Self *self) {
 struct Row *row;
 int mode, zero;
 int player, side, id, i;

 if (self->blocked) return 0;

 mode=data_ov002_022ce288.mode;
 switch(mode) {
 case 0x80:
  func_ov002_021de408((int)self,0x1f001f);
  if(self->kind == 0x15) { func_ov002_021dee94(self,0); func_ov002_021dee94(self,1); }
  return 0x7f;
 case 0x7f:

  data_ov002_022ce288.player=data_ov002_022d016c.player;
  data_ov002_022ce288.timer=5;
  self->masks[0]=self->masks[1]=0;
  self->counts[0]=func_ov002_021ca2b8(0);
  self->counts[1]=func_ov002_021ca2b8(1);
  func_ov002_021e2b1c(30); func_ov002_021e2b3c();
  return 0x7e;
 case 0x7e:
  player=data_ov002_022ce288.player;
  if(*(int *)(data_ov002_022cf17c+(player&1)*0x868)) {
   row=&data_ov002_022cf16c[player&1];
   side=row->key.side; id=row->key.id;
   func_ov002_021df708(player,id);
   if(!func_ov002_021c988c(player,13,0)) func_ov002_021e2818(player);
   func_ov002_021d87dc(player);
   if(func_0202e234(id) && (int)func_0202b8a8(id)<5 && func_ov002_021ca440(player,id)) {
    if(func_ov002_021bc618(side)>0 && self->masks[side+2]!=0) {
     func_ov002_021b91c4(&data_ov002_022cdc88,(const int *)&row->key); return 0x7d;
    }
    func_ov002_021e13f4(player,1,0); return 0x7a;
   }
   return 0x7c;
  }
  return 0x7a;
 case 0x7d:
  side=((struct Key *)&data_ov002_022cdc88)->side;
  func_ov002_0227adb8(side,(int)&data_ov002_022cdc88,0,0);
  self->masks[side] |= 1<<func_ov002_021bc6c4(side);
  return 0x7a;
 case 0x7c:
  player=data_ov002_022ce288.player;
  func_ov002_021d8298(player,&data_ov002_022cf16c[player&1].key,0);
  return 0x7a;
 case 0x7a:
  if(--data_ov002_022ce288.timer>0) return 0x7e;
  data_ov002_022ce288.player=1-data_ov002_022ce288.player;
  data_ov002_022ce288.timer=5;
  return data_ov002_022ce288.player!=data_ov002_022d016c.player ? 0x7e:0x78;
 case 0x78:
  for(i=0;i<2;i++) { player=data_ov002_022d016c.player^i; func_ov002_021d8840(player,self->masks[player]); }
  for(i=0;i<2;i++) func_ov002_021e28b4(data_ov002_022d016c.player^i);
  func_ov002_021e2c5c(); return 0;
 default: return 0;
 }
}










