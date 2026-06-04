/* func_ov017_021b2ce4: hit-test the touch point against rect r (x,y u16 +
 * w,h u8) — returns 1 if the pen is down and inside.
 *
 *     add r0,sp,#4; add r1,sp,#0; bl func_02006110   ; x->[sp+4], y->[sp+0]
 *     bl func_020061ac; cmp r0,#0; beq .fail
 *     ldrh r1,[r4,#0]; ldr r2,[sp,#4]; cmp r1,r2; bgt .fail
 *     ldrb r0,[r4,#4]; add r0,r1,r0; cmp r0,r2; ble .fail
 *     ldrh r1,[r4,#2]; ldr r2,[sp,#0]; cmp r1,r2; bgt .fail
 *     ldrb r0,[r4,#5]; add r0,r1,r0; cmp r0,r2; movgt r0,#1; retgt
 */

extern void func_02006110(int *x, int *y);
extern int func_020061ac(void);

typedef struct {
    unsigned short x;
    unsigned short y;
    unsigned char w;
    unsigned char h;
} Rect;

int func_ov017_021b2ce4(Rect *r) {
    int x, y;
    func_02006110(&x, &y);
    if (func_020061ac() != 0 &&
        r->x <= x && r->x + r->w > x &&
        r->y <= y && r->y + r->h > y)
        return 1;
    return 0;
}
