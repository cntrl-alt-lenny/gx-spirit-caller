/* func_ov020_021aa7ac: point-in-rect test — is the touch point inside the
 * rect (rx, ry, w, h)?
 *
 *     add r0,sp,#4; add r1,sp,#0; bl func_02006110   ; reads x->[sp+4], y->[sp+0]
 *     ldr r2,[sp,#4]; cmp r2,r7; ldrge r1,[sp,#0]; cmpge r1,r6; blt .fail
 *     add r0,r7,r5; cmp r2,r0; addle r0,r6,r4; cmple r1,r0; movle r0,#1; pople
 *  .fail: mov r0,#0; pop
 */

extern void func_02006110(int *out_x, int *out_y);

int func_ov020_021aa7ac(int rx, int ry, int w, int h) {
    int x, y;
    func_02006110(&x, &y);
    if (x >= rx && y >= ry && x <= rx + w && y <= ry + h) return 1;
    return 0;
}
