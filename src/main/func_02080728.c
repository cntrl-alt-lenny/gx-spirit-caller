/* func_02080728: data_020beedc[capped_log2(a3)][capped_log2(a2)] row-table
 * lookup (see data_020beedc.c), forwarding to func_020808b8 with the two
 * looked-up bytes packed into a word. Ships as inline asm: mwcc has no
 * clz idiom recognition (see func_02079e4c.c / func_020b319c.c), so no
 * natural C loop reliably emits the `clz`/`rsb` capped-log2 pair; this is
 * a direct transliteration of the target disassembly.
 */

extern void func_020808b8(void);
extern unsigned char data_020beedc[4][4][2];
extern void func_02080d38(void);
extern void func_02080cdc(void);
extern void func_020808f0(void);

asm void func_02080728(void) {
    nofralloc
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x18
    cmp r2, #0x8
    movlt r4, r2
    movge ip, #0x3
    clzlt r4, r4
    rsblt ip, r4, #0x1f
    cmp r3, #0x8
    movlt r4, r3
    movge r6, #0x3
    clzlt r4, r4
    rsblt r6, r4, #0x1f
    ldr r4, =data_020beedc
    ldr r5, [sp, #0x28]
    add r4, r4, r6, lsl #0x3
    ldrb r6, [r4, ip, lsl #0x1]
    add ip, r4, ip, lsl #0x1
    ldr r4, =func_02080d38
    strb r6, [sp, #0x14]
    ldrb r6, [ip, #0x1]
    ldr lr, =func_02080cdc
    ldr ip, =func_020808f0
    strb r6, [sp, #0x15]
    str r5, [sp]
    str r4, [sp, #0x4]
    str lr, [sp, #0x8]
    str ip, [sp, #0xc]
    ldr ip, [sp, #0x14]
    str ip, [sp, #0x10]
    bl func_020808b8
    add sp, sp, #0x18
    ldmia sp!, {r4, r5, r6, pc}
}
