; func_0202a178 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Fill32
        .extern Task_PostLocked
        .extern data_0219a854
        .extern func_0202a944
        .global func_0202a178
        .arm
func_0202a178:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r4, _LIT0
    mov r5, r0
    mov r1, r4
    mov r0, #0x0
    mov r2, #0x8
    bl Fill32
    ldr r0, _LIT1
    str r5, [r0, #0x4]
    ldr r0, [r0]
    cmp r0, #0x0
    bne .L_5ac
    ldr r1, [r4, #0x4]
    mov r0, #0xec
    mul r5, r1, r0
    mov r0, r5
    mov r1, #0x4
    mov r2, #0x0
    bl Task_PostLocked
    mov r1, r0
    mov r2, r5
    mov r0, #0x0
    str r1, [r4]
    bl Fill32
.L_5ac:
    bl func_0202a944
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_0219a854
_LIT1: .word data_0219a854
