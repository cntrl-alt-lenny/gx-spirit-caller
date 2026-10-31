typedef unsigned int u32;
typedef unsigned short u16;
typedef struct { int pad[2]; u32 flags; int padc[9]; int row; } Self;
typedef struct { char pad[0x1c]; unsigned int a:8; unsigned int b:8; } Obj;
typedef struct { void *task; int f4; int src; int dst; short size; u16 f12; u16 flags; char tail[0x12]; } Desc;
extern char data_ov002_022cbd4c[], data_ov002_022cbd68[];
extern void *func_02006c0c(void *, int, int);
extern void Task_Invoke(void *);
extern int func_0201d47c(Obj *);
extern int func_0201e5b8(Desc *);
extern int func_0208e0a0(void);
extern void func_02094504(int, void *, unsigned int);
void func_ov002_022a0ac4(Self *self) {
 u32 d[10];
 int row = self->row;
 u16 *map;
 int tile;
 int i;
 tile=row*26+1;
 map=(u16 *)(func_0208e0a0()+(row<<6));
 func_02094504(0,map,(18-row)<<6);
 func_0201d47c((Obj *)&d);
 (*(void **)d)=func_02006c0c(data_ov002_022cbd4c,4,0);
 (*(u16 *)((char *)d+0x14))=((*(u16 *)((char *)d+0x14)) & ~15)|7;
 d[2]=-1;
 (*(short *)((char *)d+0x10))=-1;
 d[3]=tile<<6;
 func_0201e5b8((Desc *)d);
 Task_Invoke((*(void **)d));
 func_0201d47c((Obj *)&d);
 (*(void **)d)=func_02006c0c(data_ov002_022cbd68,4,0);
 (*(u16 *)((char *)d+0x14))=((*(u16 *)((char *)d+0x14)) & ~15)|7;
 d[2]=-1;
 (*(short *)((char *)d+0x10))=-1;
 d[3]=(tile+24)<<6;
 func_0201e5b8((Desc *)d);
 Task_Invoke((*(void **)d));
 map+=7;
 for(i=0;i<6;i++) {
  int value=(tile+((((u16)(~self->flags >> 16) >> (i+1))&1)*24))|0x2000;
  u16 *p=map+i*3;
  p[0]=value;
  p[1]=value+1;
  p[32]=value+2;
  p[33]=value+3;
  tile+=4;
 }
}

