typedef unsigned int u32;
typedef struct {
    int flag;
    int field4;
    int field8;
    int fieldc;
    void (*callback)(void *);
    void *arg;
    u32 mode;
    void (*irq)(void);
} State;
extern State data_021a6710;
extern unsigned int func_020905dc(unsigned int mask);
extern void func_020907b4(unsigned int mask, void (*callback)(void));

void func_0209423c(void) {
    void (*callback)(void *);
    void *arg;
    func_020905dc(0x200000);
    *(volatile u32 *)0x04000600 = (data_021a6710.mode << 30) | (*(volatile u32 *)0x04000600 & ~0xc0000000u);
    func_020907b4(0x200000, data_021a6710.irq);
    data_021a6710.flag = 0;
    callback = data_021a6710.callback;
    arg = data_021a6710.arg;
    if (callback != 0) {
        callback(arg);
    }
}

