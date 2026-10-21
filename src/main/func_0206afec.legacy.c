extern void *__memcpy(void *dst, const void *src, unsigned long n);
void func_0206afec(unsigned char **a0, int a1, int *a2) {
    __memcpy(*a0, &a1, 4);
    *a2 += 4;
    *a0 += 4;
}
