; func_ov020_021ab9d0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov020_021ae060
        .extern data_ov020_021ae0a8
        .extern func_0207e638
        .extern func_ov020_021aa8f0
        .global func_ov020_021ab9d0
        .arm
func_ov020_021ab9d0:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x10
    ldr r2, _LIT0
    mov r5, r0
    ldr r0, [r2, #0xa98]
    mov r3, #0xd8000
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    cmp r0, #0x1
    mov r4, r1
    ldr r0, _LIT1
    moveq r1, #0x1
    movne r1, #0x0
    mov r1, r1, lsl #0x10
    mov r2, #0x0
    ldr r0, [r0, #0x924]
    mov r1, r1, lsr #0x10
    str r3, [sp, #0x8]
    str r2, [sp, #0xc]
    bl func_0207e638
    mov ip, #0x0
    mov r2, r0
    mov r1, r4
    add r3, sp, #0x8
    mov r0, r5
    str ip, [sp]
    sub r4, ip, #0x1
    str r4, [sp, #0x4]
    bl func_ov020_021aa8f0
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov020_021ae060
_LIT1: .word data_ov020_021ae0a8
