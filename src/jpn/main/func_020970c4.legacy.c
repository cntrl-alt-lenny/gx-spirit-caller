extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int state);
extern void func_02091924(void *p);
extern void func_02096634(void *self, int param2);
extern int func_020979fc(void *self);
extern void func_02097958(int x);

void func_020970c4(void *self, int param2) {
    int flags = *(volatile int *)((char *)self + 0x1c);
    if ((flags & 0x100) != 0) {
        int f2 = *(volatile int *)((char *)self + 0x1c);
        void *obj = *(void **)((char *)self + 0x24);
        f2 &= ~0x100;
        *(int *)((char *)self + 0x1c) = f2;
        func_02096634(obj, param2);
        {
            int ret = func_020979fc(self);
            if (ret == 0) {
                return;
            }
            func_02097958(ret);
        }
    } else {
        void *obj = *(void **)((char *)self + 0x24);
        int state = OS_DisableIrq();
        *(int *)((char *)obj + 0x14) = param2;
        {
            int f2 = *(int *)((char *)self + 0x1c);
            f2 &= ~0x200;
            *(int *)((char *)self + 0x1c) = f2;
        }
        func_02091924((char *)self + 0xc);
        OS_RestoreIrq(state);
    }
}
