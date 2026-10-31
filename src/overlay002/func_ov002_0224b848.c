struct Card { unsigned id:13; unsigned side:1; unsigned pad:8; unsigned index:8; unsigned rest:2; };
struct Count { unsigned count; char pad[0x864]; };
extern struct Count data_ov002_022cf17c[];
extern char data_ov002_022cf16c[];
extern int func_0202e234(int x);
extern int func_0202b980(int unused0);
extern unsigned int func_0202b878(int id);
extern int func_ov002_021ca440(int arg0, int arg1);
extern int func_ov002_021b3fd8(int arg0, int arg1, int arg2, int arg3);
extern void func_ov002_02253458(int player, int kind, int idx);
void func_ov002_0224b848(int player, int card) {
 unsigned i=0;
 int p=player & 1;
 int id;
 struct Card *row;
 char *base;
 if (data_ov002_022cf17c[p].count <= i) return;
 base=data_ov002_022cf16c+p*0x868;
 row=(struct Card *)(base+0x260);
 do {
  id=row->id;
  if (func_0202e234(id)!=0 && func_0202b980(id)<=0x7d0 && func_0202b878(id)==func_0202b878(card) && func_ov002_021ca440(player,id)!=0) {
   if (func_ov002_021b3fd8(player,11,0x12a1,row->index*2+row->side)==0)
    func_ov002_02253458(player,13,i);
  }
  i++;
  row++;
 } while (i < *(unsigned *)(base+0x10));
}



