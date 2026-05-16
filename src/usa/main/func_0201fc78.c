/* func_0201fc78: tag-based dispatch + arg9 helper (sp1p5 default — natural form).
 *
 *     push  {r3, lr}
 *     ldrh  r0, [r0, #0x2]
 *     cmp   r0, #0x0
 *     beq   .L_0201fcec
 *     bl    func_0201f148
 *     mov   r0, #0x9
 *     bl    func_0201f0e4
 *     pop   {r3, pc}
 * .L_0201fcec:
 *     bl    func_0201fcd0
 *     cmp   r0, #0x0
 *     popne {r3, pc}
 *     ldr   r0, .L_0201fd1c
 *     ldr   r1, [r0, #0x38]
 *     cmp   r1, #0x0
 *     beq   .L_0201fd10
 *     ldr   r0, .L_0201fd20
 *     blx   r1
 * .L_0201fd10:
 *     mov   r0, #0x9
 *     bl    func_0201f0e4
 *     pop   {r3, pc}
 * .L_0201fd1c: .word data_02191e60
 * .L_0201fd20: .word data_020c65b8
 */

typedef void (*fn_0201fccc_t)(void *p);

typedef struct {
    char            _pad[0x38];
    fn_0201fccc_t   fn;          /* +0x38 */
} container_0201fccc_t;

typedef struct {
    char              _pad0[0x2];
    unsigned short    tag;       /* +0x2 */
} arg_0201fccc_t;

extern container_0201fccc_t data_02191e60;
extern void *data_020c65b8;
extern void func_0201f148(unsigned int tag);
extern int  func_0201fcd0(void);
extern void func_0201f0e4(int x);

void func_0201fc78(arg_0201fccc_t *arg) {
    if (arg->tag != 0) {
        func_0201f148(arg->tag);
        func_0201f0e4(9);
        return;
    }
    if (func_0201fcd0() != 0) return;
    if (data_02191e60.fn != 0) {
        data_02191e60.fn(&data_020c65b8);
    }
    func_0201f0e4(9);
}
