/* func_02093848: if a raw system halfword at 0x027ffc40 reads 2, run
 * func_02093bfc. Then feed func_02090868's result to func_0209c014, run
 * func_02093d44 for modes 0-3, reset flags via func_0209065c/
 * func_020905a8, stash a0 at raw address 0x027ffc20, and finish with
 * func_020938c8(0x10)/func_01ff8624(). */

extern void func_02093bfc(void);
extern unsigned int func_02090868(void);
extern void func_0209c014(unsigned short v);
extern void func_02093d44(int mode);
extern void func_0209065c(int flags);
extern void func_020905a8(int flags);
extern void func_020938c8(int a0);
extern void func_01ff8624(void);

void func_02093848(void *a0) {
    if (*(volatile unsigned short *)0x027ffc40 == 2) {
        func_02093bfc();
    }
    func_0209c014((unsigned short)func_02090868());
    func_02093d44(0);
    func_02093d44(1);
    func_02093d44(2);
    func_02093d44(3);
    func_0209065c(0x40000);
    func_020905a8(-1);
    *(void **)0x027ffc20 = a0;
    func_020938c8(0x10);
    func_01ff8624();
}
