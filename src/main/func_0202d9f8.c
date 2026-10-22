typedef unsigned int u32;
typedef unsigned short u16;
typedef struct { u32 a,b; char pad8[0x14]; unsigned int low8:8; unsigned int:24; char pad20[4]; unsigned int:17; unsigned int mid4:4; unsigned int:11; } state_t;
typedef struct { unsigned int f_0, f_4; } Dims02001e94;
typedef struct {
 int active,id,width,start,end,phase,done;
 char pad1c[8]; int enabled; char pad28[0x14]; unsigned int speed;
 char pad40[0x10]; unsigned int flags; int w54; signed char *text;
 char pad5c[0xc]; int bg,fg;
} State;
extern State data_0219ad48;
extern state_t data_0219ad78;
extern char data_020c6d6c[], data_020c6d70[];
extern void func_02001d0c(state_t *p,int a,int b);
extern int func_02001e5c(void *p);
extern void func_02001e94(Dims02001e94 *p,u16 *dst,int val,int shift);
extern void func_02005088(int a0,int a1,int a2,int a3,int a4,int a5);
extern int func_0201d4b4(int sel);
extern int func_0201d530(int sel);
extern void *func_0202b294(int cardId);
extern char *func_0202b7cc(int idx);
extern char *func_0202b7ec(int idx);
extern char *func_0202b80c(int idx);
extern unsigned int func_0202b878(int id);
extern unsigned int func_0202b8d8(int id);
extern int func_0202c730(int x);
extern int func_0202c770(int sel);
extern void func_0202d1d8(int x);
extern int func_0202e234(int x);
extern int func_02034784(void);
extern int func_02034810(void);
extern int func_020a978c(char *dst,const char *fmt,...);
int func_0202d9f8(void) {
 char buf[0x40];
 int base;
 if(data_0219ad48.active==0) return 0;
 if(func_02034784()!=0) {
  u16 *p=(u16 *)func_0201d4b4(data_0219ad48.bg);
  int tile=((func_02034810()<<2)+1)|0x5000;
  p[0x1e]=tile; p[0x1f]=tile+1; p[0x3e]=tile+2; p[0x3f]=tile+3;
 }
 if(data_0219ad48.enabled==0) {
  if(func_0202c730(data_0219ad48.bg)!=0) {
   u32 old=*(volatile u32 *)0x04001000 & 0x1f00;
   int a=func_0202c770(data_0219ad48.bg);
   int b=func_0202c770(data_0219ad48.fg);
   a |= ~b & (old>>8);
   *(volatile u32 *)0x04001000=(*(volatile u32 *)0x04001000 & ~0x1f00)|(a<<8);
  } else {
   u32 old=*(volatile u32 *)0x04000000 & 0x1f00;
   int a=func_0202c770(data_0219ad48.bg);
   int b=func_0202c770(data_0219ad48.fg);
   a |= ~b & (old>>8);
   *(volatile u32 *)0x04000000=(*(volatile u32 *)0x04000000 & ~0x1f00)|(a<<8);
  }
  return 0;
 }
 if(func_0202c730(data_0219ad48.bg)!=0) {
  u32 old=*(volatile u32 *)0x04001000 & 0x1f00;
  int a=func_0202c770(data_0219ad48.bg);
  int b=func_0202c770(data_0219ad48.fg);
  a = a | b; a |= old>>8;
  *(volatile u32 *)0x04001000=(*(volatile u32 *)0x04001000 & ~0x1f00)|(a<<8);
 } else {
  u32 old=*(volatile u32 *)0x04000000 & 0x1f00;
  int a=func_0202c770(data_0219ad48.bg);
  int b=func_0202c770(data_0219ad48.fg);
  a = a | b; a |= old>>8;
  *(volatile u32 *)0x04000000=(*(volatile u32 *)0x04000000 & ~0x1f00)|(a<<8);
 }
 if(data_0219ad48.width>data_0219ad48.start) {
  int end=data_0219ad48.width;
  int y,x,tile,offset;
  if(data_0219ad48.end<=end) end=data_0219ad48.end;
  end=end-data_0219ad48.start+7;
  if(end<0) end=0;
  tile=end/8+0x11;
  
  for(y=0,offset=0;y<3;y++) {
   for(x=0;x<data_0219ad48.start/8;x++) {
    ((u16 *)func_0201d4b4(data_0219ad48.bg)+offset)[x]=x+tile;
   }
   tile+=0x40; offset+=0x20;
  }
 }
 base=func_0201d530(data_0219ad48.fg)+0x4e0;
 switch(data_0219ad48.phase) {
 case 1: data_0219ad48.phase++; break;
 case 2: {
  signed char *text;
  if(data_0219ad48.done!=0 && *(text=data_0219ad48.text)!=0) {
   func_02001d0c(&data_0219ad78,0x13,0x13);
   data_0219ad48.speed=4;
   data_0219ad48.flags|=0x800000;
   data_0219ad48.text=text;
  } else {
   func_02001d0c(&data_0219ad78,0x13,0x13);
   data_0219ad48.speed=4;
   if(func_0202e234(data_0219ad48.id)!=0) {
    unsigned int a=func_0202b878(data_0219ad48.id);
    unsigned int b=func_0202b8d8(data_0219ad48.id);
    char *s,*t,*u;
    if(a==0) s=data_020c6d6c; else s=func_0202b7ec(a);
    t=func_0202b7cc(0x20d);
    u=func_0202b80c(b);
    func_020a978c(buf,data_020c6d70,t,s,u,func_0202b7cc(0x20e));
    func_02005088((int)&data_0219ad78,(int)buf,base+0x2000,2,4,12);
   }
   data_0219ad48.flags|=0x800000;
   data_0219ad48.text=func_0202b294(data_0219ad48.id);
  }
  func_02001e94((Dims02001e94 *)&data_0219ad78,(u16 *)(func_0201d4b4(data_0219ad48.fg)+0xd8),0x127,1);
  data_0219ad48.phase++;
  break;
 }
 case 3:
  func_02005088((int)&data_0219ad78,(int)data_0219ad48.text,base+0x2000,2,data_0219ad48.speed,12);
  if(func_02001e5c(&data_0219ad78)!=0) data_0219ad48.phase=0;
  else if(data_0219ad48.speed>0x8c) { data_0219ad48.done=1; data_0219ad48.phase=0; }
  break;
 }
 func_0202d1d8(data_0219ad48.done);
 return 1;
}





