struct S02074b90;
struct S0980 { char pad[8]; unsigned char f_8; char pad9[0x33]; int f_3c, f_40, f_44; };
extern void func_02070980(int arg0, struct S0980 *s);
extern int func_02070ac0(int *out, void *arg1);
extern void *func_02094688(void *dst, const void *src, int n);
int func_02075d74(void *a, int b, struct S02074b90 *conn)
{
    int length;
    do {
        void *buffer = (void *)func_02070ac0(&length, conn);
        if (length == 0) return -1;
        if ((unsigned int)length > (unsigned int)b) length = b;
        func_02094688(buffer, a, length);
        func_02070980(length, (struct S0980 *)conn);
        b -= length;
        a = (char *)a + length;
    } while (b > 0);
    return 0;
}
