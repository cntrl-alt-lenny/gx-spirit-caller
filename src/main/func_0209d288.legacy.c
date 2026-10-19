typedef unsigned int u32;
typedef struct {
    int *buffer;
    int command;
    char pad[0x10c];
    volatile u32 flags;
} Context;
extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int saved);
extern void func_02091a8c(void *q);
extern void func_020928cc(void *p, u32 size);
extern void func_02092904(void *p, u32 size);
extern void DC_WaitWriteBufferEmpty(void);
extern void func_02093814(int count);
extern int func_02096358(int a, int b, int c);
extern int func_0209640c(int bit, int idx);
int func_0209d288(Context *p, int command, int count) {
    int saved;
    int result;
    if (!(p->flags & 2)) {
        p->flags |= 2;
        while (!func_0209640c(11, 1)) {
            func_02093814(100);
        }
        func_0209d288(p, 0, 1);
    }
    func_02092904(p->buffer, 0x60);
    DC_WaitWriteBufferEmpty();
    do {
        p->command = command;
        p->flags |= 0x20;
        while (func_02096358(11, command, 1) < 0) {}
        if (command == 0) {
            int buffer = (int)p->buffer;
            while (func_02096358(11, buffer, 1) < 0) {}
        }
        saved = OS_DisableIrq();
        while (p->flags & 0x20) {
            func_02091a8c(0);
        }
        OS_RestoreIrq(saved);
        func_020928cc(p->buffer, 0x60);
        result = *p->buffer;
    } while (result == 4 && --count > 0);
    return result == 0;
}

