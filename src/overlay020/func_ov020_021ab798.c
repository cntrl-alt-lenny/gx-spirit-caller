/* func_ov020_021ab798: compute the two layout metrics for table row a0 into
 * *out1 / *out2, via the per-row params at data_adfa4[a0]/data_adfa8[a0]
 * (stride 0x10).
 *
 *     ldr ip,=adfa4; ldr r1,[ip,r6,lsl#4]; mov r0,r3; bl func_0201ed74; str r0,[r5]
 *     ldr r1,=adfa8; ldr r0,[sp,#0x10]; ldr r1,[r1,r6,lsl#4]; bl func_0201ed3c; str r0,[r4]
 */

extern char data_ov020_021adfa4[];
extern char data_ov020_021adfa8[];
extern int func_0201ed74(int a, int b);
extern int func_0201ed3c(int a, int b);

void func_ov020_021ab798(int a0, int *out1, int *out2, int a3, int a4) {
    *out1 = func_0201ed74(a3, *(int *)(data_ov020_021adfa4 + a0 * 0x10));
    *out2 = func_0201ed3c(a4, *(int *)(data_ov020_021adfa8 + a0 * 0x10));
}
