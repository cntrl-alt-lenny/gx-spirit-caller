; func_ov002_021aeb5c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf170
        .extern data_ov002_022d0250
        .global func_ov002_021aeb5c
        .arm
func_ov002_021aeb5c:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    ldr r2, _LIT0
    and r5, r0, #0x1
    mul ip, r5, r2
    mov r4, #0x0
    ldr lr, _LIT1
    mov r5, r0, lsl #0x1f
    bic r2, r4, #0x2000
    ldr r6, _LIT2
    orr r5, r2, r5, lsr #0x12
    sub r0, r4, #0x2000
    ldr r3, [lr, ip]
    and r5, r5, r0
    and r0, r1, r6
    orr r0, r5, r0
    bic r7, r0, #0x3fc00000
    mov r0, r3, lsl #0x18
    orr r0, r7, r0, lsr #0x2
    add r2, r3, #0x1
    mov r3, r0, lsl #0x2
    mov r5, r1, lsl #0x10
    add r1, sp, #0x0
    str r4, [r1]
    mov r3, r3, lsr #0x18
    str r2, [lr, ip]
    mov r7, r0, lsl #0x12
    mov r1, r3, lsl #0x1
    add r3, r1, r7, lsr #0x1f
    mov r7, r3, lsl #0x2
    ldr r1, _LIT3
    sub r2, r4, #0x2000
    ldrh ip, [r1, r7]
    and r3, r6, r5, lsr #0x10
    str r0, [sp]
    and r2, ip, r2
    orr r2, r2, r3
    strh r2, [r1, r7]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf170
_LIT2: .word 0x00001fff
_LIT3: .word data_ov002_022d0250
