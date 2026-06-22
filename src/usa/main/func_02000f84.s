; func_02000f84 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02102b80
        .extern data_02103fcc
        .extern func_02000c4c
        .global func_02000f84
        .arm
func_02000f84:
    stmdb sp!, {r3, lr}
    ldr r1, _LIT0
    ldr r0, [r1, #0xb64]
    add r0, r0, #0x1
    str r0, [r1, #0xb64]
    bl func_02000c4c
    ldr r2, _LIT1
    ldr r1, _LIT0
    str r0, [r2]
    mov r0, #0x0
    str r0, [r1, #0xb6c]
    str r0, [r1, #0xb70]
    str r0, [r1, #0xb74]
    str r0, [r1, #0xb78]
    ldmia sp!, {r3, pc}
_LIT0: .word data_02103fcc
_LIT1: .word data_02102b80
