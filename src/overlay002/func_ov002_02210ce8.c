typedef unsigned short u16;
typedef struct Card {
 u16 id;
 u16 side:1; u16 index:5; u16 unused:10;
 u16 flag0:2; u16 disabled:1; u16 flags:13;
} Card;
extern char data_ov002_022ce288[], data_ov002_022d016c[], data_ov002_022d0e6c[];
extern int data_ov002_022cd744[];
struct Slot { unsigned int id:13; unsigned int rest:19; char pad[16]; };
struct Player { char pad[0x30]; struct Slot slots[5]; char tail[0x7d4]; };
extern struct Player data_ov002_022cf16c[];
extern int func_0202b100(int);
extern void func_ov002_021ae400(int,int);
extern int func_ov002_021ae484(int);
extern int func_ov002_021ae664(int);
extern void func_ov002_021af9d0(int,int,int,int);
extern int *func_ov002_021afb74(void);
extern unsigned int func_ov002_021b00d0(unsigned int);
extern int func_ov002_021c8470(int,int);
/* Original calls these thunks with fewer arguments than their forwarding definitions. */
extern int func_ov002_021ca2b8();
extern int func_ov002_021d8288();
extern int func_ov002_02257878();
extern int func_ov002_021de408(int,int);
extern void func_ov002_021deb28(int,int);
extern int func_ov002_021df818(Card *,int,int);
extern int func_ov002_021e286c(int);
extern int func_ov002_02210bf0(void *,int,int);
extern int func_ov002_0225368c(int,int,int);
extern int func_ov002_022536e8(void *,int,int);
extern void func_ov002_0225935c(int,int,int);
extern int func_ov002_022593f4(void);
extern void func_ov002_0226b22c(int,int,int,int);
extern int func_ov002_0227adb8(int,int,int,int);
extern void func_ov002_0229ce5c(char *,int,int);
int func_ov002_02210ce8(Card *self) {
 char buf2[256],buf1[256],buf0[256];
 int i,sum;
 if(self->disabled) return 0;
 switch(*(int *)(data_ov002_022ce288+0x5a8)) {
 case 0x80:
  if(data_ov002_022cd744[self->side]==1) *(int *)(data_ov002_022d016c+0xd44)=func_ov002_021b00d0(2);
  else func_ov002_021ae664(0x38);
  return 0x7f;
 case 0x7f:
  func_ov002_0226b22c(self->side,self->index,1,*(int *)(data_ov002_022d016c+0xd44));
  return 0x7e;
 case 0x7e:
  if(*(u16 *)(data_ov002_022d0e6c+0xb2)) {
   func_ov002_021de408((int)self,0x1f << ((1-self->side)*16));
   if(func_ov002_022536e8(self->side,self->id,0)>0 && func_ov002_021ca2b8(self->side) && func_ov002_02257878(self,func_ov002_02210bf0)) return 0x78;
  } else {
   sum=0;
   for(i=0;i<5;i++) {
    if(data_ov002_022cf16c[self->side & 1].slots[i].id) sum+=func_ov002_021c8470(self->side,i);
   }
   func_ov002_021de408((int)self,0x1f << (self->side*16));
   func_ov002_021df818(self,self->side,sum>>1);
  }
  return 10;
 case 0x78:
  if(data_ov002_022cd744[self->side]==1) *(int *)(data_ov002_022d016c+0xd44)=0;
  else {
   func_ov002_0229ce5c(buf1,0x39,func_0202b100(0xfc9));
   func_ov002_0229ce5c(buf2,(int)buf1,func_0202b100(0x146e));
   func_ov002_021ae484((int)buf2);
  }
  return 0x77;
 case 0x77:
  if(*(int *)(data_ov002_022d016c+0xd44)==0) return 10;
  func_ov002_0229ce5c(buf0,0x13,func_0202b100(0xfc9));
  func_ov002_021ae400(self->side,(int)buf0);
  func_ov002_0225935c(self->side,1,(int)func_ov002_02210bf0);
  return 0x6d;
 case 0x6d:
  if(func_ov002_022593f4()==0) return 0x77;
  func_ov002_021deb28(*(int *)(data_ov002_022d016c+0xd70),*(int *)(data_ov002_022d016c+0xd74)+*(int *)(data_ov002_022d016c+0xd78));
  return 0x64;
 case 0x64:
  func_ov002_021af9d0(self->side,6,self->id,0); return 0x63;
 case 0x63:
  func_ov002_0227adb8(self->side,(int)func_ov002_021afb74(),1,1); return 0x61;
 case 0x61:
  if(func_ov002_0225368c(self->side,0x146e,0)<=0) return 10;
  func_ov002_021ae400(self->side,0x3c); return 0x60;
 case 0x60:
  func_ov002_021af9d0(self->side,6,0x146e,0); return 0x5f;
 case 0x5f:
  if(func_ov002_021d8288(self->side,func_ov002_021afb74())) func_ov002_021e286c(self->side);
  return 10;
 }
 return 0;
}


