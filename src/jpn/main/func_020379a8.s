; func_020379a8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020fe3a0
        .extern data_0219b200
        .extern func_0208ade0
        .extern func_0208aec4
        .global func_020379a8
        .arm
func_020379a8:
    stmdb sp!, {r4, lr}
    ldr r1, _LIT0
    mov r4, r0
    ldr r2, [r1, #0x58]
    cmp r2, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldrsh r1, [r1, #0x10]
    cmp r1, #0x0
    movge r0, #0x0
    ldmgeia sp!, {r4, pc}
    ldr r1, _LIT1
    ldrsh r1, [r1]
    cmp r1, #0x0
    blt .L_44
    bl func_0208ade0
    b .L_60
.L_44:
    mov r0, r2
    mov r2, r4
    mov r1, #0x3000
    bl func_0208aec4
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
.L_60:
    ldr r1, _LIT1
    mov r0, #0x1
    strh r4, [r1]
    ldmia sp!, {r4, pc}
_LIT0: .word data_0219b200
_LIT1: .word data_020fe3a0
