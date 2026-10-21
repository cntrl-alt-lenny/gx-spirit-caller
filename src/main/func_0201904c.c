extern char *GetSystemWork(void);

typedef struct {
    char padding[0x8d4];
    unsigned int count : 16;
    unsigned int flags : 16;
} SystemWork;

void func_0201904c(unsigned int amount) {
    SystemWork *work = (SystemWork *)GetSystemWork();
    unsigned int sum = amount + work->count;
    if (sum > 0xffff)
        work->count = 0xffff;
    else
        work->count = sum;
}
