typedef unsigned int u32;
typedef unsigned short u16;
typedef unsigned char u8;
typedef unsigned long long u64;
typedef struct { char pad0[12]; u32 value; char pad10[56]; int active; char pad4c[8]; } Entry;
extern char data_ov004_0220b500[], data_ov004_0221159c[], data_ov004_022915a0[], data_ov004_022915e8[], data_021040ac[], data_02104eac[];
typedef struct { int f0; unsigned int mode:3; unsigned int rest:29; char pad8[0xa4c]; int a54; int a58; int a5c; int a60; } System;
extern System data_02104f4c;
extern Entry data_ov004_0220f228[];
extern void func_020945f4(void *, int, unsigned int);
extern void func_0208c884(u16 *,int);
extern void func_0208e318(int *,int,int,int,int);
extern void func_0200592c(void);
extern void func_0208d1e4(int);
extern void func_02094504(int,void *,int);
extern int func_0208cc90(void);
extern void func_0208c8cc(u32,u32,u32);
extern void func_0200197c(int,int,int);
extern void func_02001d68(int);
extern int func_0202adf8(int);
extern void func_ov004_021ca4f8(void);
extern void func_0208d138(u16),func_0208d0bc(u16),func_0208d030(int),func_0208cfa4(int);
extern void func_0208c8b0(u32);
extern void func_0201d5c0(int,int);
extern void func_0208c940(void),func_0201e7e0(void);
extern void func_02005bfc(int);
extern int func_020092e0(Entry *);
extern void func_02005800(int);
extern void func_ov004_021d5d84(void);
extern int func_ov004_021d8648(char *);
extern u64 func_0203467c(void),func_ov004_021d5ce4(void);
extern void func_ov004_021d7910(void);
extern void func_0208e2f4(u16 *,int,int);
extern void *func_0201d040(void);
extern void *func_0202c0c0(int);
extern void func_ov004_021d8798(void *,void *,int);
extern int func_02009494(void *),func_02034784(void);
extern void func_02008888(void),func_ov004_021d8cd0(void *);
extern int func_020347b8(void),func_ov004_021c9d9c(void);
extern void func_ov004_021d9418(void),func_ov004_021cded0(int);
extern void *func_0203268c(void);
typedef struct { char pad[0xeb4]; unsigned int flags; } obj_020338b8_t;
extern int func_020338b8(obj_020338b8_t *);
#define I(p,o) (*(int *)((p)+(o)))
#define H(p,o) (*(u16 *)((p)+(o)))
#define R(a) (*(volatile u32 *)(a))
#define S(a) (*(volatile u16 *)(a))
int func_ov004_021d5dc8(void) {
    char *p = data_ov004_0220b500;
    func_020945f4(p,0,0x609c);
    I(p,0x40)=1;
    I(p,0x5c)=16;
    func_0208c884((u16 *)0x0400006c,-I(p,0x5c));
    func_0208c884((u16 *)0x0400106c,-I(p,0x5c));
    func_0208e318((int *)0x04000050,1,63,16,0);
    S(0x04001050)=0;
    S(0x04000304)|=0x8000;
    func_0200592c();
    func_0208d1e4(0x1ff);
    func_02094504(0,(void *)0x06800000,0xa4000);
    func_0208cc90();
    func_02094504(0xc0,(void *)0x07000000,0x400);
    func_02094504(0xc0,(void *)0x07000400,0x400);
    func_02094504(0,(void *)0x05000000,0x400);
    func_02094504(0,(void *)0x05000400,0x400);
    R(0x04000000)&=~0x1f00;
    R(0x04001000)&=~0x1f00;
    R(0x04000000)&=~0xe000;
    R(0x04001000)&=~0xe000;
    func_0208c8cc(1,0,0);
    func_0200197c(4,(int)data_ov004_0221159c,0x80000);
    func_02001d68(data_02104f4c.mode);
    func_0202adf8((int)data_ov004_022915a0);
    func_ov004_021ca4f8();
    func_0208d138(4);func_0208d0bc(8);func_0208d030(0x80);func_0208cfa4(0x100);func_0208c8b0(0);
    R(0x04001000)=(R(0x04001000)&0xffcfffef)|0x200010;
    func_0201d5c0(9,2);
    { u32 bits=(R(0x04001000)&0x1f00)>>8; R(0x04001000)=(R(0x04001000)&~0x1f00)|((bits|16)<<8); }
    func_0208c940();
    R(0x04001000)|=0x10000;
    func_0201e7e0();func_02005bfc(1);func_02005bfc(2);
    func_020092e0(data_ov004_0220f228);
    func_02005800((int)func_ov004_021d5d84);
    func_ov004_021d8648(data_ov004_022915e8);
    func_0203467c();func_ov004_021d5ce4();
    I(p,0x4c)=1; I(p,0x48)=1;
    func_ov004_021d7910();
    func_0208e2f4((u16 *)0x04001050,28,-16);
    func_0208c884((u16 *)0x0400106c,0);
    switch ((int)func_0201d040()) {
    case 0: I(data_021040ac,0xbac)=-1; break;
    case 1: case 2:
        func_ov004_021d8798(data_ov004_022915e8,func_0202c0c0(0xe8),1);
        { int n=I(data_021040ac,0xbac);
          if(n>=0) {
            switch(I(data_021040ac,0xb9c)) {
            case 1: ((u8 *)(p+0x3d78))[n*0x54]++; break;
            case 2: ((u8 *)(p+0x3d79))[n*0x54]++; break;
            case 3: ((u8 *)(p+0x3d7a))[n*0x54]++; break;
            }
            func_02009494(p+0x3d28);
          }
        }
        if(func_02034784()==2 && I(data_021040ac,0xbac)<0) {
            data_02104f4c.a5c+=H(data_02104eac,0x68);
            data_02104f4c.a54+=H(data_02104eac,0x6a);
            data_02104f4c.a60+=H(data_02104eac,0x6c);
            H(data_02104eac,0x68)=0; H(data_02104eac,0x6a)=0; H(data_02104eac,0x6c)=0;
        }
        func_02008888();func_ov004_021d8cd0(data_ov004_022915e8);break;
    case 3: case 6:
        func_ov004_021d8798(data_ov004_022915e8,func_0202c0c0(0xe8),1);
        func_02008888();func_ov004_021d8cd0(data_ov004_022915e8);break;
    case 4: case 5: break;
    }
    func_0208c884((u16 *)0x0400106c,-I(p,0x5c));
    S(0x04001050)=0;
    if(func_020347b8()!=0) {
        if(I(data_021040ac,0xbac)>=0) {
            I(p,0x4c)=2;I(p,0x48)=2;
            func_ov004_021d9418();
            if(func_ov004_021c9d9c()!=0) I(p,0x54)=2;
        } else if(func_ov004_021c9d9c()!=0) {
            I(p,0x54)=1;func_ov004_021cded0(0);
        } else {
            func_020338b8(func_0203268c());
        }
    } else if(I(data_021040ac,0xb9c)==0) {
        int mode=(int)func_0201d040();
        switch(mode) { case 1: case 2: func_ov004_021d8798(data_ov004_022915e8,func_0202c0c0(0x674),0x12); break; }
    }
    return 1;
}

