typedef struct { int pad0[12]; int row; char pad34[0x60]; int f94[16], fd4[16], f114[16]; } Self;
typedef struct { char pad[0x1c]; unsigned int a:8; unsigned int b:8; } Obj;
typedef struct {
 void *task; int f4; int f8; int fc;
 short f10; unsigned short f12;
 unsigned short f14;
 unsigned short f16;
 unsigned int f18;
 char tail[0xc];
} Desc;
extern char data_ov002_022cbd84[];
extern char data_ov002_022cbda0[];
extern void *func_02006c0c(void *, int, int);
extern int func_0201d47c(Obj *o);
extern int func_0201e5b8(Desc *);
extern void Task_Invoke(void *p);
extern int func_0208df94(void);
extern void func_02094550(int *src, int *dst, unsigned int count);
void func_ov002_022a0d10(Self *self, int count) {
 int i;
 int base;
 int screen;
 int dest;
 unsigned int d[10];
 func_0201d47c((Obj *)&d);
 (*(void **)d)=func_02006c0c(data_ov002_022cbd84,4,0);
 d[2]=(int)self+0x94;
 screen=0xc440;
 d[3]=screen;
 (*(unsigned short *)((char *)d+0x14))=((*(unsigned short *)((char *)d+0x14)) & ~0xf)|8;
 d[6]=(d[6] & ~0x1c000)|0x1c000;
 (*(short *)((char *)d+0x10))=0x600;
 (*(unsigned short *)((char *)d+0x14))=(*(unsigned short *)((char *)d+0x14))|0x10;
 func_0201e5b8((Desc *)d);
 Task_Invoke((*(void **)d));
 func_0201d47c((Obj *)&d);
 (*(void **)d)=func_02006c0c(data_ov002_022cbda0,4,0);
 (*(unsigned short *)((char *)d+0x14))=((*(unsigned short *)((char *)d+0x14)) & ~0xf)|9;
 screen+=0x540;
 d[3]=screen;
 (*(short *)((char *)d+0x10))=-1;
 func_0201e5b8((Desc *)d);
 Task_Invoke((*(void **)d));
 base=self->row+2;
 func_02094550((int *)(self->f94),(int *)(func_0208df94()+(base<<6)),0x40);
 for(i=0;i<count;i++) {
  dest=func_0208df94()+((base+1+i)<<6);
  func_02094550(self->fd4,(int *)dest,0x40);
 }
 dest=func_0208df94()+((base+1+i)<<6);
 func_02094550(self->f114,(int *)dest,0x40);
}















