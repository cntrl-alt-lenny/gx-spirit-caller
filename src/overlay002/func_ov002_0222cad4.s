; func_ov002_0222cad4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd744
        .extern data_ov002_022ce288
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf178
        .extern data_ov002_022d016c
        .extern func_ov002_021ae400
        .extern func_ov002_021d7c1c
        .extern func_ov002_021decac
        .extern func_ov002_021e27c0
        .extern func_ov002_0222ca78
        .extern func_ov002_022577dc
        .extern func_ov002_022592ec
        .extern func_ov002_022593f4
        .extern func_ov002_02290500
        .global func_ov002_0222cad4
        .arm
func_ov002_0222cad4:
    stmdb sp!, {r4, lr}
    ldr r1, _LIT0
    mov r4, r0
    ldr r1, [r1, #0x5a8]
    cmp r1, #0x7e
    beq .L_c8
    cmp r1, #0x7f
    beq .L_84
    cmp r1, #0x80
    bne .L_158
    ldrh r3, [r4, #0x2]
    ldr r1, _LIT1
    ldr r2, _LIT2
    mov r3, r3, lsl #0x1f
    mov r3, r3, lsr #0x1f
    rsb r3, r3, #0x1
    and r3, r3, #0x1
    mul r1, r3, r1
    ldr r1, [r2, r1]
    cmp r1, #0x0
    bne .L_64
    bl func_ov002_022577dc
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
.L_64:
    ldrh r0, [r4, #0x2]
    mov r1, #0x1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_021e27c0
    mov r0, #0x7f
    ldmia sp!, {r4, pc}
.L_84:
    ldrh r0, [r4, #0x2]
    ldr r1, _LIT3
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    ldr r1, [r1, r0, lsl #0x2]
    cmp r1, #0x1
    bne .L_b0
    ldrh r1, [r4]
    ldr r2, _LIT4
    bl func_ov002_02290500
    b .L_c0
.L_b0:
    mov r1, #0x3a
    bl func_ov002_021ae400
    ldr r0, _LIT4
    bl func_ov002_022592ec
.L_c0:
    mov r0, #0x7e
    ldmia sp!, {r4, pc}
.L_c8:
    bl func_ov002_022593f4
    cmp r0, #0x0
    beq .L_150
    ldr r2, _LIT5
    ldr ip, [r2, #0xd74]
    cmp ip, #0xb
    bne .L_11c
    ldrh r0, [r4, #0x2]
    ldr ip, _LIT6
    ldr r1, _LIT1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    and r3, r0, #0x1
    mla ip, r3, r1, ip
    ldr r1, [r2, #0xd78]
    add r2, ip, #0x120
    add r1, r2, r1, lsl #0x2
    mov r2, #0x1
    bl func_ov002_021d7c1c
    b .L_130
.L_11c:
    ldr r3, [r2, #0xd78]
    ldr r1, [r2, #0xd70]
    mov r0, r4
    add r2, ip, r3
    bl func_ov002_021decac
.L_130:
    ldrh r0, [r4, #0x2]
    mov r1, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_021e27c0
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_150:
    mov r0, #0x7f
    ldmia sp!, {r4, pc}
.L_158:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf178
_LIT3: .word data_ov002_022cd744
_LIT4: .word func_ov002_0222ca78
_LIT5: .word data_ov002_022d016c
_LIT6: .word data_ov002_022cf16c
