typedef struct { unsigned int state; int value; char pad[0x64 - 8]; int flag; } Thread;
extern int data_021a63b8;
extern void func_0209226c(unsigned int *, unsigned int, unsigned int);
extern void func_02091c44(int);
extern void func_02092324(Thread *);
void func_02091c88(Thread *thread, int value) {
    if (data_021a63b8) {
        func_0209226c((unsigned int *)thread, (unsigned int)func_02091c44, data_021a63b8);
        thread->value = value;
        thread->state |= 0x80;
        thread->flag = 1;
        func_02092324(thread);
    } else { func_02091c44(value); }
}
