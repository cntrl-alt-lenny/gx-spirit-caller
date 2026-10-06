extern int func_02075df4(void *ctx, void *message);
extern void func_020705d4(void *message, int size, int a, int b, void *conn);
void func_0207475c(void *conn)
{
    unsigned char *ctx = *(unsigned char **)((char *)conn + 12);
    if (ctx[0x455] == 8) {
        unsigned char message[28];
        int length;
        message[0] = 21; message[1] = 3; message[2] = 0; message[3] = 0;
        message[4] = 2; message[5] = 1; message[6] = 0;
        length = func_02075df4(ctx, message);
        func_020705d4(message, length, 0, 0, conn);
    }
    ctx[0x455] = 0;
}
