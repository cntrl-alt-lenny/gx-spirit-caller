/* func_0201f700: tag-based dispatch + helper (sp1p5 default — natural form).
 *
 *     push  {r3, lr}
 *     ldrh  r0, [r0, #0x2]
 *     cmp   r0, #0x0
 *     beq   .L_0201f770
 *     bl    func_0201f148
 *     bl    func_02020b30
 *     pop   {r3, pc}
 * .L_0201f770:
 *     bl    func_0201f750
 *     cmp   r0, #0x0
 *     popne {r3, pc}
 *     ldr   r0, .L_0201f79c
 *     ldr   r1, [r0, #0x38]
 *     cmp   r1, #0x0
 *     beq   .L_0201f794
 *     ldr   r0, .L_0201f7a0
 *     blx   r1
 * .L_0201f794:
 *     bl    func_02020b30
 *     pop   {r3, pc}
 * .L_0201f79c: .word data_02191e60
 * .L_0201f7a0: .word data_020c64b8
 */

typedef void (*fn_0201f754_t)(void *p);

typedef struct {
    char            _pad[0x38];
    fn_0201f754_t   fn;          /* +0x38 */
} container_0201f754_t;

typedef struct {
    char              _pad0[0x2];
    unsigned short    tag;       /* +0x2 */
} arg_0201f754_t;

extern container_0201f754_t data_02191e60;
extern void *data_020c64b8;
extern void func_0201f148(unsigned int tag);
extern int  func_0201f750(void);
extern void func_02020b30(void);

void func_0201f700(arg_0201f754_t *arg) {
    if (arg->tag != 0) {
        func_0201f148(arg->tag);
        func_02020b30();
        return;
    }
    if (func_0201f750() != 0) return;
    if (data_02191e60.fn != 0) {
        data_02191e60.fn(&data_020c64b8);
    }
    func_02020b30();
}
