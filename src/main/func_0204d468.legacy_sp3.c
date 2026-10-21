extern void *func_020498f0(void);
/* Copy32 consumes source, destination and byte count in r0-r2. */
extern void Copy32(const void *, void *, unsigned int);
typedef struct {
    char pad[0x348];
    unsigned int count;
    unsigned int value;
    unsigned int data[1];
} State;
void func_0204d468(unsigned int a, unsigned int *b) {
    int count = b[0] + 2;
    if ((unsigned int)count > 2) {
        int size = count - 2;
        void *destination = (char *)func_020498f0() + 0x350;
        Copy32((char *)b + 4, destination, size << 2);
    }
    ((State *)func_020498f0())->count = count - 1;
    ((State *)func_020498f0())->value = a;
}






