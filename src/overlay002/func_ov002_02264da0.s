; func_ov002_02264da0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021b3ecc
        .extern func_ov002_021b4120
        .extern func_ov002_021d5b80
        .extern func_ov002_021df6d4
        .extern func_ov002_021df938
        .global func_ov002_02264da0
        .arm
func_ov002_02264da0:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r2, _LIT0
    mov r1, #0xb
    mov r5, r0
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    moveq r0, #0x1
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r2, _LIT0
    mov r0, r5
    mov r1, #0xb
    bl func_ov002_021b4120
    mov r4, r0
    ldr r1, _LIT0
    mov r0, r5
    bl func_ov002_021df6d4
    ldr r3, _LIT0
    mov r0, r5
    mov r1, r4
    mov r2, #0x0
    bl func_ov002_021df938
    ldr r2, _LIT0
    mov r0, r5
    mov r1, #0xb
    mov r3, #0x0
    bl func_ov002_021d5b80
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x000018fe
