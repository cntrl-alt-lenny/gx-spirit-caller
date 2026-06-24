; func_02041d6c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02070f40
        .extern func_02094500
        .global func_02041d6c
        .arm
func_02041d6c:
    stmdb sp!, {r4, lr}
    ldr r1, _LIT0
    mov r4, r0
    add r0, r4, r1
    mov r1, #0x0
    mov r2, #0x64
    bl func_02094500
    ldr r0, _LIT1
    add r1, r4, #0x1000
    str r0, [r1, #0x170]
    ldr r3, [r1, #0x9c8]
    ldr r0, _LIT0
    ldr r2, _LIT2
    str r3, [r1, #0x174]
    str r2, [r1, #0x17c]
    ldr r2, [r1, #0x9cc]
    add r0, r4, r0
    str r2, [r1, #0x180]
    bl func_02070f40
    ldmia sp!, {r4, pc}
_LIT0: .word 0x00001134
_LIT1: .word 0x00000b68
_LIT2: .word 0x000005ea
