extern unsigned char func_020497a8(int arg0, char *out1, char *out2, int arg3);
extern int func_02049710(int a0, int a1, int a2, int a3, int *a4);

int func_02033ac0(unsigned char *obj, unsigned char *out, int buffer, int input, int mask)
{
    int extra;
    unsigned char first, second;
    int result;
    int dest;
    if (buffer != 0) dest = buffer;
    else dest = 0;
    extra = 0;
    if (*obj == 1) {
        result = func_020497a8(input, (char *)&first, (char *)&second, dest);
    } else {
        result = func_02049710(input, (int)&first, (int)&second, dest, &extra);
    }
    if ((1 << result) & mask) {
        out[1] = result;
        out[2] = (unsigned char)first;
        out[3] = (unsigned char)second;
        if (buffer != 0) {
            *(int *)(buffer + 0x100) = extra;
        }
        return 1;
    }
    return 0;
}




