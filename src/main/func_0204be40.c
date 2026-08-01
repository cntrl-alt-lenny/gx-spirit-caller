/* func_0204be40 (main): clears three fields on the singleton returned by
 * func_020498f0() (called fresh each time, never cached across calls),
 * then dispatches on ->f208 / ->f15. */

typedef struct {
    char _pad_00[0x15];
    unsigned char f15;
    char _pad_16[0x17 - 0x16];
    unsigned char f17;
    char _pad_18[0x20 - 0x18];
    int f20;
    char _pad_24[0x1a8 - 0x24];
    unsigned char f1a8;
    char _pad_1a9[0x208 - 0x1a9];
    int f208;
} Singleton;

extern Singleton *func_020498f0(void);
extern void func_020498dc(int x);
extern int  func_0204aaf4(void);
extern int  func_0204f0a8(int x);
extern int  func_0204d284(int a, int b);
extern int  func_0204d438(void);
extern void func_0204bf44(int x);

int func_0204be40(void) {
    int result;

    func_020498f0()->f17 = 0;
    func_020498f0()->f20 = 0;
    func_020498f0()->f1a8 = 0;

    if (func_020498f0()->f208 != 0) {
        if (func_020498f0()->f15 == 0) {
            func_020498dc(3);
            result = func_0204f0a8(0);
            if (func_0204aaf4() != 0)
                return result;
        } else if (func_020498f0()->f15 == 1) {
            func_020498dc(4);
            result = func_0204d284(func_020498f0()->f208, 0);
            if (func_0204d438() != 0)
                return result;
        }
    } else {
        func_0204bf44(1);
    }
    return 0;
}
