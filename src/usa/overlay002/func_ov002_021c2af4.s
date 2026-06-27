; func_ov002_021c2af4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0a0
        .extern func_ov002_021b9118
        .extern func_ov002_021c2a6c
        .global func_ov002_021c2af4
        .arm
func_ov002_021c2af4:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r6, r0
    ldr r0, _LIT0
    and r2, r6, #0x1
    mul r3, r2, r0
    ldr r0, _LIT1
    mov r5, r1
    ldr r0, [r0, r3]
    subs r4, r0, #0x1
    bmi .L_6d8
    ldr r0, _LIT2
    add r0, r0, r3
    add r0, r0, #0x18
    add r0, r0, #0x400
    add r7, r0, r4, lsl #0x2
.L_6a8:
    mov r0, r7
    mov r1, r5
    bl func_ov002_021b9118
    cmp r0, #0x0
    beq .L_6cc
    mov r0, r6
    mov r1, r4
    bl func_ov002_021c2a6c
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_6cc:
    sub r7, r7, #0x4
    subs r4, r4, #0x1
    bpl .L_6a8
.L_6d8:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf0a0
_LIT2: .word data_ov002_022cf08c
