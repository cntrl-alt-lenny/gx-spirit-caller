; func_ov002_02211ebc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf1a2
        .extern data_ov002_022cf1a4
        .extern func_ov002_021d6808
        .extern func_ov002_0223df38
        .global func_ov002_02211ebc
        .arm
func_ov002_02211ebc:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x8
    mov r4, r0
    ldrh r1, [r4, #0x4]
    mov r1, r1, lsl #0x1d
    movs r1, r1, lsr #0x1f
    addne sp, sp, #0x8
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    add r2, sp, #0x4
    mov r1, #0x0
    bl func_ov002_0223df38
    cmp r0, #0x0
    beq .L_40c
    ldr r3, [sp, #0x4]
    ldr r0, _LIT0
    and r1, r3, #0xff
    and r2, r1, #0x1
    mul ip, r2, r0
    mov r0, r3, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x8
    ldr r3, _LIT1
    and r2, r0, #0xff
    mov r0, #0x14
    smulbb lr, r2, r0
    add r0, r3, ip
    ldrh r0, [lr, r0]
    cmp r0, #0x0
    beq .L_40c
    ldr r0, _LIT2
    add r0, r0, ip
    ldrh r0, [lr, r0]
    cmp r0, #0x0
    beq .L_3fc
    mov ip, #0x1
    mov r0, r4
    mov r3, #0x0
    str ip, [sp]
    bl func_ov002_021d6808
    b .L_40c
.L_3fc:
    mov r3, #0x1
    mov r0, r4
    str r3, [sp]
    bl func_ov002_021d6808
.L_40c:
    mov r0, #0x0
    add sp, sp, #0x8
    ldmia sp!, {r4, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf1a2
_LIT2: .word data_ov002_022cf1a4
