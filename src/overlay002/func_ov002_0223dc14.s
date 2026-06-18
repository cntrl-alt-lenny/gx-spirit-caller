; func_ov002_0223dc14 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov002_0223dc14
        .arm
func_ov002_0223dc14:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x4
    ldrh r4, [sp]
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    bic r4, r4, #0x1
    and r1, r1, #0x1
    orr r1, r4, r1
    strh r1, [sp]
    ldrh r4, [sp]
    mov r1, r2, lsl #0x10
    mov r1, r1, lsr #0x10
    bic r2, r4, #0x1e
    mov r1, r1, lsl #0x1c
    orr r1, r2, r1, lsr #0x1b
    strh r1, [sp]
    mov r1, r3, lsl #0x10
    ldrh r3, [r0, #0x6]
    mov lr, r1, lsr #0x10
    ldrh r4, [sp]
    ldr r1, _LIT0
    mov r2, r3, lsl #0x10
    mov ip, r2, lsr #0x18
    add r2, ip, #0x1
    mov r2, r2, lsl #0x10
    mov r2, r2, lsr #0x10
    and r4, r4, r1
    mov r1, lr, lsl #0x17
    orr r1, r4, r1, lsr #0x12
    strh r1, [sp]
    ldrh lr, [sp]
    bic r3, r3, #0xff00
    mov r1, r2, lsl #0x18
    bic r2, lr, #0xc000
    strh r2, [sp]
    orr r2, r3, r1, lsr #0x10
    ldrh r1, [sp]
    strh r2, [r0, #0x6]
    add r0, r0, ip, lsl #0x1
    strh r1, [r0, #0x8]
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, pc}
_LIT0: .word 0xffffc01f
