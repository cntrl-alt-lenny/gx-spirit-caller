typedef unsigned short u16;
typedef unsigned int u32;
struct Self { u16 id; u16 side:1; u16 rest:15; u16 f4, f6, f8; };
struct State { char pad[0x5a8]; int phase; };
struct Entry { u32 id:13; u32 rest:19; };
struct Row { char pad[0x120]; struct Entry entries[1]; };
extern struct State data_ov002_022ce288;
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf178[];
extern int func_0202df78(int a, int b);
extern void func_ov002_021ae400(int a, int b);
extern int func_ov002_021c3ae4(int arg0, int arg1);
extern void func_ov002_021d7970(void *arg0, int arg1, int arg2);
extern int func_ov002_021e27c0(int self_thing, int arg1);
extern void func_ov002_021e2b3c(int unused0);
/* Original leaves the unused input in r0 from the preceding loop. */
extern void func_ov002_021e2c5c();
extern int func_ov002_02257594(void *arg0, int arg1);
extern void func_ov002_0226af38(int arg0, int arg1, int arg2);
int func_ov002_0222f43c(struct Self *self, int arg1) {
 u32 i;
 int id = self->f8;
 switch(data_ov002_022ce288.phase) {
 case 0x80:
  if(func_ov002_02257594(self,arg1)==0) return 0;
  func_ov002_021e27c0(1-self->side,1);
  if(func_ov002_021c3ae4(1-self->side,(u16)id)==0) return 0x78;
  func_ov002_021ae400(self->side,0x106);
  return 0x7f;
 case 0x7f:
  func_ov002_021e2b3c((int)self);
  i=0;
  if(i<*(u32 *)(data_ov002_022cf178 + ((1-self->side)&1)*0x868)) do {
   if(func_0202df78(((struct Row *)(data_ov002_022cf16c+((1-self->side)&1)*0x868))->entries[i].id,id)!=0)
    func_ov002_021d7970((void *)(1-self->side),i,1);
   i++;
  } while(i<*(u32 *)(data_ov002_022cf16c + ((1-self->side)&1)*0x868 + 0xc));
  func_ov002_021e2c5c();
  return 0x64;
 case 0x78:
  func_ov002_021ae400(self->side,0x11);
  return 0x77;
 case 0x77:
  if(self->id==0x1803) func_ov002_0226af38(self->side,0,1);
  return 0x64;
 case 0x64:
  func_ov002_021e27c0(1-self->side,0);
  return 0;
 }
 return 0;
}


