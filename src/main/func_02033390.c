typedef struct Ctx02032a34 Ctx02032a34;
extern void func_02032888(int, int, int, int, void *);
extern void func_02032a34(int, int, Ctx02032a34 *);
extern void func_02032c44(void *, int);
extern void func_02032cc8(void *, void *, void *);
extern void func_02032cfc(void *);
extern void func_02032d2c(void *, void *);
extern int func_02046c60(int, int);
extern int func_0204706c(unsigned short *, int, int, int);
extern void func_0204757c(void *, void *, int, int, int, int, int, int, int);
extern int func_020526b8(int, int);
extern int func_02052798(int);
extern int func_020527b8(int);
extern int func_020527d8(int);
extern int func_020527f8(int);
int func_02033390(char *self)
{
    char *sub = self + 0xdfc;
    int i;
    int result;
    func_0204757c(self + 4, sub + 0x40,
        *(int *)(self + 0xe8c), *(int *)(self + 0xe90),
        *(int *)(self + 0xe94), *(int *)(self + 0xe98),
        *(int *)(self + 0xe9c), *(int *)(sub + 0x80),
        *(int *)(self + 0xeac));
    func_02046c60((int)func_02032888, (int)self);
    func_020527d8((int)func_02032cc8);
    func_020527b8((int)func_02032cfc);
    for (i = 0; i < *(int *)(self + 0xea0); i++)
        func_020526b8((unsigned char)i, 0);
    func_020527f8((int)func_02032d2c);
    func_02052798((int)func_02032c44);
    *(unsigned int *)(self + 0xeb4) &= ~0x100;
    result = func_0204706c((unsigned short *)(sub + 0xc), 0, (int)func_02032a34, (int)self);
    *(unsigned int *)(self + 0xeb4) |= 1;
    return result;
}


