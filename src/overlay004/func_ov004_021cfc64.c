typedef struct {
    unsigned int a, b;
    unsigned char _pad8[0x14];
    struct { unsigned int low8:8; unsigned int:24; };
    unsigned char _pad20[4];
    struct { unsigned int:17; unsigned int mid4:4; unsigned int:11; };
} state_t;
extern state_t data_02102c90;
extern int Task_PostLocked(void *arg0, int arg1, int arg2);
extern void Task_InvokeLocked(void *p);
extern void func_02094504(int value, void *dest, int size);
extern void func_02001d0c(state_t *p, int a, int b);
extern int func_020054a4(int text, int size);
extern void func_02004f58(int a, int b, int c, int d, int e, int f);
extern void func_02092904(void *p, int size);
extern void func_0208fd30(void *p, int dest, int size);
void func_ov004_021cfc64(int slot, int text) {
    int buf;
    int x;
    int i;
    int base;
    buf = Task_PostLocked((void *)0x600, 4, 0);
    func_02094504(0, (void *)buf, 0x600);
    func_02001d0c(&data_02102c90, 0x18, 2);
    x = 0x60 - func_020054a4(text, 0xc) / 2;
    if (x <= 0) x = 0;
    func_02004f58((int)&data_02102c90, text, buf, x, 1, 0xc);
    func_02092904((void *)buf, 0x600);
    base = (slot * 3 << 10) / 2 + 0x80;
    for (i = 0; i < 6; i++) {
        func_0208fd30((void *)(buf + i * 0x80), base, 0x80);
        func_0208fd30((void *)(buf + i * 0x80 + 0x300), ((slot * 3 << 10) / 2 + 0x80) + (i * 2 + 1) * 0x80, 0x80);
        base += 0x100;
    }
    Task_InvokeLocked((void *)buf);
}





