; func_0209d004 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a83e0
        .extern data_021a8a20
        .extern func_02094770
        .extern func_0209d05c
        .global func_0209d004
        .arm
func_0209d004:
    stmdb sp!, {r4, lr}
    ldr r4, _LIT0
    ldr r1, _LIT1
    ldr r0, [r4, #0x28]
    ldr r2, [r4, #0x20]
    mov r3, #0x200
    bl func_02094770
    ldr r1, [r4, #0x1c]
    mov r0, r1, lsr #0x8
    orr r0, r0, #-1224736768
    mov r1, r1, lsl #0x18
    bl func_0209d05c
    ldr r0, _LIT2
    ldr r1, _LIT3
    ldr r0, [r0, #0x4]
    str r0, [r1]
    ldmia sp!, {r4, lr}
    bx lr
_LIT0: .word data_021a83e0
_LIT1: .word 0x04100010
_LIT2: .word data_021a8a20
_LIT3: .word 0x040001a4
