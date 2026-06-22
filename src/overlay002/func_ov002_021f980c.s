; func_ov002_021f980c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf178
        .extern func_ov002_021ae400
        .extern func_ov002_021f4a84
        .extern func_ov002_021ff3bc
        .extern func_ov002_022536e8
        .extern func_ov002_0226b094
        .global func_ov002_021f980c
        .arm
func_ov002_021f980c:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r7, r0
    ldrh r3, [r7, #0x2]
    mov r6, r1
    mov r2, r3, lsl #0x11
    mov r3, r3, lsl #0x1f
    mov r2, r2, lsr #0x1f
    eor r4, r2, r3, lsr #0x1f
    bl func_ov002_021ff3bc
    cmp r0, #0x0
    mvneq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    ldr r0, _LIT0
    and r2, r4, #0x1
    mul r1, r2, r0
    ldr r0, _LIT1
    mov r5, #0x0
    ldr r0, [r0, r1]
    cmp r0, #0x0
    bls .L_90
    ldr r0, _LIT2
    add r8, r0, r1
.L_58:
    ldrh r1, [r7]
    mov r0, r4
    mov r2, r5
    bl func_ov002_022536e8
    cmp r0, #0x0
    beq .L_80
    mov r0, r7
    mov r1, r6
    bl func_ov002_021f4a84
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_80:
    ldr r0, [r8, #0xc]
    add r5, r5, #0x1
    cmp r5, r0
    bcc .L_58
.L_90:
    ldr r0, _LIT3
    ldr r0, [r0, #0x5b4]
    cmp r0, #0x0
    beq .L_ac
    cmp r0, #0x1
    beq .L_d0
    b .L_e4
.L_ac:
    ldr r1, _LIT4
    mov r0, r4
    bl func_ov002_021ae400
    ldr r1, _LIT3
    mov r0, #0x0
    ldr r2, [r1, #0x5b4]
    add r2, r2, #0x1
    str r2, [r1, #0x5b4]
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_d0:
    ldr r1, _LIT5
    rsb r0, r4, #0x1
    bl func_ov002_0226b094
    mvn r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_e4:
    mvn r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf178
_LIT2: .word data_ov002_022cf16c
_LIT3: .word data_ov002_022ce288
_LIT4: .word 0x00000122
_LIT5: .word 0x000010d6
