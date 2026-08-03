/* func_020379c4: zeroes one halfword field and sets two more to
 * 0xffff on a fixed struct, then tail-calls func_02088f94. Ships as
 * asm -- natural C reached 27% and mwcc wouldn't reproduce the tail
 * call (bx, not bl+return) or the exact field-store order.
 */

extern char data_0219b2e0[];
extern void func_02088f94(void);

asm void func_020379c4(void) {
    nofralloc
    ldr r1, =data_0219b2e0
    mov r2, #0x0
    strh r2, [r1, #0x2]
    sub r2, r2, #0x1
    strh r2, [r1, #0xe]
    ldr ip, =func_02088f94
    strh r2, [r1, #0x10]
    bx ip
}
