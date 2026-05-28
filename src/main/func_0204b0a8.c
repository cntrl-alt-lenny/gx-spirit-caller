/* func_0204b0a8: 2 helpers + helper3 returns u64 → struct field write.
 *
 *     push  {r4, lr}
 *     bl    helper1
 *     mov   r1, #0
 *     strb  r1, [r0, #429]
 *     bl    helper1
 *     mov   r4, r0
 *     bl    helper3
 *     str   r0, [r4, #504]
 *     str   r1, [r4, #508]
 *     pop   {r4, pc}
 *
 * Brief 241 C-42 sub-shape (struct-returning-u64). The helper3 returns
 * a `long long` which mwcc lowers to a (r0, r1) pair; the two stores
 * at +504/+508 write the low/high halves.
 */

struct Func0204b0a8Target {
    char pad[429];
    unsigned char f429;
    char pad2[74];
    int f504;
    int f508;
};

extern struct Func0204b0a8Target *func_020498f0(void);
extern long long func_020930b0(void);

void func_0204b0a8(void) {
    long long v;
    struct Func0204b0a8Target *p;
    func_020498f0()->f429 = 0;
    p = func_020498f0();
    v = func_020930b0();
    p->f504 = (int)v;
    p->f508 = (int)(v >> 32);
}
