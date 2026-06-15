; func_02093d44 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .global func_02093d44
        .arm
func_02093d44:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl OS_DisableIrq
    mov r1, #0x6
    mul r1, r4, r1
    add r1, r1, #0x5
    mov r1, r1, lsl #0x1
    add r1, r1, #0x4000000
    ldrh r2, [r1, #0xb0]
    cmp r4, #0x0
    bic r2, r2, #0x3a00
    strh r2, [r1, #0xb0]
    ldrh r2, [r1, #0xb0]
    bic r2, r2, #0x8000
    strh r2, [r1, #0xb0]
    ldrh r2, [r1, #0xb0]
    ldrh r1, [r1, #0xb0]
    bne .L_124
    mov r1, #0xc
    mul ip, r4, r1
    ldr r1, _LIT0
    add r2, ip, #0x4000000
    mov r3, #0x0
    str r3, [r2, #0xb0]
    add r2, ip, r1
    ldr r1, _LIT1
    str r3, [r2, #0x4]
    str r1, [r2, #0x8]
.L_124:
    bl OS_RestoreIrq
    ldmia sp!, {r4, lr}
    bx lr
_LIT0: .word 0x040000b0
_LIT1: .word 0x81400001
