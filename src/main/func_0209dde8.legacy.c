extern char data_021a8d30[];
extern int func_020924c0(void *queue, unsigned short **out, int a);
extern void func_0209240c(void *queue, unsigned short *msg, int a);
extern void func_020928cc(void *ptr, int size);

unsigned short *func_0209dde8(void) {
    unsigned short *msg;
    if (func_020924c0(data_021a8d30, &msg, 0) == 0) {
        return 0;
    }
    func_020928cc(msg, 2);
    if (*msg & 0x8000) {
        return msg;
    }
    func_0209240c(data_021a8d30, msg, 1);
    return 0;
}
