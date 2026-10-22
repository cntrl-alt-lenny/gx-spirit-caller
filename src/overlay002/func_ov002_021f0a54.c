typedef unsigned short u16;
typedef unsigned int u32;
struct Self { u16 id; u16 side:1; u16 slot:5; u16 pad:6; u16 mode:2; u16 top:2; u16 low:6; u16 value:9; u16 high:1; u16 low6:8; u16 f6:8; u16 f8; u16 f10; };
struct Cmd { u16 id; u16 side:1; u16 slot:5; u16 pad:6; u16 mode:2; u16 top:2; u16 low:6; u16 value:9; u16 high:1; int rest[4]; };
struct Slot { u32 id:13; u32 flag:1; u32 pad:8; u32 value:8; u32 high:2; char tail[16]; };
struct Table { char pad[0x30]; struct Slot slots[5]; };
struct Entry { u16 id:13; u16 pad:3; u16 extra; };
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern struct Entry data_ov002_022d0250[];
extern int func_ov002_021c23ac(int player,int index);
extern int func_ov002_021c93cc(int a,int b,int bit);
extern int func_ov002_021ba104(int a,int b,int c);
/* Original supplies only two arguments to the four-parameter thunk. */
extern int func_ov002_021c8940();
extern int func_ov002_021e797c(void *self,int player,int idx);
extern int func_ov002_021b9ecc(int a,int b);
extern unsigned int func_0202b878(int id);
extern int func_0202f2e4(int x);
extern int func_0202f410(int x);
int func_ov002_021f0a54(struct Self *self,int player,int idx) {
 int row,off;
 if(idx>=5) return 0;
 if(self->side!=player) return 0;
 row=(player&1)*0x868;
 off=idx*20;
 if(*(u16 *)(data_ov002_022cf1a4+row+off)==0) return 0;
 switch(self->id) {
 case 0x17e1:
  if(func_ov002_021c23ac(player,idx)==0) return 0;
  { struct Slot *s=(struct Slot *)(data_ov002_022cf16c+row+0x30+off);
    if(s->value*2+s->flag==self->value) return 0; }
  return func_ov002_021c93cc(player,idx,4);
 case 0x180e:
  if(func_ov002_021c23ac(player,idx)==0) return 0;
  return func_ov002_021ba104(player,idx,0x1806);
 case 0x1938:
  if(func_ov002_021c8940(player,idx)!=15) return 0;
  if(self->f8!=0) {
   struct Cmd cmd; int *z=(int *)&cmd;
   z[0]=0; z[1]=0; z[2]=0; z[3]=0; z[4]=0; z[5]=0;
   cmd.side=(u16)player; cmd.slot=11; cmd.id=self->f8;
   cmd.value=self->f10; cmd.mode=0;
   if(func_ov002_021e797c(&cmd,player,idx)!=1) return 0;
  }
  return 1;
 case 0x1979:
  if(self->f6) {
   struct Cmd cmd; int *z=(int *)&cmd;
   z[0]=0; z[1]=0; z[2]=0; z[3]=0; z[4]=0; z[5]=0;
   cmd.side=(u16)player; cmd.slot=11;
   cmd.id=data_ov002_022d0250[self->f10].id;
   cmd.value=self->f10; cmd.mode=0;
   if(func_ov002_021e797c(&cmd,player,idx)!=1) return 0;
  }
  return 1;
 case 0x1a5b:
  if(func_0202b878(((struct Table *)(data_ov002_022cf16c+row))->slots[idx].id)==7) {
   if(func_0202f2e4(func_ov002_021b9ecc(player,idx))!=0) return 1;
  }
  return 0;
 case 0x1a76:
  return func_0202f410(func_ov002_021b9ecc(player,idx));
 }
 return 1;
}





