; func_020a6a60 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a9e50
        .extern func_020a6aac
        .extern func_020b41bc
        .global func_020a6a60
        .arm
func_020a6a60:
    stmdb sp!, {r4, lr}
    ldr r1, _LIT0
    mov r4, r0
    ldr r0, [r1, #0xc]
    cmp r0, #0x0
    bne .L_3c
    bl func_020b41bc
    ldr r0, _LIT0
    ldr r0, [r0, #0x4]
    cmp r0, #0x0
    beq .L_3c
    blx r0
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0, #0x4]
.L_3c:
    mov r0, r4
    bl func_020a6aac
    ldmia sp!, {r4, pc}
_LIT0: .word data_021a9e50
