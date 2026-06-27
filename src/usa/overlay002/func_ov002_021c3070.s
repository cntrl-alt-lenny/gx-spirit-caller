; func_ov002_021c3070 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0a8
        .extern func_ov002_021b9118
        .extern func_ov002_021c2fdc
        .global func_ov002_021c3070
        .arm
func_ov002_021c3070:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r5, r0
    ldr r0, _LIT0
    and r3, r5, #0x1
    mul r2, r3, r0
    ldr r0, _LIT1
    mov r4, r1
    ldr r0, [r0, r2]
    mov r6, #0x0
    cmp r0, #0x0
    bls .L_1b8
    ldr r0, _LIT2
    add r8, r0, r2
    add r7, r8, #0x5d0
.L_180:
    mov r0, r7
    mov r1, r4
    bl func_ov002_021b9118
    cmp r0, #0x0
    beq .L_1a4
    mov r0, r5
    mov r1, r6
    bl func_ov002_021c2fdc
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_1a4:
    ldr r0, [r8, #0x1c]
    add r6, r6, #0x1
    cmp r6, r0
    add r7, r7, #0x4
    bcc .L_180
.L_1b8:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf0a8
_LIT2: .word data_ov002_022cf08c
