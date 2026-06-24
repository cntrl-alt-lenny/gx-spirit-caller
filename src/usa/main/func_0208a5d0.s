; func_0208a5d0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern func_0207cef4
        .extern func_0207cf0c
        .extern func_0208a59c
        .global func_0208a5d0
        .arm
func_0208a5d0:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r8, r0
    mov r7, r1
    bl OS_DisableIrq
    mov r6, r0
    mov r0, r8
    mov r1, #0x0
    bl func_0207cef4
    movs r5, r0
    beq .L_64
.L_28:
    mov r0, r8
    mov r1, r5
    bl func_0207cef4
    ldr r1, [r5, #0x8]
    mov r4, r0
    cmp r1, r7
    bne .L_58
    mov r0, r8
    mov r1, r5
    bl func_0207cf0c
    mov r0, r5
    bl func_0208a59c
.L_58:
    mov r5, r4
    cmp r4, #0x0
    bne .L_28
.L_64:
    mov r0, r6
    bl OS_RestoreIrq
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
