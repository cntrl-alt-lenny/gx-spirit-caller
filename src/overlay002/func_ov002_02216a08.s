; func_ov002_02216a08 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021d8904
        .extern func_ov002_021de408
        .extern func_ov002_021e104c
        .extern func_ov002_02257704
        .global func_ov002_02216a08
        .arm
func_ov002_02216a08:
    stmdb sp!, {r4, lr}
    ldrh r2, [r1, #0x4]
    mov r4, r0
    ldr r3, _LIT0
    orr r2, r2, #0x4
    strh r2, [r1, #0x4]
    ldrh ip, [r4]
    cmp ip, r3
    bgt .L_60
    bge .L_100
    sub r2, r3, #0x25
    cmp ip, r2
    bgt .L_158
    sub r2, r3, #0x27
    cmp ip, r2
    blt .L_158
    beq .L_70
    sub r2, r3, #0x26
    cmp ip, r2
    beq .L_98
    sub r1, r3, #0x25
    cmp ip, r1
    beq .L_c4
    b .L_158
.L_60:
    ldr r0, _LIT1
    cmp ip, r0
    beq .L_118
    b .L_158
.L_70:
    ldrh r1, [r4, #0x2]
    mov r2, #0x1f
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    rsb r1, r1, #0x1
    mov r1, r1, lsl #0x4
    mov r1, r2, lsl r1
    bl func_ov002_021de408
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_98:
    ldrh r2, [r1, #0x2]
    ldrh r0, [r1, #0x4]
    mov r1, r2, lsl #0x1a
    mov r3, r2, lsl #0x1f
    mov r2, r0, lsl #0x11
    mov r0, r3, lsr #0x1f
    mov r1, r1, lsr #0x1b
    mov r2, r2, lsr #0x17
    bl func_ov002_021d8904
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_c4:
    ldrh r1, [r4, #0x2]
    mov r3, #0x1
    mov r4, #0x1f
    mov r2, r1, lsl #0x1f
    mov ip, r2, lsr #0x1f
    mov r2, r1, lsl #0x1a
    mov r1, ip, lsl #0x4
    add r1, r1, r2, lsr #0x1b
    rsb r2, ip, #0x1
    mov r1, r3, lsl r1
    mov r2, r2, lsl #0x4
    orr r1, r1, r4, lsl r2
    bl func_ov002_021de408
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_100:
    bl func_ov002_02257704
    mov r1, r0
    mov r0, r4
    bl func_ov002_021de408
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_118:
    ldrh r2, [r1, #0x2]
    ldrh r0, [r1, #0x4]
    mov r1, r2, lsl #0x1a
    mov r3, r2, lsl #0x1f
    mov r2, r0, lsl #0x11
    mov r0, r3, lsr #0x1f
    mov r1, r1, lsr #0x1b
    mov r2, r2, lsr #0x17
    bl func_ov002_021d8904
    ldrh r0, [r4, #0x2]
    mov r1, #0x1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021e104c
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_158:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word 0x0000131c
_LIT1: .word 0x0000162a
