; func_020526b8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219e3ec
        .extern func_020930b0
        .global func_020526b8
        .arm
func_020526b8:
    stmdb sp!, {r4, lr}
    ldr r2, _LIT0
    ldr r3, [r2]
    cmp r3, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    mov r2, #0x30
    mul r4, r0, r2
    add r0, r3, r4
    str r1, [r0, #0x2c]
    bl func_020930b0
    ldr r2, _LIT0
    ldr r2, [r2]
    add r2, r2, r4
    str r0, [r2, #0x24]
    str r1, [r2, #0x28]
    mov r0, #0x1
    ldmia sp!, {r4, pc}
_LIT0: .word data_0219e3ec
