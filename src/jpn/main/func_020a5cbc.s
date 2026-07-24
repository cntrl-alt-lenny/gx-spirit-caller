; func_020a5cbc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern data_021a9854
        .extern OS_SetDPermissionsForProtectionRegion
        .extern CTRDG_IsOptionCartridge
        .global func_020a5cbc
        .arm
func_020a5cbc:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r5, r0
    bl OS_DisableIrq
    ldr r1, _LIT0
    mov r4, r0
    str r5, [r1]
    bl CTRDG_IsOptionCartridge
    cmp r0, #0x0
    bne .L_3c
    cmp r5, #0x0
    movne r1, #0x1000
    moveq r1, #0x5000
    mov r0, #0xf000
    bl OS_SetDPermissionsForProtectionRegion
.L_3c:
    mov r0, r4
    bl OS_RestoreIrq
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, lr}
    bx lr
_LIT0: .word data_021a9854
