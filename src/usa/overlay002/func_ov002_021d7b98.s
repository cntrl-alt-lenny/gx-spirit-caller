; func_ov002_021d7b98 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021b3ef8
        .extern func_ov002_021c9310
        .extern func_ov002_021d7a54
        .extern func_ov002_021df5e4
        .extern func_ov002_021df848
        .global func_ov002_021d7b98
        .arm
func_ov002_021d7b98:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    movs r2, r1
    ldmmiia sp!, {r3, r4, r5, pc}
    mov r1, #0xb
    bl func_ov002_021c9310
    mov r4, r0
    mov r0, r5
    mov r1, r4
    mov r2, #0x0
    bl func_ov002_021d7a54
    ldr r1, [r4]
    ldr r2, _LIT0
    mov r0, r1, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r3, r1, lsl #0x12
    mov r1, r0, lsl #0x1
    add r3, r1, r3, lsr #0x1f
    mov r0, r5
    mov r1, #0xb
    bl func_ov002_021b3ef8
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r1, _LIT0
    mov r0, r5
    bl func_ov002_021df5e4
    ldr r3, _LIT0
    mov r0, r5
    mov r1, #0x7d0
    mov r2, #0x0
    bl func_ov002_021df848
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x00001379
