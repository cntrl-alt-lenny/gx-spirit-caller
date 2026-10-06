typedef struct { unsigned char pad[0x2260]; int state; unsigned char pad2264[0x1c]; unsigned short f2280; } GxState;
extern GxState *data_021a088c;
extern int func_0207b0e0(int status, int a, int b, int c, int d);
int func_0207b13c(int a, int b, int c, int d)
{
    short status = data_021a088c->f2280;
    data_021a088c->f2280 = 0;
    return func_0207b0e0(status, a, b, c, d);
}
