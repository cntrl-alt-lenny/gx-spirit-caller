; func_ov002_021c2b74 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0a0
        .extern func_ov002_021b90e4
        .extern func_ov002_021b90f0
        .global func_ov002_021c2b74
        .arm
func_ov002_021c2b74:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    ldr r2, _LIT0
    and r0, r0, #0x1
    mul r6, r0, r2
    ldr r0, _LIT1
    ldr r2, [r0, r6]
    subs r4, r2, #0x1
    ldmmiia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r0, _LIT2
    add r5, r0, r6
    add r0, r5, #0x18
    add r0, r0, #0x400
    add ip, r0, r4, lsl #0x2
.L_34:
    ldr r3, [ip]
    mov r0, r3, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r3, r3, lsl #0x12
    mov r0, r0, lsl #0x1
    add r0, r0, r3, lsr #0x1f
    cmp r1, r0
    bne .L_c4
    ldr r0, _LIT2
    add r0, r0, r6
    add r0, r0, #0x18
    add r1, r0, #0x400
    add r0, r1, r4, lsl #0x2
    add r1, r1, r2, lsl #0x2
    bl func_ov002_021b90f0
    ldr r0, _LIT1
    ldr r0, [r0, r6]
    cmp r4, r0
    ldmcsia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r1, _LIT2
    add r0, r5, #0x18
    add r0, r0, #0x400
    add r7, r1, r6
    add r5, r0, r4, lsl #0x2
    add r0, r7, #0x18
    add r6, r0, #0x400
.L_9c:
    add r1, r4, #0x1
    mov r0, r5
    add r1, r6, r1, lsl #0x2
    bl func_ov002_021b90e4
    ldr r0, [r7, #0x14]
    add r4, r4, #0x1
    cmp r4, r0
    add r5, r5, #0x4
    bcc .L_9c
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_c4:
    sub ip, ip, #0x4
    subs r4, r4, #0x1
    bpl .L_34
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf0a0
_LIT2: .word data_ov002_022cf08c
