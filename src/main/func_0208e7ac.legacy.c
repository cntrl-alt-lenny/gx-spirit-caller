typedef unsigned int u32;

extern int func_0208e4ec(int *p);
extern int func_0208e518(int *p);

void func_0208e7ac(void)
{
    int a;
    int b;
    *(u32 *)0x04000600 |= 0x8000;
    do {
    } while (func_0208e518(&a) != 0);
    do {
    } while (func_0208e4ec(&b) != 0);
    *(u32 *)0x04000440 = 3;
    *(u32 *)0x04000454 = 0;
    *(u32 *)0x04000440 = 0;
    if (b != 0) {
        *(u32 *)0x04000448 = b;
    }
    *(u32 *)0x04000454 = 0;
    *(u32 *)0x04000440 = 2;
    *(u32 *)0x04000448 = a;
    *(u32 *)0x04000454 = 0;
}
