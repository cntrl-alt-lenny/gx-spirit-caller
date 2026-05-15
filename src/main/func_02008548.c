/* func_02008548: 7-call sequence with conditional 50-iter loop + final field set.
 *
 *     push  {r4, lr}
 *     bl    func_02007f58
 *     bl    func_02034a68
 *     bl    func_02008598
 *     cmp   r0, #0x0
 *     beq   .L_02008580
 *     bl    func_02008ac8
 *     bl    func_0200962c
 *     mov   r4, #0x0
 *   .L_02008580_loop:
 *     mov   r0, r4
 *     bl    func_0200924c
 *     add   r4, r4, #0x1
 *     cmp   r4, #0x32
 *     blt   .L_02008580_loop
 *   .L_02008580:
 *     ldr   r0, .L_02008594       ; r0 = data_02104f3c
 *     mvn   r1, #0x0
 *     str   r1, [r0, #0xc]
 *     mov   r0, #0x1
 *     pop   {r4, pc}
 */

extern void func_02007f58(void);
extern void func_02034a68(void);
extern int  func_02008598(void);
extern void func_02008ac8(void);
extern void func_0200962c(void);
extern int  func_0200924c(int i);

typedef struct {
    char _pad0[0xc];
    int  f_c;
} state_02104f3c_t;
extern state_02104f3c_t data_02104f3c;

int func_02008548(void) {
    func_02007f58();
    func_02034a68();
    if (func_02008598()) {
        int i;
        func_02008ac8();
        func_0200962c();
        for (i = 0; i < 0x32; i++) {
            func_0200924c(i);
        }
    }
    data_02104f3c.f_c = -1;
    return 1;
}
