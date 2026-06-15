; func_0206ea90 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0206e1e8
        .global func_0206ea90
        .arm
func_0206ea90:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    ldr ip, [r1]
    ldr r0, [r0]
    mov r2, ip, lsr #0x18
    mov r4, r0, lsr #0x18
    mov lr, r0, lsr #0x8
    mov r1, ip, lsr #0x8
    mov r5, r0, lsl #0x8
    mov r3, ip, lsl #0x8
    mov r0, r0, lsl #0x18
    mov ip, ip, lsl #0x18
    and r4, r4, #0xff
    and lr, lr, #0xff00
    and r2, r2, #0xff
    and r1, r1, #0xff00
    and r5, r5, #0xff0000
    orr r4, r4, lr
    and r3, r3, #0xff0000
    orr r1, r2, r1
    and lr, r0, #-16777216
    orr r0, r5, r4
    and r2, ip, #-16777216
    orr r1, r3, r1
    orr r0, lr, r0
    orr r1, r2, r1
    bl func_0206e1e8
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, lr}
    bx lr
