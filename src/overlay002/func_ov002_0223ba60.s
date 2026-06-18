; func_ov002_0223ba60 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf178
        .extern func_ov002_0223b864
        .global func_ov002_0223ba60
        .arm
func_ov002_0223ba60:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r6, r0
    ldr r0, _LIT0
    and r1, r6, #0x1
    mul r5, r1, r0
    ldr r0, _LIT1
    mov r4, #0x0
    ldr r0, [r0, r5]
    cmp r0, #0x0
    bls .L_70
    ldr r0, _LIT2
    mov r7, #0xb
    add r8, r0, r5
.L_34:
    mov r0, r6
    mov r1, r7
    mov r2, r4
    bl func_ov002_0223b864
    cmp r0, #0x0
    beq .L_60
    ldr r0, _LIT2
    add r0, r0, r5
    add r0, r0, #0x120
    add r0, r0, r4, lsl #0x2
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_60:
    ldr r0, [r8, #0xc]
    add r4, r4, #0x1
    cmp r4, r0
    bcc .L_34
.L_70:
    mov r4, #0x0
    mov r7, r4
.L_78:
    mov r0, r6
    mov r1, r4
    mov r2, r7
    bl func_ov002_0223b864
    cmp r0, #0x0
    beq .L_a8
    ldr r1, _LIT2
    mov r0, #0x14
    add r1, r1, r5
    add r1, r1, #0x30
    mla r0, r4, r0, r1
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_a8:
    add r4, r4, #0x1
    cmp r4, #0x4
    ble .L_78
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf178
_LIT2: .word data_ov002_022cf16c
