; func_02006934 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Fill32
        .extern Task_PostLocked
        .extern data_02104e3c
        .extern func_0207d3f4
        .extern func_0209053c
        .extern func_020928c4
        .extern func_02092b90
        .extern func_02092ba4
        .extern func_02098300
        .global func_02006934
        .arm
func_02006934:
    stmdb sp!, {r4, lr}
    ldr r1, _LIT0
    mov r0, #0x0
    mov r2, #0x20
    bl Fill32
    ldr r1, _LIT1
    mvn r2, #0x0
    str r2, [r1, #0xc]
    mov r0, #0x0
    str r2, [r1, #0x8]
    bl func_02092b90
    mov r4, r0
    mov r0, #0x0
    bl func_02092ba4
    add r1, r4, #0x3
    bic r2, r0, #0x3
    bic r0, r1, #0x3
    sub r4, r2, r0
    mov r1, r4
    mov r0, #0x0
    mov r2, #0x4
    bl func_020928c4
    mov r1, r4
    mov r2, #0x0
    bl func_0207d3f4
    ldr r1, _LIT1
    str r0, [r1, #0x1c]
    mov r0, #0x40000
    bl func_0209053c
    mov r0, #0x0
    mov r1, r0
    bl func_02098300
    mov r4, r0
    mov r1, #0x4
    mov r2, r1
    bl Task_PostLocked
    mov r1, r4
    bl func_02098300
    ldmia sp!, {r4, pc}
_LIT0: .word data_02104e3c
_LIT1: .word data_02104e3c
