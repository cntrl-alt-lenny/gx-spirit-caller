; func_ov002_0229407c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern func_ov002_021b3014
        .extern func_ov002_021c8470
        .extern func_ov002_02280df4
        .global func_ov002_0229407c
        .arm
func_ov002_0229407c:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    ldrh r1, [r4, #0x2]
    ldr r2, _LIT0
    ldr ip, _LIT1
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    rsb r3, r1, #0x1
    and lr, r1, #0x1
    and r3, r3, #0x1
    mul r5, lr, r2
    mul r2, r3, r2
    ldr r3, [ip, r5]
    ldr r2, [ip, r2]
    cmp r3, r2
    bge .L_c4
    mvn r2, #0x0
    mov r3, #0x0
    bl func_ov002_02280df4
    ldrh r1, [r4, #0x2]
    mov r5, r0
    ldr r2, _LIT2
    mov r0, r1, lsl #0x1f
    mov r1, r5
    mov r0, r0, lsr #0x1f
    bl func_ov002_021b3014
    cmp r0, #0x0
    beq .L_90
    ldrh r1, [r4, #0x2]
    mov r0, r4
    mov r2, r5
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    mov r3, #0x0
    bl func_ov002_02280df4
    mov r5, r0
.L_90:
    cmp r5, #0x0
    blt .L_bc
    ldrh r0, [r4, #0x2]
    mov r1, r5
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021c8470
    ldr r1, _LIT3
    cmp r0, r1
    movge r0, #0x1
    ldmgeia sp!, {r3, r4, r5, pc}
.L_bc:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_c4:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf16c
_LIT2: .word 0x00001237
_LIT3: .word 0x000005dc
