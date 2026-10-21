typedef struct {
    unsigned int low : 10;
    unsigned int active : 1;
    unsigned int high : 21;
} Flags;

typedef struct {
    char pad[0x8f8];
    Flags flags;
} SystemWork;

extern char *GetSystemWork(void);
/* Original call supplies no arguments to the four-parameter forwarding thunk. */
extern int func_020190c0();
extern int func_0201a454(int arg);
extern void func_0200a26c(int a0);

int func_0201a498(void) {
    SystemWork *work = (SystemWork *)GetSystemWork();
    int result;
    result = func_0201a454(func_020190c0());
    if (result != 0) {
        if (work->flags.active == 0) {
            work->flags.active = 1;
            func_0200a26c(5);
        }
    }
    return result;
}

