typedef unsigned int u32;
extern int func_0202d9f8(void);
extern int func_ov002_022a1784(void *p);
extern int func_ov002_022b859c(void *p);
extern void func_0208e890(void);
extern void func_0208ecd8(int,int,int,int,int,int,int,int,void *);
extern char data_ov002_022d11bc[];
extern char data_ov002_022d1b7c[];
#define HW(a) (*(volatile u32 *)(a))
void func_ov002_022b540c(u32 *obj) {
    if (func_0202d9f8() == 0) return;
    if (func_ov002_022a1784(data_ov002_022d11bc) == 0) {
        if (func_ov002_022b859c(data_ov002_022d1b7c) != 0) return;
    }
    func_0208e890();
    func_0208ecd8(0,0xc0000,0,0x100000,-0x400000,0x400000,0x400000,1,0);
    HW(0x04000444) = 0;
    HW(0x04000470) = 0x32000;
    HW(0x04000470) = 0x5c000;
    HW(0x04000470) = 0x100;
    HW(0x0400046c) = 0x80000;
    HW(0x0400046c) = 0x80000;
    HW(0x0400046c) = 0x1000;
    HW(0x04000440) = 3;
    HW(0x04000454) = 0;
    HW(0x04000440) = 2;
    HW(0x040004c0) = 0x4210ffff;
    HW(0x040004c4) = 0x4210;
    HW(0x040004a8) = 0x56400000 | (obj[1] >> 3);
    HW(0x040004ac) = obj[2] >> 4;
    HW(0x040004a4) = 0x001f00c0;
    HW(0x04000500) = 1;
    HW(0x04000488) = 0;
    HW(0x0400048c) = 0xf800f800;
    HW(0x0400048c) = 0;
    HW(0x04000488) = 0x800;
    HW(0x0400048c) = 0xf8000800;
    HW(0x0400048c) = 0;
    HW(0x04000488) = 0x08000800;
    HW(0x0400048c) = 0x08000800;
    HW(0x0400048c) = 0;
    HW(0x04000488) = 0x08000000;
    HW(0x0400048c) = 0x0800f800;
    HW(0x0400048c) = 0;
    HW(0x04000504) = 0;
    HW(0x04000448) = 1;
}

