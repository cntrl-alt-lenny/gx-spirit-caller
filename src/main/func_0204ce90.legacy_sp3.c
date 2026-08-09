/* func_0204ce90: clears 3 fields on the func_020498f0() singleton
 * (fresh call each time -- see func_0204be40.c's documented
 * convention), stashes a func_020930b0() tick pair, then dispatches
 * on ->f15 across 3 mutually-exclusive guards, each either returning
 * 0 directly or funneling into a shared "return 1" exit.
 */

typedef struct {
    char _pad_00[0x15];
    unsigned char f15;
    char _pad_16[0x1a7 - 0x16];
    unsigned char f1a7;
    char _pad_1a8[0x1cc - 0x1a8];
    int f1cc;
    int f1d0;
    char _pad_1d4[0x204 - 0x1d4];
    int f204;
    int f208;
} Singleton0204ce90;

extern Singleton0204ce90 *func_020498f0(void);
extern long long func_020930b0(void);
extern void func_020498dc(int x);
extern int func_0204aaf4(void);
extern int func_0204f0a8(int x);
extern void func_0204cf7c(int a, int b, void *c);
extern int func_0204d438(void);
extern void func_02050054(int a, int b);

int func_0204ce90(void *arg0) {
    long long t;

    func_020498f0()->f208 = 0;
    func_020498f0()->f204 = 0;
    func_020498f0()->f1a7 = 0;

    {
        Singleton0204ce90 *r4 = func_020498f0();
        t = func_020930b0();
        r4->f1cc = (int)t;
        r4->f1d0 = (int)(t >> 32);
    }

    if (func_020498f0()->f15 != 0) goto check2;

    func_020498dc(3);
    func_0204f0a8(0);
    if (func_0204aaf4() == 0) goto success;
    return 0;

check2:
    if (func_020498f0()->f15 != 1) goto check3;

    func_0204cf7c(0, 0, arg0);
    if (func_0204d438() == 0) goto success;
    return 0;

check3:
    if (func_020498f0()->f15 != 3) goto success;

    func_02050054(6, 0xfffec5e6);
    return 0;

success:
    return 1;
}
