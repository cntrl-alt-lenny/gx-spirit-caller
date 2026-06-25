; func_ov002_022122a4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern func_ov002_021c2d54
        .extern func_ov002_021d7c1c
        .global func_ov002_022122a4
        .arm
func_ov002_022122a4:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrh r0, [r4, #0x2]
    ldr r1, _LIT0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021c2d54
    movs ip, r0
    bmi .L_884
    ldrh r1, [r4, #0x2]
    ldr r3, _LIT1
    ldr r0, _LIT2
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    and r2, r1, #0x1
    mla r0, r2, r0, r3
    add r0, r0, #0x18
    add r2, r0, #0x400
    mov r0, r4
    add r2, r2, ip, lsl #0x2
    bl func_ov002_021d7c1c
.L_884:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word 0x000012e5
_LIT1: .word data_ov002_022cf08c
_LIT2: .word 0x00000868
