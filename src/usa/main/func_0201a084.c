/* func_0201a084: GetSystemWork + call + scale field by table value.
 *
 *     push  {r4, lr}
 *     bl    GetSystemWork
 *     mov   r4, r0
 *     mov   r0, #0x6
 *     bl    func_0201a13c
 *     ldr   r1, [r4, #0x8e4]
 *     lsr   r1, r1, #0x19          ; r1 = field >> 25 (top 7 bits)
 *     mul   r0, r1, r0
 *     lsr   r0, r0, #0xc           ; / 4096
 *     pop   {r4, pc}
 */

typedef struct {
    char _pad0[0x8e4];
    unsigned int f_8e4;
} sys_work_t;

extern sys_work_t *GetSystemWork(void);
extern int func_0201a13c(int x);

unsigned int func_0201a084(void) {
    sys_work_t *sw = GetSystemWork();
    int x = func_0201a13c(6);
    return ((sw->f_8e4 >> 25) * x) >> 12;
}
