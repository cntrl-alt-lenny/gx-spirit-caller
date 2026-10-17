typedef struct { int pad0; unsigned int f4 : 3; unsigned int p : 29; char pad[0xb00 - 8]; unsigned char b00; } G;
extern G data_02104f4c;
extern unsigned int data_02105a68[];
extern char data_02105a4d[];
extern char data_020c59c4[];
extern void func_0202adf8(void *);
extern void func_0202ae1c(unsigned int);
extern void func_0202c070(unsigned int);
extern void func_02011b9c(void *, void *);
extern int func_0202c0c0(int);
extern void func_020aadf8(void *, int);
extern void func_0202ba94(unsigned int, int);
extern void func_0202c1ac(void);
extern void func_0202af40(void);
void func_020138b8(void) {
    char buf[0x3c];
    unsigned int i; unsigned int *tb;
    func_0202adf8(buf);
    func_0202ae1c(data_02104f4c.f4);
    func_0202c070(data_02104f4c.f4);
    func_02011b9c(data_02105a68, data_020c59c4);
    func_020aadf8(data_02105a4d, func_0202c0c0(0x29));
    tb = data_02105a68;
    i = 0;
    data_02104f4c.b00 = data_02104f4c.f4;
    for (; i < tb[0]; i++) {
        func_0202ba94(((unsigned short *)tb)[6 + i], 1);
    }
    func_0202c1ac();
    func_0202af40();
}
