; func_ov002_0226a2cc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d008c
        .extern data_ov002_022d0d8c
        .extern func_ov002_021b8eec
        .extern func_ov002_021bc5e4
        .extern func_ov002_021bcf50
        .extern func_ov002_021d6f64
        .extern func_ov002_021de390
        .global func_ov002_0226a2cc
        .arm
func_ov002_0226a2cc:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    ldr r2, _LIT0
    mov r5, r0
    ldr r2, [r2, #0xd9c]
    mov r7, r1
    cmp r2, #0x0
    bne .L_8d8
    bl func_ov002_021bc5e4
    rsb r6, r5, #0x1
    mov r4, r0
    mov r0, r6
    mov r1, r7
    bl func_ov002_021b8eec
    cmp r0, #0x0
    beq .L_868
    mov r0, r5
    bl func_ov002_021bcf50
    cmp r0, #0x0
    mvnlt r4, #0x0
.L_868:
    mvn r0, #0x0
    cmp r4, r0
    bne .L_88c
    mov r0, r6
    mov r1, r7
    mov r2, #0x1
    mov r3, #0x0
    bl func_ov002_021de390
    b .L_8b8
.L_88c:
    and r1, r6, #0xff
    and r0, r7, #0xff
    orr r0, r1, r0, lsl #0x8
    mov r0, r0, lsl #0x10
    and r2, r5, #0xff
    and r1, r4, #0xff
    orr r1, r2, r1, lsl #0x8
    mov r1, r1, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    bl func_ov002_021d6f64
.L_8b8:
    ldr r0, _LIT1
    ldr r1, _LIT0
    strh r4, [r0, #0xb0]
    ldr r2, [r1, #0xd9c]
    mov r0, #0x0
    add r2, r2, #0x1
    str r2, [r1, #0xd9c]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_8d8:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_ov002_022d008c
_LIT1: .word data_ov002_022d0d8c
