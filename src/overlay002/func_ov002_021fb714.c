typedef struct {
 unsigned short id;
 unsigned short side:1, index:5, rest:10;
 unsigned short pad4:6, slot:9, rest4:1;
 unsigned short f6, result;
} Self;
typedef struct { char pad[0x5b4]; int state; } State;
typedef struct { unsigned int pad:13, bit:1, pad2:8, id:8, pad3:2; } Entry;
typedef struct { char pad[12]; unsigned int count; char pad2[0x110]; Entry entries[466]; } Player;
typedef struct { char pad[0xd44]; int result; char pad2[0x28]; unsigned int side; int f_d74; unsigned int index; } Result;
extern State data_ov002_022ce288;
extern int data_ov002_022cd744[];
extern Result data_ov002_022d016c;
extern Player data_ov002_022cf16c[];
extern unsigned int data_ov002_022cf178[];
extern int func_ov002_021ff46c(Self *p, int unused1);
extern int func_ov002_0227ddf8(Self *p);
extern int func_ov002_021ae4bc(void *self, int idx);
extern void func_ov002_021df62c(int arg0, int arg1, int idx);
extern int func_ov002_022536e8(void *self, int arg1, int arg2);
extern void func_ov002_021ae400(int a, int b);
extern void func_ov002_02290500(int a, int b, int (*callback)(int,int,int));
extern void func_ov002_022592ec(int arg0);
extern int func_ov002_022593f4(void);
extern int func_ov002_021e278c(int arg0, int arg1);
extern void func_ov002_021e276c(void *self, int a, int b, int c);
extern int func_ov002_022107b4(int a, int b, int c);
int func_ov002_021fb714(Self *p, int arg1) {
 unsigned int i;
 int last, count;
 switch(data_ov002_022ce288.state) {
 case 0:
  if(func_ov002_021ff46c(p,arg1)==0) return -1;
  if(data_ov002_022cd744[p->side]==1) data_ov002_022d016c.result=func_ov002_0227ddf8(p);
  else func_ov002_021ae4bc(250,p->slot);
  data_ov002_022ce288.state++;
  return 0;
 case 1:
  if(data_ov002_022d016c.result==0) return -1;
  func_ov002_021df62c(p->side,p->index,p->slot);
  count=0;
  i=0;
  if(i<*(unsigned int *)((char *)data_ov002_022cf178+(p->side & 1)*0x868)) {
   do {
    if(func_ov002_022536e8(p->side,p->id,i)!=0) { last=i; count++; }
    i++;
   } while(i<data_ov002_022cf16c[p->side & 1].count);
  }
  if(count==0) return -1;
  if(count==1) {
   p->result=data_ov002_022cf16c[p->side & 1].entries[last].bit + data_ov002_022cf16c[p->side & 1].entries[last].id*2;
   data_ov002_022ce288.state=4;
   return 0;
  }
  data_ov002_022ce288.state++;
  return 0;
 case 2:
  func_ov002_021ae400(p->side,0x11e);
  if(data_ov002_022cd744[p->side]==1) func_ov002_02290500(p->side,p->id,func_ov002_022107b4);
  else func_ov002_022592ec((int)func_ov002_022107b4);
  data_ov002_022ce288.state++;
  return 0;
 case 3:
  if(func_ov002_022593f4()!=0) {
   p->result=data_ov002_022cf16c[data_ov002_022d016c.side & 1].entries[data_ov002_022d016c.index].bit + data_ov002_022cf16c[data_ov002_022d016c.side & 1].entries[data_ov002_022d016c.index].id*2;
   data_ov002_022ce288.state++;
   return 0;
  }
  data_ov002_022ce288.state--;
  return 0;
 case 4:
  func_ov002_021e278c(p->side,p->result);
  func_ov002_021e276c(p->side,p->id,5,p->slot);
  return 1;
 }
 return 0;
}

