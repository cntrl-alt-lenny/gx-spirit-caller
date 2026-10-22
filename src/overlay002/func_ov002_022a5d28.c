typedef unsigned int u32;
typedef unsigned short u16;
typedef struct {
 void *task; int f4,f8,fc; short f10,f12;
 u16 bg:4, enable:1, unused:11;
 u16 f16; u32 low:14,bank:3,high:15; u32 a:8,b:8; char pad[8];
} Obj;
typedef struct { unsigned short a:1,b:5,c:8,d:1,e:1; } Bits;
typedef struct { unsigned char active; char pad[0x27]; Bits bits; short count; } Item;
extern int func_0201d47c(Obj *o);
extern int func_0201e5b8(Obj *o);
extern void *func_02006c0c(void *, int, int);
extern void Task_Invoke(void *);
extern void func_ov002_0229d820(void);
extern void func_ov002_0229e4e8(void);
extern void func_ov002_0229e128(int *p,int v);
extern void func_ov002_0229e5a0(Item *p,int player,int kind);
extern char data_ov002_022cc218[],data_ov002_022cc230[],data_ov002_022cc248[],data_ov002_022cc264[],data_ov002_022cc280[],data_ov002_022cc29c[],data_ov002_022cc2b0[],data_ov002_022cc2c8[];
extern u32 data_ov002_022cd73c[];
void func_ov002_022a5d28(char *p) {
 int i,j; Item *items; char *rows;
 *(int *)(p+0x578)=0; *(int *)(p+0x580)=0; *(int *)(p+0x5b4)=0; *(int *)(p+0x5b8)=0; *(int *)(p+0x5c0)=0; *(int *)(p+0x5e4)=0; *(int *)(p+0x5e8)=0;
 ((Bits *)(p+0x590))->a=(u16)data_ov002_022cd73c[1];
 ((Bits *)(p+0x590))->b=11;
 ((Bits *)(p+0x590))->c=0;
 ((Bits *)(p+0x590))->d=0;
 { Obj o; void *t=func_02006c0c(data_ov002_022cc218,4,0); func_0201d47c(&o); o.task=t; o.bg=9; o.fc=0; o.f10=0; func_0201e5b8(&o); Task_Invoke(t); }
 { Obj o; void *t=func_02006c0c(data_ov002_022cc230,4,0); func_0201d47c(&o); o.task=t; o.bg=9; o.enable=1; o.fc=0x9480; o.f10=0x200; func_0201e5b8(&o); Task_Invoke(t); }
 { Obj o; void *t=func_02006c0c(data_ov002_022cc248,4,0); func_0201d47c(&o); o.task=t; o.bg=9; o.enable=1; o.fc=0xa080; o.f10=-1; func_0201e5b8(&o); Task_Invoke(t); }
 { Obj o; void *t=func_02006c0c(data_ov002_022cc264,4,0); func_0201d47c(&o); o.task=t; o.bg=9; o.enable=1; o.fc=0xa480; o.f10=-1; func_0201e5b8(&o); Task_Invoke(t); }
 { Obj o; void *t=func_02006c0c(data_ov002_022cc280,4,0); func_0201d47c(&o); o.task=t; o.bg=9; o.enable=1; o.fc=0xb280; o.f10=-1; func_0201e5b8(&o); Task_Invoke(t); }
 { Obj o; void *t=func_02006c0c(data_ov002_022cc29c,4,0); func_0201d47c(&o); o.task=t; o.bg=9; o.fc=0x3400; o.f10=0x80; func_0201e5b8(&o); Task_Invoke(t); }
 { Obj o; void *t=func_02006c0c(data_ov002_022cc2b0,4,0); func_0201d47c(&o); o.task=t; o.bg=9; o.fc=0x8980; o.f10=0x1a0; func_0201e5b8(&o); Task_Invoke(t); }
 { Obj o; void *t=func_02006c0c(data_ov002_022cc2c8,4,0); func_0201d47c(&o); o.task=t; o.bg=9; o.fc=-1; o.f10=0x1c0; func_0201e5b8(&o); Task_Invoke(t); }
 func_ov002_0229e4e8(); func_ov002_0229d820();
 i=0; items=(Item *)(p+0x280); rows=p+0x3e0;
 for(;i<2;i++) { Item *it; j=0; it=items; for(;j<4;j++) { func_ov002_0229e5a0(it,i,j+12); it++; } func_ov002_0229e128((int *)rows,i); items+=4; rows+=0xcc; }
}


