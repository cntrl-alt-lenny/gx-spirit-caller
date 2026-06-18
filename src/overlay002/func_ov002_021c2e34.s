; func_ov002_021c2e34 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf180
        .extern func_0202df78
        .global func_ov002_021c2e34
        .arm
func_ov002_021c2e34:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r2, _LIT0
    and r0, r0, #0x1
    mul r2, r0, r2
    ldr r0, _LIT1
    mov r5, r1
    ldr r0, [r0, r2]
    subs r4, r0, #0x1
    bmi .L_164
    ldr r0, _LIT2
    add r0, r0, r2
    add r0, r0, #0x18
    add r0, r0, #0x400
    add r6, r0, r4, lsl #0x2
.L_138:
    ldr r0, [r6]
    mov r1, r5
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202df78
    cmp r0, #0x0
    movne r0, r4
    ldmneia sp!, {r4, r5, r6, pc}
    sub r6, r6, #0x4
    subs r4, r4, #0x1
    bpl .L_138
.L_164:
    mvn r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf180
_LIT2: .word data_ov002_022cf16c
