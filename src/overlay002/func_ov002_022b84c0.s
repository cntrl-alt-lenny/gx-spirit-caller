; func_ov002_022b84c0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cccc0
        .extern data_ov002_022d1410
        .extern data_ov002_022d1910
        .global func_ov002_022b84c0
        .arm
func_ov002_022b84c0:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x4
    ldr r0, _LIT0
    ldr r4, _LIT1
    ldrh lr, [r0, #0x90]
    mov r0, lr, lsl #0x1a
    mov ip, r0, lsr #0x1b
    strh lr, [sp]
    cmp ip, #0xb
    bne .L_60
    mov r0, lr, lsl #0x1f
    mov r3, r0, lsr #0x1f
    mov r0, #0xcc
    mla r0, r3, r0, r4
    ldr r0, [r0, #0x488]
    mov ip, lr, lsl #0x12
    ldr r3, _LIT2
    rsb lr, r0, ip, lsr #0x18
    smull r0, r4, r3, lr
    add r4, r4, lr, lsr #0x1f
    mov ip, #0x3
    smull r0, r3, ip, r4
    sub r4, lr, r0
    b .L_70
.L_60:
    mov r0, #0x6
    mul r3, ip, r0
    ldr r0, _LIT3
    ldrsh r4, [r0, r3]
.L_70:
    cmp r4, #0x0
    beq .L_88
    cmp r4, #0x1
    beq .L_9c
    cmp r4, #0x2
    beq .L_b0
.L_88:
    mov r0, #0x17000
    str r0, [r1]
    mov r0, #0x0
    str r0, [r2]
    b .L_c0
.L_9c:
    mov r0, #0x16000
    str r0, [r1]
    mov r0, #0x1500
    str r0, [r2]
    b .L_c0
.L_b0:
    mov r0, #0x15000
    str r0, [r1]
    mov r0, #0xeb00
    str r0, [r2]
.L_c0:
    mov r0, #0x1
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, pc}
_LIT0: .word data_ov002_022d1910
_LIT1: .word data_ov002_022d1410
_LIT2: .word 0x55555556
_LIT3: .word data_ov002_022cccc0
