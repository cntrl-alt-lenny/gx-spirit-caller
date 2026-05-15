/* func_0200852c: 7-call sequence with conditional 50-iter loop + final field set.
 *
 *     push  {r4, lr}
 *     bl    func_02007f3c
 *     bl    func_02034a18
 *     bl    func_0200857c
 *     cmp   r0, #0x0
 *     beq   .L_02008580
 *     bl    func_02008aac
 *     bl    func_02009610
 *     mov   r4, #0x0
 *   .L_02008580_loop:
 *     mov   r0, r4
 *     bl    func_02009230
 *     add   r4, r4, #0x1
 *     cmp   r4, #0x32
 *     blt   .L_02008580_loop
 *   .L_02008580:
 *     ldr   r0, .L_02008594       ; r0 = data_02104e5c
 *     mvn   r1, #0x0
 *     str   r1, [r0, #0xc]
 *     mov   r0, #0x1
 *     pop   {r4, pc}
 */

extern void func_02007f3c(void);
extern void func_02034a18(void);
extern int  func_0200857c(void);
extern void func_02008aac(void);
extern void func_02009610(void);
extern int  func_02009230(int i);

typedef struct {
    char _pad0[0xc];
    int  f_c;
} state_02104f3c_t;
extern state_02104f3c_t data_02104e5c;

int func_0200852c(void) {
    func_02007f3c();
    func_02034a18();
    if (func_0200857c()) {
        int i;
        func_02008aac();
        func_02009610();
        for (i = 0; i < 0x32; i++) {
            func_02009230(i);
        }
    }
    data_02104e5c.f_c = -1;
    return 1;
}
