; func_ov002_0225ab80 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d008c
        .extern func_ov002_021ae320
        .extern func_ov002_021b40c4
        .extern func_ov002_021d46ac
        .extern func_ov002_021d5a90
        .extern func_ov002_021d5b60
        .extern func_ov002_021e2fc4
        .extern func_ov002_02259fb0
        .global func_ov002_0225ab80
        .arm
func_ov002_0225ab80:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, _LIT0
    mov r4, r0
    ldr r1, [r1, #0xd30]
    cmp r1, #0x0
    beq .L_314
    cmp r1, #0x1
    beq .L_3c0
    b .L_410
.L_314:
    bl func_ov002_02259fb0
    cmp r0, #0x0
    beq .L_360
    ldr r2, _LIT1
    mov r0, r4
    mov r1, #0xb
    mov r3, #0x1
    bl func_ov002_021d5a90
    ldr r1, _LIT2
    mov r0, r4
    bl func_ov002_021ae320
    ldr r1, _LIT0
    mov r0, #0xd
    str r0, [r1, #0xd2c]
    mov r0, #0x0
    str r0, [r1, #0xd30]
    mov r2, #0x1
    str r2, [r1, #0xd34]
    ldmia sp!, {r3, r4, r5, pc}
.L_360:
    cmp r4, #0x0
    movne r0, #0x8000
    moveq r0, #0x0
    orr r0, r0, #0x18
    mov r0, r0, lsl #0x10
    mov r2, #0x0
    mov r3, r2
    mov r0, r0, lsr #0x10
    mov r1, #0x1
    bl func_ov002_021d46ac
    mov r1, #0x0
    cmp r4, #0x0
    movne r0, #0x8000
    moveq r0, #0x0
    orr r0, r0, #0xf
    mov r0, r0, lsl #0x10
    mov r2, r1
    mov r3, r1
    mov r0, r0, lsr #0x10
    bl func_ov002_021d46ac
    ldr r0, _LIT0
    ldr r1, [r0, #0xd30]
    add r1, r1, #0x1
    str r1, [r0, #0xd30]
.L_3c0:
    ldr r2, _LIT3
    mov r0, r4
    mov r1, #0xb
    bl func_ov002_021b40c4
    movs r5, r0
    bmi .L_410
    ldr r2, _LIT3
    mov r0, r4
    mov r3, r5
    mov r1, #0xb
    bl func_ov002_021d5b60
    mov r1, r4, lsl #0x1f
    ldr r0, _LIT4
    and r1, r1, #-2147483648
    orr r0, r1, r0
    mov r2, r5
    mov r1, #0x0
    bl func_ov002_021e2fc4
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_410:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022d008c
_LIT1: .word 0x000016a1
_LIT2: .word 0x00000136
_LIT3: .word 0x00001a7a
_LIT4: .word 0x0a501a7a
