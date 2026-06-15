; func_ov000_021abd50 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Fill32
        .global func_ov000_021abd50
        .arm
func_ov000_021abd50:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r6, r0
    mov r7, r1
    mov r5, r2
    mov r1, r6
    mov r0, #0x0
    mov r2, #0x14
    mov r4, r3
    bl Fill32
    ldr r2, [r6]
    ldr r0, _LIT0
    ldr r3, _LIT1
    and r2, r2, r0
    mov r0, r7, lsl #0x17
    orr ip, r2, r0, lsr #0x11
    ldr r1, [sp, #0x18]
    and r8, ip, r3
    mov r3, r5, lsl #0x17
    orr r3, r8, r3, lsr #0x8
    ldr r0, [sp, #0x20]
    ldr r7, [sp, #0x1c]
    and r2, r1, #0xff
    and r1, r7, #0xff
    and r0, r0, #0xff
    ldr lr, [sp, #0x24]
    add r7, r5, r7
    mov r5, lr, lsl #0x10
    mov ip, r5, lsr #0x10
    bic r8, r3, #-16777216
    and lr, r4, #0xff
    orr r3, r8, lr, lsl #0x18
    str r3, [r6]
    ldr r3, [r6, #0x4]
    ldr r5, [sp, #0x28]
    bic r3, r3, #0xff
    orr r3, r3, r2
    bic r2, r3, #0xff00
    mov r1, r1, lsl #0x18
    orr r2, r2, r1, lsr #0x10
    bic r1, r2, #0xff0000
    mov r0, r0, lsl #0x18
    orr r0, r1, r0, lsr #0x8
    str r0, [r6, #0x4]
    ldr r0, [r6, #0x8]
    mov r1, ip, lsl #0x10
    mov r0, r0, lsl #0x10
    orr r0, r1, r0, lsr #0x10
    str r0, [r6, #0x8]
    ldr r0, [r6, #0xc]
    and r4, r5, #0xff
    bic r0, r0, #0xff
    orr r2, r0, r4
    ldr r0, _LIT2
    and r1, r2, r0
    mov r0, r7, lsl #0x17
    orr r0, r1, r0, lsr #0x6
    str r0, [r6, #0xc]
    ldr r0, [r6]
    bic r0, r0, #0x1
    orr r0, r0, #0x3
    str r0, [r6]
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word 0xffff803f
_LIT1: .word 0xff007fff
_LIT2: .word 0xfc01ffff
