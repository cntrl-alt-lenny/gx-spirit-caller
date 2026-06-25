; func_ov002_02264a3c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021b3dec
        .extern func_ov002_021d5a90
        .extern func_ov002_021df5e4
        .extern func_ov002_021df848
        .global func_ov002_02264a3c
        .arm
func_ov002_02264a3c:
    stmdb sp!, {r4, lr}
    ldr r2, _LIT0
    mov r1, #0xb
    mov r4, r0
    bl func_ov002_021b3dec
    cmp r0, #0x0
    moveq r0, #0x1
    ldmeqia sp!, {r4, pc}
    ldr r1, _LIT0
    mov r0, r4
    bl func_ov002_021df5e4
    ldr r2, _LIT0
    mov r0, r4
    mov r1, #0xb
    mov r3, #0x0
    bl func_ov002_021d5a90
    ldr r3, _LIT0
    rsb r0, r4, #0x1
    mov r1, #0x3e8
    mov r2, #0x1
    bl func_ov002_021df848
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word 0x00001a9d
