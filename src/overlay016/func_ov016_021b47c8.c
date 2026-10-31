typedef unsigned int u32;
typedef unsigned short u16;
typedef struct { unsigned char pad[0x1c]; void *value; int unused; int arg; } Object;
struct Ov016State { int pad[6]; int value,kind; };
typedef struct { u16 x,y; unsigned char w,h; } Rect;
typedef struct { int a,b,c,d; } Init;
extern Init data_ov016_021b8e04;
extern char data_ov016_021bab44[],data_ov016_021bac38[],data_02105b70[];
extern u16 data_02104bac[];
extern Rect data_ov016_021b9184;
extern void func_ov016_021b398c(void *,void *);
extern unsigned long long func_02052ecc(Object *);
extern int func_0205307c(char *);
extern void *func_0202c0c0(int);
extern void func_ov016_021b5544(void *,int,void *);
extern int func_02037208(int,int,int,int);
extern int func_ov016_021b4c14(struct Ov016State *,int);
extern int func_ov016_021b5390(struct Ov016State *);
extern int func_ov016_021b5414(int,int);
extern int func_ov016_021b5284(struct Ov016State *);
extern int func_ov016_021b28f4(Rect *);
/* This caller passes the state pointer although the current callee definition takes no arguments. */
extern int func_ov016_021b5244(struct Ov016State *);
int func_ov016_021b47c8(struct Ov016State *s) {
 int *p=(int *)s;
 Init init;
 u32 planes;
 switch(p[0]) {
 case 0:
  init=data_ov016_021b8e04;
  func_ov016_021b398c(data_ov016_021bab44,&init);
  planes=(*(volatile u32 *)0x04001000 & 0x1f00)>>8;
  *(volatile u32 *)0x04001000=(*(volatile u32 *)0x04001000 & ~0x1f00)|((planes|0x14)<<8);
  p[0]=1;
  if(func_02052ecc((Object *)data_02105b70)==0) {
   func_ov016_021b5544(data_ov016_021bac38,0x11,func_0202c0c0(0x678));
  } else if(func_0205307c(data_02105b70)==0) {
   func_ov016_021b5544(data_ov016_021bac38,0x11,func_0202c0c0(0x6bd));
  }
  break;
 case 1:
  if(p[8]) {
   planes=(*(volatile u32 *)0x04000000 & 0x1f00)>>8;
   *(volatile u32 *)0x04000000=(*(volatile u32 *)0x04000000 & ~0x1f00)|((planes & ~2)<<8);
   planes=(*(volatile u32 *)0x04001000 & 0x1f00)>>8;
   *(volatile u32 *)0x04001000=(*(volatile u32 *)0x04001000 & ~0x1f00)|((planes & ~0x10)<<8);
   func_02037208(0x42,-1,0,1);
   p[0]=2;
   return 0;
  }
  if(data_02104bac[0x29]) {
   u16 key=data_02104bac[0x2a];
   if(key & 1) return func_ov016_021b4c14(s,func_ov016_021b5414((int)s,func_ov016_021b5390(s)));
   else if(key & 2) {
    if(p[5]==0) return func_ov016_021b4c14(s,0);
    p[5]--;
    func_02037208(0x43,-1,0,1);
   } else if(key & 0x100) return func_ov016_021b4c14(s,2);
   else if(key & 0x200) return func_ov016_021b4c14(s,1);
   else if(key & 0x40) {
    if(p[6]<3) { if(--p[7]<0) p[7]=3; }
    else { if(--p[7]<1) p[7]=2; }
    func_02037208(0x38,-1,0,1);
   } else if(key & 0x80) {
    if(p[6]<3) { if(++p[7]>3) p[7]=0; }
    else { if(++p[7]>2) p[7]=1; }
    func_02037208(0x38,-1,0,1);
   } else if(key & 0x10) {
    if(p[7]==0) { if(++p[6]>2) p[6]=0; }
    else if(p[7]==3) { if(++p[6]>2) {p[6]=3;p[7]=2;} }
    else { if(++p[6]>3) p[6]=0; }
    func_02037208(0x38,-1,0,1);
   } else if(key & 0x20) {
    if(p[7]==0) { if(--p[6]<0) p[6]=2; }
    else if(p[7]==3) { if(--p[6]<0) {p[6]=3;p[7]=2;} }
    else { if(--p[6]<0) p[6]=3; }
    func_02037208(0x38,-1,0,1);
   }
  } else {
   func_ov016_021b5284(s);
   if(func_ov016_021b28f4(&data_ov016_021b9184)) return func_ov016_021b4c14(s,0);
   if(func_ov016_021b5244(s)) return func_ov016_021b4c14(s,func_ov016_021b5414((int)s,func_ov016_021b5390(s)));
  }
  break;
 case 2: return 1;
 }
 return 0;
}

