/* The assembly SVC wrapper returns a character in r0 despite its void C declaration. */
extern int func_020b41d4(void);

int func_020b41f8(void *self, char *arr, unsigned int *countPtr) {
    unsigned int i;
    unsigned int count = *countPtr;
    for (i = 0; i < count; i++) {
        int c = func_020b41d4();
        arr[i] = c;
        if ((unsigned char)c == 0xd || (unsigned char)c == 0xa) {
            *countPtr = i + 1;
            break;
        }
    }
    return 0;
}
