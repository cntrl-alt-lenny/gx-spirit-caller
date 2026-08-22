/* func_0203f544: build a small record on the stack from a0, fold it
 * into a second stack buffer, then stamp a substring of a1 into a
 * fixed byte offset of that buffer. Pure side-effecting init, no
 * return value. */

extern void func_02099298(void *a0);
extern void func_020991a4(void *a0, void *a1, int a2);
extern void func_020990e0(void *a0, void *a1);
extern void func_02094688(void *a0, void *a1, int a2);

void func_0203f544(void *a0, void *a1) {
    unsigned char bufB[0x14];
    unsigned char bufA[0x58];

    func_02099298(bufA);
    func_020991a4(bufA, a0, 0x18);
    func_020990e0(bufB, bufA);
    func_02094688(bufB + 3, a1, 0xd);
}
