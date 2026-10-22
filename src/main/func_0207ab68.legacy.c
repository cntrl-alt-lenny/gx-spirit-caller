typedef struct { unsigned short kind, state; } Event;
extern void *data_021a088c;
extern void func_0207a544(Event *self);
extern void func_0207b038(int a0);
extern int func_0207b13c(int a,int b,int c,int d);
extern int func_0209de74(void);
extern int func_0209ea24(void (*callback)(Event *),void *buffer,void *extra,int flag,int mode);
extern int func_0209f120(int a0);
extern int func_0209f168(int a0);
extern int func_020a071c(int a,int b);
extern int func_020a0854(int a0,int a1,int a2,int a3);
void func_0207ab68(Event *self) {
 int result=20;
 switch(self->state) {
 case 0:
  switch((int)self->kind) {
  case 3: result=func_0209f120((int)func_0207ab68); break;
  case 4:
   switch(func_0209de74()) {
   case 0: func_0207b038(1); func_0207b13c(0,0,0,0x663); return;
   case 4: default: func_0207b038(11); func_0207b13c(7,0,0,0x66c); return;
   }
  case 5: func_0207b038(3); func_0207b13c(0,0,0,0x673); return;
  case 6: result=func_0209f168((int)func_0207ab68); break;
  case 29: result=func_020a071c((int)func_0207ab68,0); break;
  case 25: result=func_020a0854((int)func_0207ab68,*(unsigned char *)((char *)data_021a088c+0x2250),*(unsigned char *)((char *)data_021a088c+0x2251),(int)((char *)data_021a088c+0x2200)); break;
  case 39: { int flag; unsigned short mode = ((*(unsigned int *)((char *)data_021a088c+0x2264)&0xc0000)==0xc0000) ? 1 : 0;
   if ((*(unsigned int *)((char *)data_021a088c+0x2264)&0x30000)==0x30000) flag=0; else flag=1; result=func_0209ea24(func_0207a544,(char *)data_021a088c+0x2140,0,flag,mode); break; }
  }
  switch(result) {
  case 2: return;
  case 8: func_0207b038(12); func_0207b13c(1,*(short *)((char *)data_021a088c+0x2280)==5?(int)((char *)data_021a088c+0x2140):0,0,0x6af); return;
  case 3: default: func_0207b038(11); func_0207b13c(7,*(short *)((char *)data_021a088c+0x2280)==5?(int)((char *)data_021a088c+0x2140):0,0,0x6b8); return;
  }
 case 1: func_0207b038(12); func_0207b13c(1,*(short *)((char *)data_021a088c+0x2280)==5?(int)((char *)data_021a088c+0x2140):0,0,0x6de); return;
 case 2: case 3: case 4: default: func_0207b038(11); func_0207b13c(7,*(short *)((char *)data_021a088c+0x2280)==5?(int)((char *)data_021a088c+0x2140):0,0,0x6e8); return;
 }
}





