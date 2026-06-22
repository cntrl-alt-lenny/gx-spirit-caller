; func_ov002_02229b54 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern data_ov002_022d016c
        .extern data_ov002_022d0e6c
        .extern func_ov002_021ae400
        .extern func_ov002_021de408
        .extern func_ov002_021de4b0
        .extern func_ov002_021e96a0
        .extern func_ov002_021efac8
        .extern func_ov002_02257750
        .extern func_ov002_02257878
        .extern func_ov002_0225935c
        .extern func_ov002_022593f4
        .extern func_ov002_0226b258
        .global func_ov002_02229b54
        .arm
func_ov002_02229b54:
    stmdb sp!, {r4, lr}
    ldr r1, _LIT0
    mov r4, r0
    ldr r1, [r1, #0x5a8]
    sub r1, r1, #0x7d
    cmp r1, #0x3
    addls pc, pc, r1, lsl #0x2
    b .L_134
    b .L_100
    b .L_cc
    b .L_50
    b .L_30
.L_30:
    ldrh r0, [r4, #0x2]
    mov r1, r0, lsl #0x1a
    mov r2, r0, lsl #0x1f
    mov r0, r2, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_0226b258
    mov r0, #0x7f
    ldmia sp!, {r4, pc}
.L_50:
    ldr r1, _LIT1
    ldrh r1, [r1, #0xb0]
    cmp r1, #0x6
    addls pc, pc, r1, lsl #0x2
    b .L_c4
    b .L_c4
    b .L_80
    b .L_80
    b .L_98
    b .L_98
    b .L_98
    b .L_b0
.L_80:
    ldr r1, _LIT2
    bl func_ov002_02257750
    mov r1, r0
    mov r0, r4
    bl func_ov002_021de408
    b .L_c4
.L_98:
    ldr r1, _LIT2
    bl func_ov002_02257878
    cmp r0, #0x0
    beq .L_c4
    mov r0, #0x7e
    ldmia sp!, {r4, pc}
.L_b0:
    ldr r1, _LIT3
    bl func_ov002_02257750
    mov r1, r0
    mov r0, r4
    bl func_ov002_021de408
.L_c4:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_cc:
    ldrh r0, [r4, #0x2]
    mov r1, #0x62
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae400
    ldrh r0, [r4, #0x2]
    ldrh r1, [r4]
    ldr r2, _LIT2
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_0225935c
    mov r0, #0x7d
    ldmia sp!, {r4, pc}
.L_100:
    bl func_ov002_022593f4
    cmp r0, #0x0
    moveq r0, #0x7e
    ldmeqia sp!, {r4, pc}
    ldr r1, _LIT4
    mov r0, r4
    ldr r3, [r1, #0xd74]
    ldr r2, [r1, #0xd78]
    ldr r1, [r1, #0xd70]
    add r2, r3, r2
    bl func_ov002_021de4b0
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_134:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word data_ov002_022d0e6c
_LIT2: .word func_ov002_021e96a0
_LIT3: .word func_ov002_021efac8
_LIT4: .word data_ov002_022d016c
