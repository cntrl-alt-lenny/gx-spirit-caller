struct s338f8 {
    char _pad[0xeb4];
    int flag_eb4;
};
struct Tail {
    char _pad[0xc04];
    unsigned int high;
    int a;
    int b;
};
struct TimerState {
    char _pad[0xf14];
    unsigned int low;
};
extern int func_020338f8(struct s338f8 *p);
extern unsigned long long func_020930b0(void);
void func_02033a48(struct TimerState *p, int a, int b)
{
    struct Tail *q;


    unsigned long long time;
    if (func_020338f8((struct s338f8 *)p) != 0) return;
    q = (struct Tail *)(unsigned long long)((unsigned int)p + 0x314);
    time = func_020930b0();
    p->low = (unsigned int)time;
    q->high = (unsigned int)(time >> 32);
    q->a = a;
    q->b = b;
}









