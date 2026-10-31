typedef unsigned int u32;
typedef struct {
    int flag;
    int channel;
    int source;
    u32 remaining;
} State;
extern State data_021a6710;
extern void func_0209423c(void);
extern void func_020906dc(int channel, void (*callback)(void), int arg);
extern void func_01ff8770(int ch, int sad, int dad, int ctrl);
extern unsigned int func_020905a8(unsigned int value);

void func_020942b0(void) {
    int source;
    u32 size;
    size = data_021a6710.remaining;
    if (size == 0) return;
    if (size >= 0x1d8) size = 0x1d8;
    source = data_021a6710.source;
    data_021a6710.remaining -= size;
    data_021a6710.source = source + size;
    if (data_021a6710.remaining == 0) {
        func_020906dc(data_021a6710.channel, func_0209423c, 0);
        func_01ff8770(data_021a6710.channel, source, 0x04000400, 0xc4400000 | (size >> 2));
        func_020905a8(0x200000);
    } else {
        func_01ff8770(data_021a6710.channel, source, 0x04000400, 0x84400000 | (size >> 2));
        func_020905a8(0x200000);
    }
}
