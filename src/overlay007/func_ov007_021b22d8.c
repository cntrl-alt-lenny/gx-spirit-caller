typedef unsigned int u32;
typedef unsigned short u16;
typedef struct { unsigned low:8; unsigned layers:5; unsigned middle:3; unsigned enabled:1; unsigned rest:15; } Display;
extern void func_02094504(u32, void *, u32);
extern void func_0200592c(void);
extern void func_0208d1e4(int);
extern int func_0208cc90(void);
extern void func_0208da2c(int);
extern void func_0208d4f0(u16);
extern void func_0208d3fc(u16);
extern void func_0208d138(u16);
extern void func_0208d0bc(u16);
extern void func_0208d030(int);
extern void func_0208cfa4(int);
extern void func_0208c8cc(u32,u32,u32);
extern void func_0208c8b0(unsigned int);
extern void func_0208c940(void);
extern void func_0200197c(int,int,int);
extern void func_02001d68(int);
extern int func_0202adf8(int);
extern void func_0202ae1c(int);
extern void func_0202c070(int);
extern int func_02021064(void);
extern int func_02021190(int,int);
extern int func_020211b4(int,int);
extern void func_0200ad0c(int);
extern int func_0200f854(u16,u16,u32,u32,u32);
extern void func_020057c8(int,int);
extern int func_ov007_021b2568(void *);
extern int func_ov007_021b2a98(void *);
extern char data_02103da0[], data_020c3e48[];
extern char data_ov007_021b34c4[], data_ov007_021b3488[], data_ov007_022334d0[], data_ov007_0223352c[];
int func_ov007_021b22d8(void) {
    volatile Display *display = (volatile Display *)0x4001000;
    int *first = (int *)data_02103da0;
    int *second = (int *)data_020c3e48;
    func_02094504(0xc0,(void *)0x7000000,0x400);
    func_02094504(0xc0,(void *)0x7000400,0x400);
    func_02094504(0,(void *)0x5000000,0x400);
    func_02094504(0,(void *)0x5000400,0x400);
    func_0200592c();
    func_0208d1e4(0x1ff);
    func_02094504(0,(void *)0x6800000,0xa4000);
    func_0208cc90();
    func_0208da2c(0x60);
    func_0208d4f0(3);
    func_0208d3fc(0x10);
    func_0208d138(4);
    func_0208d0bc(8);
    func_0208d030(0x80);
    func_0208cfa4(0x100);
    *(u16 *)0x4000304 |= 0x8000;
    func_0208c8cc(1,0,1);
    func_0208c8b0(0);
    ((Display *)0x4000000)->layers = 0;
    func_0208c940();
    display->layers = 0;
    display->enabled = 1;
    *first = 1;
    *second = 0;
    func_0200197c(4,(int)data_ov007_021b34c4,0x80000);
    func_02001d68(0);
    func_0202adf8((int)data_ov007_021b3488);
    func_0202ae1c(0);
    func_0202c070(0);
    func_02021064();
    func_02021190(2,1);
    func_020211b4(3,8);
    func_0200ad0c(8);
    func_0200f854(3,0x10,0x18000,0,0x3000);
    func_020057c8(0x14,1);
    func_ov007_021b2568(data_ov007_022334d0);
    func_ov007_021b2a98(data_ov007_0223352c);
    return 1;
}
















