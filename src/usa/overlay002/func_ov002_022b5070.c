extern char data_020ce2a0[];

extern int func_0208ce70(void);
extern void func_0208d944(int a);
extern void func_0208c7e4(int a, int b, int c);
extern void func_0208e6c4(void);
extern void func_0208e504(int a, int b, int c, int d, int e);
extern void *func_02021174(void *p);
extern int func_02021428(int *p);
extern int func_020221f8(int idx);
extern int func_020221e0(unsigned int idx, unsigned int v);
extern void func_02021278(void *p);
extern void func_0202c96c(int arg1);

/* func_ov002_022b5070: arg1!=0 arms audio channel 0x60 + a full sound-hw
 * reset sequence (SOUNDCNT clear, master-vol registers, BG2/3 affine
 * param regs) and (re)creates obj->f0 via 020211c8 if unset; arg1==0
 * tears down obj->f0 via 020212cc if set. Both paths converge on a
 * table[0] flag toggle (bit 2, set vs clear) and a final 0202c9c0(arg1).
 */
void func_ov002_022b5070(void *r0arg, int arg1) {
    int *obj = r0arg;

    if (arg1 != 0) {
        func_0208ce70();
        func_0208d944(0x60);
        func_0208c7e4(1, 0, 1);
        func_0208e6c4();

        *(volatile unsigned short *)0x04000060 &= 0xffffcffd;
        *(volatile unsigned short *)0x04000060 =
            (*(volatile unsigned short *)0x04000060 & ~0x3000) | 0x10;
        func_0208e504(0, 0x1f, 0x7fff, 0x3f, 0);

        *(volatile unsigned int *)0x04000580 = 0xbfff0000;
        *(volatile unsigned int *)0x0400044c = 0;

        *(volatile unsigned short *)0x0400000c &= ~0x3;
        *(volatile unsigned short *)0x0400000c =
            (*(volatile unsigned short *)0x0400000c & 0x43) | 0xe00;
        *(volatile unsigned short *)0x0400000e &= ~0x3;
        *(volatile unsigned short *)0x0400000e =
            (*(volatile unsigned short *)0x0400000e & 0x43) | 0xf00;

        if (*obj == 0) {
            *obj = (int)func_02021174(data_020ce2a0);
        }

        func_02021428((int *)*obj);
        {
            int v = func_020221f8(0);
            func_020221e0(0, v | 4);
        }
    } else {
        if (*obj != 0) {
            func_02021278((void *)*obj);
            *obj = 0;
        }
        {
            int v = func_020221f8(0);
            func_020221e0(0, v & ~4);
        }
    }

    func_0202c96c(arg1);
}
