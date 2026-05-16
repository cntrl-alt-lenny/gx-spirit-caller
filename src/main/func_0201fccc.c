/* func_0201fccc: tag-based dispatch + arg9 helper (sp1p5 default — natural form).
 *
 *     push  {r3, lr}
 *     ldrh  r0, [r0, #0x2]
 *     cmp   r0, #0x0
 *     beq   .L_0201fcec
 *     bl    func_0201f19c
 *     mov   r0, #0x9
 *     bl    func_0201f138
 *     pop   {r3, pc}
 * .L_0201fcec:
 *     bl    func_0201fd24
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
 *     bl    func_0201f138
 *     pop   {r3, pc}
 * .L_0201fd1c: .word data_02191f40
 * .L_0201fd20: .word data_020c6698
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

extern container_0201fccc_t data_02191f40;
extern void *data_020c6698;
extern void func_0201f19c(unsigned int tag);
extern int  func_0201fd24(void);
extern void func_0201f138(int x);

void func_0201fccc(arg_0201fccc_t *arg) {
    if (arg->tag != 0) {
        func_0201f19c(arg->tag);
        func_0201f138(9);
        return;
    }
    if (func_0201fd24() != 0) return;
    if (data_02191f40.fn != 0) {
        data_02191f40.fn(&data_020c6698);
    }
    func_0201f138(9);
}
