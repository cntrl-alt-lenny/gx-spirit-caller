; func_ov002_021d7c88 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021b3fd8
        .extern func_ov002_021c93f0
        .extern func_ov002_021d7b44
        .extern func_ov002_021df6d4
        .extern func_ov002_021df938
        .global func_ov002_021d7c88
        .arm
func_ov002_021d7c88:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    movs r2, r1
    ldmmiia sp!, {r3, r4, r5, pc}
    mov r1, #0xb
    bl func_ov002_021c93f0
    mov r4, r0
    mov r0, r5
    mov r1, r4
    mov r2, #0x0
    bl func_ov002_021d7b44
    ldr r1, [r4]
    ldr r2, _LIT0
    mov r0, r1, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r3, r1, lsl #0x12
    mov r1, r0, lsl #0x1
    add r3, r1, r3, lsr #0x1f
    mov r0, r5
    mov r1, #0xb
    bl func_ov002_021b3fd8
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r1, _LIT0
    mov r0, r5
    bl func_ov002_021df6d4
    ldr r3, _LIT0
    mov r0, r5
    mov r1, #0x7d0
    mov r2, #0x0
    bl func_ov002_021df938
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x00001379
