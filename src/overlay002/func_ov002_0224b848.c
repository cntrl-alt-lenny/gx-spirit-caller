extern unsigned int func_0202b878(int id);
extern int func_0202b980(int id);
extern int func_0202e234(int x);
extern int func_ov002_021b3fd8(int a,int b,int c,int d);
extern int func_ov002_021ca440(int a,int b);
extern void func_ov002_02253458(int a,int b,int c);
extern char data_ov002_022cf17c[];
extern char data_ov002_022cf16c[];
typedef struct { unsigned id:13; unsigned flag:1; unsigned pad:8; unsigned attr:8; unsigned pad2:2; } Ent;
typedef struct { char pad[0x10]; unsigned count; char pad2[0x24c]; Ent entries[386]; } Side;
void func_ov002_0224b848(int player,int card) {
 int side=player&1;
 unsigned i=0;
 int offset=side*0x868;
 int id;
 Ent *p;
 Side *base;
 if (*(unsigned *)(data_ov002_022cf17c+offset)>i) {
  base=(Side *)data_ov002_022cf16c+side;
  p=base->entries;
  do {
   id=p->id;
   if (func_0202e234(id)!=0 && func_0202b980(id)<=0x7d0 && func_0202b878(id)==func_0202b878(card) && func_ov002_021ca440(player,id)!=0) {
    if (func_ov002_021b3fd8(player,11,0x12a1,p->attr*2+p->flag)==0) {
     func_ov002_02253458(player,13,i);
    }
   }
   i++;
   p++;
  } while(i<base->count);
 }
}

