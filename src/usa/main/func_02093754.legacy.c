/* func_02093754: if a raw system halfword at 0x027ffc40 reads 2, run
 * func_02093b08. Then feed func_02090780's result to func_0209bf20, run
 * func_02093c50 for modes 0-3, reset flags via func_02090574/
 * func_020904c0, stash a0 at raw address 0x027ffc20, and finish with
 * func_020937d4(0x10)/func_01ff8624(). */

extern void func_02093b08(void);
extern unsigned int func_02090780(void);
extern void func_0209bf20(unsigned short v);
extern void func_02093c50(int mode);
extern void func_02090574(int flags);
extern void func_020904c0(int flags);
extern void func_020937d4(int a0);
extern void func_01ff8624(void);

void func_02093754(void *a0) {
    if (*(volatile unsigned short *)0x027ffc40 == 2) {
        func_02093b08();
    }
    func_0209bf20((unsigned short)func_02090780());
    func_02093c50(0);
    func_02093c50(1);
    func_02093c50(2);
    func_02093c50(3);
    func_02090574(0x40000);
    func_020904c0(-1);
    *(void **)0x027ffc20 = a0;
    func_020937d4(0x10);
    func_01ff8624();
}
