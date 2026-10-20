extern void *func_020498f0(void);
extern int func_0204e9b8(int, int, int, const int *, int);
/* The caller consumes r0, although the existing C definition declares void. */
extern int func_0204e914(void *, int, void *, char *);
extern int OS_SNPrintf(char *, int, const char *, ...);
extern void func_02094688(const void *, void *, int);
/* Copy32's existing definition has a void parameter list; the machine routine takes three arguments. */
extern void Copy32(const void *, void *, int);
extern unsigned long long func_020930b0(void);
extern char data_020ff968[];
extern char data_020ff9e8[];
int func_0204ead0(unsigned char type, void *arg1, int arg2, int arg3, const int *values, int count) {
    char buffer[0x200];
    char temp[0x10];
    int result;
    int length = 0;
    int i;
    if (*((unsigned char *)func_020498f0() + 0x15) == 0 ||
        ((*((unsigned char *)func_020498f0() + 0x15) == 3 ||
          *((unsigned char *)func_020498f0() + 0x1a6) != 0) && type == 6)) {
        result = func_0204e9b8(type, arg2, arg3, values, count);
    } else {
        if (values != 0 && count != 0) {
            length = OS_SNPrintf(buffer, 0x200, data_020ff968, values[0]);
            for (i = 1; i < count; i++) {
                int n = OS_SNPrintf(temp, 0x10, data_020ff9e8, values[i]);
                func_02094688(temp, buffer + length, n);
                length += n;
            }
        }
        buffer[length] = 0;
        result = func_0204e914(*(void **)func_020498f0(), type, arg1, buffer);
    }
    if (type == 2 || type == 6 || (unsigned char)(type + 0xf8) <= 1) {
        char *g;
        *((unsigned char *)func_020498f0() + 0x3cc) = type;
        *(unsigned short *)((char *)func_020498f0() + 0x3ce) = arg3;
        *(int *)((char *)func_020498f0() + 0x3d0) = arg2;
        *(void **)((char *)func_020498f0() + 0x454) = arg1;
        *(int *)((char *)func_020498f0() + 0x458) = count;
        g = func_020498f0();
        *(unsigned long long *)(g + 0x45c) = func_020930b0();
        if (values != 0 && count != 0) {
            void *dest = (char *)func_020498f0() + 0x3d4;
            Copy32(values, dest, count * 4);
        }
    }
    return result;
}

