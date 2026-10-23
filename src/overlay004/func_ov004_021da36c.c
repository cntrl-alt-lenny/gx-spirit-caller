typedef unsigned short u16;
typedef unsigned int u32;
typedef struct Obj { void *handle; int f4; int f8; int fc; short size; short unused; unsigned short kind; char pad[0x10]; } Obj;
struct Ov000Curve;
extern void func_02001d68(int arg);
extern void *func_02006c0c(void *, int, int);
extern int func_0201d47c(Obj *o);
extern int func_0201e5b8(Obj *o);
extern void Task_Invoke(void *p);
extern int func_0208de4c(void);
extern int func_0208e0a0(void);
extern void *func_0208dd9c(void);
extern void func_02094504(int, void *, int);
extern void func_02094550(int *src, int *dst, unsigned int count);
extern void func_02001bc8(unsigned short *out, unsigned short c1, unsigned short c2);
extern int func_0201d760(int arg);
extern int func_0202c0c0(int);
extern void func_ov004_021d9fc4(int,int,int);
extern void func_ov004_021da874(void *self);
extern void func_ov004_021c9fcc(void *rec,int a,int b,int c,int d);
extern void func_ov000_021abd50(struct Ov000Curve *p,int start,int base,int type,int a,int b,int c,int hi,int margin);
extern void Fill32(unsigned int value,void *dest,int size_bytes);
extern int OS_SPrintf(signed char *buffer,const signed char *format,...);
extern struct { u32 f0; unsigned mode:3; unsigned rest:29; } data_02104f4c;
extern char data_ov004_0220b500[];
extern signed char data_ov004_0220a1b4[],data_ov004_0220a1c8[],data_ov004_0220a1e0[],data_ov004_0220a1f4[],data_ov004_0220a20c[],data_ov004_0220a22c[],data_ov004_0220a240[];
extern char data_ov004_022105d8[];
extern int data_ov004_02200e00[];
void func_ov004_021da36c(void) {
    char *self = data_ov004_0220b500;
    char a[0x28];
    signed char name[32];
    char b[0x28];
    char c[0x28];
    u16 colors[16];
    char d[0x28];
    void *h;
    int i;
    u16 mode;
    int addr, offset;
    func_02001d68(data_02104f4c.mode);
    *(volatile u16 *)0x0400100c = (*(volatile u16 *)0x0400100c & ~3) | 3;
    *(volatile u32 *)0x04001018 = 0;
    *(volatile u16 *)0x0400100c = (*(volatile u16 *)0x0400100c & 0x43) | 0x4408;
    func_02094504(0,(void *)func_0208de4c(),0x20);
    func_02094504(0,(void *)func_0208e0a0(),0x1000);
    h=func_02006c0c(data_ov004_0220a1b4,4,0);
    func_0201d47c((Obj *)a);
    addr=(int)data_ov004_022105d8;
    offset=0x5040;
    mode=*(u16 *)(a+20);
    *(int *)(a+12)=offset;
    *(void **)(a)=h;
    *(u16 *)(a+20)=(mode & ~0xf)|7;
    *(int *)(a+8)=addr;
    *(u16 *)(a+16)=0x80;
    func_0201e5b8((Obj *)a);
    Task_Invoke(h);
    for(i=0;i<2;i++) {
        OS_SPrintf(name,data_ov004_0220a1c8,i!=0?6:2);
        h=func_02006c0c(name,4,0);
        func_0201d47c((Obj *)a);
        int size=(i+5)*32;
        mode=*(u16 *)(a+20);
        *(u16 *)(a+16)=size;
        *(void **)(a)=h;
        *(u16 *)(a+20)=(mode & ~0xf)|7;
        *(int *)(a+12)=-1;
        *(int *)(a+8)=-1;
        func_0201e5b8((Obj *)a);
        Task_Invoke(h);
    }
    h=func_02006c0c(data_ov004_0220a1e0,4,0);
    func_0201d47c((Obj *)a);
    *(void **)(a)=h;
    *(u16 *)(a+20)=(*(u16 *)(a+20) & ~0xf)|7;
    *(int *)(a+12)=0x7040;
    *(int *)(a+8)=(int)(self+0x5258);
    *(u16 *)(a+16)=0x80;
    func_0201e5b8((Obj *)a);
    Task_Invoke(h);
    *(volatile u16 *)0x0400100e=(*(volatile u16 *)0x0400100e & ~3)|3;
    *(volatile u32 *)0x0400101c=0;
    *(volatile u16 *)0x0400100e=(*(volatile u16 *)0x0400100e & 0x43)|0x604;
    func_02094504(0,func_0208dd9c(),0x40);
    h=func_02006c0c(data_ov004_0220a1f4,4,0);
    func_0201d47c((Obj *)b);
    mode=*(u16 *)(b+20);
    *(int *)(b+12)=0x40;
    *(void **)(b)=h;
    *(u16 *)(b+20)=(mode & ~0xf)|8;
    *(int *)(b+8)=0;
    mode=*(u16 *)(b+20);
    *(u16 *)(b+16)=0x100;
    *(u16 *)(b+20)=mode & ~0x10;
    func_0201e5b8((Obj *)b);
    Task_Invoke(h);
    h=func_02006c0c(data_ov004_0220a20c,4,0);
    func_0201d47c((Obj *)c);
    *(u16 *)(c+20)=(*(u16 *)(c+20) & ~0xf)|9;
    *(void **)(c)=h;
    mode=*(u16 *)(c+20);
    *(int *)(c+12)=-1;
    *(u16 *)(c+20)=mode | 0x10;
    *(u16 *)(c+16)=0x400;
    func_0201e5b8((Obj *)c);
    Task_Invoke(h);
    func_02001bc8(colors,0x7fff,0x3128);
    func_02094550((int *)colors,(int *)0x05000640,0x20);
    func_02001bc8(colors,0x3860,0x779b);
    func_02094550((int *)colors,(int *)0x05000660,0x20);
    func_ov004_021da874(0);
    { u32 layers=(*(volatile u32 *)0x04001000 & 0x1f00)>>8; *(volatile u32 *)0x04001000=(*(volatile u32 *)0x04001000 & ~0x1f00) | ((layers | 0xc)<<8); }
    for(i=0;i<4;i++) {
        func_ov004_021d9fc4(i+6,func_0202c0c0(((int *)((char *)data_ov004_02200e00+0xc8))[i]+0x3b6),0x80);
    }
    h=func_02006c0c(data_ov004_0220a22c,4,0);
    func_0201d47c((Obj *)d);
    *(u16 *)(d+20)=(*(u16 *)(d+20) & ~0xf)|9;
    *(int *)(d+12)=0xc00;
    *(void **)(d)=h;
    *(int *)(d+8)=0;
    *(u16 *)(d+16)=0x20;
    func_0201e5b8((Obj *)d);
    func_02094550((int *)func_0201d760((int)h),(int *)(self+0x5ed8),0x20);
    Task_Invoke(h);
    func_ov004_021c9fcc(self+0x5f90,(int)data_ov004_0220a240,2,0x8480,1);
    Fill32(0,self+0x158,0xa0);
    i=0;
    *(int *)(self+0x54)=i;
    offset=i-1;
    *(int *)(self+0x90)=offset;
    *(int *)(self+0xa8)=offset;
    *(int *)(self+0xac)=offset;
    *(int *)(self+0xb0)=offset;
    *(int *)(self+0x88)=offset;
    *(int *)(self+0x98)=2;

    *(int *)(self+0xa0)=i;
    *(int *)(self+0x3c90)=i;
    *(int *)(self+0x3c94)=i;
    func_ov000_021abd50((struct Ov000Curve *)(self+0x1f8),0xe4,0x22,0x1a,0x9d,0x14,0x14,*(int *)(self+0x98)*6,0x14);
}















