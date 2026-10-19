typedef unsigned short u16;
typedef unsigned int u32;
struct Command {
 u16 id;
 u16 side:1; u16 slot:5; u16 pad1:6; u16 mode:2; u16 pad2:2;
 u16 pad3:6; u16 value:9; u16 pad4:1;
 int rest[4];
};
struct Slot { u32 id:13; u32 flag:1; u32 pad:8; u32 value:8; u32 pad2:2; char rest[16]; };
extern char data_ov002_022cf16c[];
extern int func_ov002_021b3618(int player,int idx);
extern int func_ov002_021b9ecc(int player,int idx);
extern int func_ov002_021b34f4(int row_sel,int col_idx,int lo_want,int hi_want);
extern int func_ov002_021e797c(void *self,int player,int idx);
int func_ov002_021b3ac0(int a,int b,int c,int d) {
 int link;
 struct Command cmd;
 int *z;
 struct Slot *p;

 link=func_ov002_021b3618(a,b);
 z=(int *)&cmd;
 z[0]=0; z[1]=0; z[2]=0; z[3]=0; z[4]=0; z[5]=0;
 cmd.id=func_ov002_021b9ecc(a,b);
 cmd.side=(u16)a;
 cmd.slot=(u16)b;
 cmd.mode=0;
 p=&((struct Slot *)(data_ov002_022cf16c+(a&1)*0x868+0x30))[b];
 cmd.value=(u16)(p->flag+(p->value<<1));
 if(link!=0xffff) {
  int kind=func_ov002_021b34f4(link&0xff,(link>>8)&0xff,a,b);
  switch(kind) { case 12: case 13: return 0; }
 }
 return func_ov002_021e797c(&cmd,c,d)==1;
}





