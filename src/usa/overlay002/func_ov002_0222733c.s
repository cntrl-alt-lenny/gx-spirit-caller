; func_ov002_0222733c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf098
        .extern func_ov002_021d7b2c
        .extern func_ov002_021de318
        .extern func_ov002_021e2a4c
        .extern func_ov002_021e2b6c
        .extern func_ov002_0225761c
        .global func_ov002_0222733c
        .arm
func_ov002_0222733c:
    stmdb sp!, {r4, lr}
    ldr r1, _LIT0
    mov r4, r0
    ldr r0, [r1, #0x5a8]
    cmp r0, #0x7f
    beq .L_3b4
    cmp r0, #0x80
    bne .L_408
    bl func_ov002_021e2a4c
    mov r0, r4
    bl func_ov002_0225761c
    mov r1, r0
    mov r0, r4
    bl func_ov002_021de318
    mov r0, #0x7f
    ldmia sp!, {r4, pc}
.L_3b4:
    ldrh r0, [r4, #0x2]
    ldr r1, _LIT1
    ldr r2, _LIT2
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    and r3, r0, #0x1
    mul ip, r3, r1
    ldr r1, [r2, ip]
    cmp r1, #0x0
    beq .L_3fc
    ldr r1, _LIT3
    mov r2, #0x0
    add r1, r1, ip
    add r1, r1, #0x120
    bl func_ov002_021d7b2c
    mov r0, #0x7f
    ldmia sp!, {r4, pc}
.L_3fc:
    bl func_ov002_021e2b6c
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_408:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf098
_LIT3: .word data_ov002_022cf08c
