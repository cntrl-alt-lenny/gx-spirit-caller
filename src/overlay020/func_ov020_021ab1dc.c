typedef struct {
    unsigned int a, b;
    unsigned char pad8[0x14];
    struct { unsigned int low8:8; unsigned int:24; };
    unsigned int flags;
    struct { unsigned int:17; unsigned int mid4:4; unsigned int:11; };
} state_t;
extern state_t data_02102c90[];
extern char data_02104f4c[];
extern void *func_0208df0c(void);
extern int func_ov020_021aa700(int idx, int sub, char *out);
extern int func_ov020_021aa4a0(void *arg0, signed char *arg1);
extern int Task_PostLocked(void *arg0, int arg1, int arg2);
extern void Task_InvokeLocked(void *p);
extern void Fill32(int value, void *dest, int size);
extern void func_02001d68(int arg);
extern int func_020054a4(void *p, int n);
extern void func_02001d0c(state_t *p, int a, int b);
extern void func_02001c98(unsigned int a, unsigned int b);
extern int func_02004fb8(int a, int b, int c, int d, int e);
extern int func_02001e5c(void *p);
extern void func_02005088(int a0, int a1, int a2, int a3, int a4, int a5);

void func_ov020_021ab1dc(int page, int idx, int sub) {
    int offset;
    char *base;
    int size;
    char *raw;
    char *text;
    int width;
    int height;
    base = (char *)func_0208df0c() + 0x20;
    offset = page * 0xc80;
    size = (func_ov020_021aa700(idx, sub + 1, 0) + 4) & ~3;
    raw = (char *)Task_PostLocked((void *)size, 4, 0);
    Fill32(0, raw, size);
    func_ov020_021aa700(idx, sub + 1, raw);
    size = (func_ov020_021aa4a0(0, (signed char *)raw) + 4) & ~3;
    text = (char *)Task_PostLocked((void *)size, 4, 0);
    Fill32(0, text, size);
    func_ov020_021aa4a0(text, (signed char *)raw);
    func_02001d68((unsigned int)(*(int *)(data_02104f4c + 4) << 29) >> 29);
    data_02102c90[0].flags &= ~0x800000;
    if (func_020054a4(text, 14) + 2 <= 200) width = 9;
    else width = 1;
    func_02001d0c(data_02102c90, 25, 4);
    func_02001d68((unsigned int)(*(int *)(data_02104f4c + 4) << 29) >> 29);
    func_02001c98(15, 1);


    height = 14;
    func_02004fb8((long)data_02102c90, (int)text, 2, width, height);
    if (func_02001e5c(data_02102c90) == 0) height = 12;
    func_02005088((unsigned long)data_02102c90, (int)text, (int)(base + offset), 1, width, height);
    Task_InvokeLocked(text);
    Task_InvokeLocked(raw);
}








