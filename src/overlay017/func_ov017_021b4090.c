/* func_ov017_021b4090: offset a box by (dx,dy) onto the stack and forward to
 * func_ov017_021b3fa4 with the first three args passed through. Stack args
 * dx/dy are int (orig uses ldr); the adds narrow on the strh stores.
 *
 *     ldrh r4,[r3,#0]; ldr lr,[sp,#0x18]; ldr ip,[sp,#0x1c]
 *     add r4,r4,lr; strh r4,[sp,#0]
 *     ldrh lr,[r3,#2]; add ip,lr,ip; strh ip,[sp,#2]
 *     ldrh ip,[r3,#6]; strh ip,[sp,#6]
 *     ldrh ip,[r3,#8]; add r3,sp,#0; strh ip,[sp,#8]; bl func_ov017_021b3fa4
 */

typedef struct {
    unsigned short f0, f2, f4, f6, f8, fa;
} Box;

extern void func_ov017_021b3fa4(int a1, int a2, int a3, void *box);

void func_ov017_021b4090(int a1, int a2, int a3, Box *src, int dx, int dy) {
    Box local;
    local.f0 = src->f0 + dx;
    local.f2 = src->f2 + dy;
    local.f6 = src->f6;
    local.f8 = src->f8;
    func_ov017_021b3fa4(a1, a2, a3, &local);
}
