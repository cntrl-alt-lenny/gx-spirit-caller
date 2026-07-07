; func_ov002_0224d108 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0a0
        .extern func_0202e1e0
        .extern func_ov002_02253370
        .global func_ov002_0224d108
        .arm
func_ov002_0224d108:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r4, r0
    rsb r8, r4, #0x1
    ldr r0, _LIT0
    and r1, r8, #0x1
    mul r2, r1, r0
    ldr r0, _LIT1
    mov r5, #0x0
    ldr r0, [r0, r2]
    cmp r0, #0x0
    bls .L_7c
    ldr r0, _LIT2
    mov r9, #0xe
    add r7, r0, r2
    add r0, r7, #0x18
    add r6, r0, #0x400
.L_40:
    ldr r0, [r6]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202e1e0
    cmp r0, #0x0
    beq .L_68
    mov r0, r8
    mov r1, r9
    mov r2, r5
    bl func_ov002_02253370
.L_68:
    ldr r0, [r7, #0x14]
    add r5, r5, #0x1
    cmp r5, r0
    add r6, r6, #0x4
    bcc .L_40
.L_7c:
    ldr r0, _LIT0
    and r2, r4, #0x1
    mul r1, r2, r0
    ldr r0, _LIT1
    mov r7, #0x0
    ldr r0, [r0, r1]
    cmp r0, #0x0
    ldmlsia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldr r0, _LIT2
    mov r8, #0xe
    add r6, r0, r1
    add r0, r6, #0x18
    add r5, r0, #0x400
.L_b0:
    ldr r0, [r5]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202e1e0
    cmp r0, #0x0
    beq .L_d8
    mov r0, r4
    mov r1, r8
    mov r2, r7
    bl func_ov002_02253370
.L_d8:
    ldr r0, [r6, #0x14]
    add r7, r7, #0x1
    cmp r7, r0
    add r5, r5, #0x4
    bcc .L_b0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf0a0
_LIT2: .word data_ov002_022cf08c
