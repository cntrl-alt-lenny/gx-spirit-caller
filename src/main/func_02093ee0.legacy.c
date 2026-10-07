extern void func_02093dc8(int);
extern void func_020906dc(int, void (*)(int), int);
extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int);
extern void func_01ff86c4(int, int, int, int);
void func_02093ee0(int channel, int destination, int value, unsigned int size, void (*callback)(int), int arg) {
    int saved;
    if (!size) { if (callback) callback(arg); return; }
    func_02093dc8(channel);
    if (callback) {
        func_020906dc(channel, callback, arg);
        saved = OS_DisableIrq();
        *(volatile int *)(0x04000000 + channel * 4 + 0xe0) = value;
        func_01ff86c4(channel, 0x040000e0 + channel * 4, destination, (size >> 2) | 0xc5000000);
        OS_RestoreIrq(saved);
    } else {
        saved = OS_DisableIrq();
        *(volatile int *)(0x04000000 + channel * 4 + 0xe0) = value;
        func_01ff86c4(channel, 0x040000e0 + channel * 4, destination, (size >> 2) | 0x85000000);
        OS_RestoreIrq(saved);
    }
}
