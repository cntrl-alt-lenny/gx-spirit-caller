typedef unsigned short u16;
struct S { u16 id; u16 side:1; u16 rest:15; };
struct Player { char pad[12]; unsigned count; char tail[2136]; };
extern char data_ov002_022cf178[];
extern struct Player data_ov002_022cf16c[];
extern int func_ov002_02257ab8(int a, int b);
extern int func_ov002_021bb068(int id);
/* This caller supplies only r0 to the four-argument thunk. */
extern int func_ov002_021ca2b8();
extern int func_ov002_022536e8(int self, int arg1, int arg2);
int func_ov002_0220ad78(struct S *self) {
 unsigned i;
 if (func_ov002_02257ab8((int)self, 1-self->side)==0) return 0;
 if (func_ov002_02257ab8((int)self, self->side)==0) return 0;
 if (func_ov002_021bb068(0x13f2)!=0) return 0;
 if (func_ov002_021ca2b8(self->side)==0) return 0;
 i=0;
 if (i<*(unsigned *)(data_ov002_022cf178+(self->side&1)*0x868)) {
 do {
  if(func_ov002_022536e8(self->side,self->id,i)!=0) return 2;
  i++;
 } while(i<data_ov002_022cf16c[self->side&1].count);
 }
 return 0;
}

