; func_02037918 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219b200
        .extern data_0219b3b0
        .extern func_020398cc
        .extern func_020918f0
        .extern func_02091c3c
        .global func_02037918
        .arm
func_02037918:
    stmdb sp!, {r3, lr}
    sub sp, sp, #0x8
    ldr r3, _LIT0
    mov ip, r1
    ldrh r1, [r3, #0x12]
    mov lr, r0
    ldr r0, _LIT1
    orr r1, r1, #0x2
    strh r1, [r3, #0x12]
    str ip, [sp]
    str r2, [sp, #0x4]
    ldr r1, _LIT2
    add r3, lr, ip
    mov r2, #0x0
    bl func_02091c3c
    ldr r0, _LIT1
    bl func_020918f0
    ldr r0, _LIT1
    add sp, sp, #0x8
    ldmia sp!, {r3, pc}
_LIT0: .word data_0219b200
_LIT1: .word data_0219b3b0
_LIT2: .word func_020398cc
