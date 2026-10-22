typedef unsigned short u16;
typedef struct {
 u16 f0;
 u16 side:1; u16 rest2:15;
 u16 pad4:2; u16 blocked:1; u16 rest4:13;
 u16 low6:8; u16 count:8;
 u16 slots[3];
} State;
typedef struct { unsigned int id:13; unsigned int low:1; unsigned int pad:8; unsigned int high:8; unsigned int rest:2; } Card;
typedef struct { char pad[0x5a8]; int phase; int selected; } Global;
typedef struct { char pad[0xd78]; int result; } Command;
typedef struct { char pad[0xb0]; u16 id; } Selection;
extern Global data_ov002_022ce288;
extern char data_ov002_022cf16c[];
extern Command data_ov002_022d016c;
extern Selection data_ov002_022d0e6c;
extern int func_0202b100(int a0);
extern int func_0202e234(int x);
extern void func_ov002_021ae400(int a,int b);
extern void func_ov002_021ae430(int a,const char *src);
extern unsigned int func_ov002_021b00d0(unsigned int x);
extern int func_ov002_021b9b64(int unused0);
extern void func_ov002_021d7c1c(void *a,void *b,void *c);
extern int func_ov002_021d87a4(int arg0,int arg1,int arg2);
extern int func_ov002_022028c8(State *p,int unused1);
extern int func_ov002_0221beac(int side,int kind,int slot);
extern void func_ov002_022592ec(int arg0);
extern void func_ov002_02259324(int arg0);
extern int func_ov002_022593f4(void);
extern void func_ov002_0226b1b4(int arg0,int arg1,const u16 *arg2,int arg3);
extern int func_ov002_0227adb8(int a,int b,int c,int d);
extern void func_ov002_0229cf10(char *dst,const char *fmt,int val);
int func_ov002_0221bfb0(State *self,int arg1) {
 char buf[0x100];
 int i,idx;
 u16 temp;
 Card *card;
 if(self->blocked) return 0;
 switch(data_ov002_022ce288.phase) {
 case 0x80:
  if(!func_ov002_022028c8(self,arg1)) return 0;
  self->count=0;
  func_ov002_021ae400(self->side,0x49);
  func_ov002_022592ec((int)func_ov002_0221beac);
  return 0x7f;
 case 0x7f:
  if(!func_ov002_022593f4()) return 0x80;
  idx=data_ov002_022d016c.result;
  card=(Card *)(data_ov002_022cf16c+(self->side&1)*0x868+0x120);
  func_ov002_021d87a4(self->side,11,card[idx].high*2+card[idx].low);
  self->slots[self->count]=idx;
  self->count++;
  return 0x7e;
 case 0x7e:
  func_ov002_0229cf10(buf,(const char *)0x4b,2);
  func_ov002_021ae400(self->side,(int)buf);
  func_ov002_022592ec((int)func_ov002_0221beac);
  return 0x7d;
 case 0x7d:
  if(!func_ov002_022593f4()) return 0x7e;
  idx=data_ov002_022d016c.result;
  card=(Card *)(data_ov002_022cf16c+(self->side&1)*0x868+0x120);
  func_ov002_021d87a4(self->side,11,card[idx].high*2+card[idx].low);
  self->slots[self->count]=idx;
  self->count++;
  return 0x7c;
 case 0x7c:
  func_ov002_02259324((int)func_ov002_0221beac);
  return 0x7b;
 case 0x7b:
  if(!func_ov002_022593f4()) return 0x7c;
  idx=data_ov002_022d016c.result;
  card=(Card *)(data_ov002_022cf16c+(self->side&1)*0x868+0x120);
  func_ov002_021d87a4(self->side,11,card[idx].high*2+card[idx].low);
  self->slots[self->count]=idx;
  self->count++;
  return 0x7a;
 case 0x7a:
  for(i=2;i>0;i--) {
   idx=func_ov002_021b00d0(i+1);
   temp=self->slots[idx];
   self->slots[idx]=self->slots[i];
   self->slots[i]=temp;
  }
  func_ov002_0226b1b4(1-self->side,self->f0,self->slots,3);
  return 0x79;
 case 0x79:
  card=(Card *)(data_ov002_022cf16c+(self->side&1)*0x868);
  for(i=0;i<3;i++) {
   if(data_ov002_022d0e6c.id==((Card *)((char *)card+0x120))[self->slots[i]].id) {
    data_ov002_022ce288.selected=i;
    break;
   }
  }
  card=(Card *)(data_ov002_022cf16c+(self->side&1)*0x868+0x120);
  idx=self->slots[data_ov002_022ce288.selected];
  func_ov002_021d87a4(self->side,11,card[idx].high*2+card[idx].low);
  return 0x78;
 case 0x78:
  card=(Card *)(data_ov002_022cf16c+(self->side&1)*0x868);
  idx=func_0202b100(((Card *)((char *)card+0x120))[self->slots[data_ov002_022ce288.selected]].id);
  func_ov002_021ae430(self->side,(const char *)idx);
  return 0x77;
 case 0x77:
  for(i=0;i<3;i++) {
   card=(Card *)(data_ov002_022cf16c+(self->side&1)*0x868+0x120);
   idx=self->slots[i];
   self->slots[i]=card[idx].high*2+card[idx].low;
  }
  for(i=0;i<3;i++) {
   if(i==data_ov002_022ce288.selected) continue;
   idx=func_ov002_021b9b64(self->slots[i]);
   func_ov002_021d7c1c((void *)self->side,(void *)idx,0);
  }
  return 0x76;
 case 0x76:
  card=(Card *)func_ov002_021b9b64(self->slots[data_ov002_022ce288.selected]);
  if(func_0202e234(card->id)) func_ov002_0227adb8(self->side,(int)card,1,0);
  else func_ov002_021d7c1c((void *)self->side,card,0);
  return 0;
 }
 return 0;
}
