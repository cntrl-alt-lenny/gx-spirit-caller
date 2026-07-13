; func_020b0778 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02102b48
        .extern data_02102b78
        .extern data_02102ba0
        .extern data_02102bb8
        .extern data_02102bc8
        .extern data_02102bd0
        .extern data_02102bd8
        .extern data_02102be0
        .extern data_02102be8
        .extern func_020b0558
        .extern func_020b06dc
        .extern func_020b0778
        .global func_020b0778
        .arm
func_020b0778:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4c
    mov r4, r1
    mvn r2, #0x34
    mov r5, r0
    cmp r4, r2
    bgt .L_30
    bge .L_fc
    sub r0, r2, #0xb
    cmp r4, r0
    beq .L_e4
    b .L_28c
.L_30:
    add r1, r4, #0x20
    cmp r1, #0x28
    addls pc, pc, r1, lsl #0x2
    b .L_28c
    b .L_110
    b .L_28c
    b .L_28c
    b .L_28c
    b .L_28c
    b .L_28c
    b .L_28c
    b .L_28c
    b .L_28c
    b .L_28c
    b .L_28c
    b .L_28c
    b .L_28c
    b .L_28c
    b .L_28c
    b .L_28c
    b .L_124
    b .L_28c
    b .L_28c
    b .L_28c
    b .L_28c
    b .L_28c
    b .L_28c
    b .L_28c
    b .L_138
    b .L_14c
    b .L_160
    b .L_174
    b .L_188
    b .L_19c
    b .L_1b0
    b .L_1c4
    b .L_1d8
    b .L_1ec
    b .L_200
    b .L_214
    b .L_228
    b .L_23c
    b .L_250
    b .L_264
    b .L_278
.L_e4:
    ldr r1, _LIT0
    mov r0, r5
    mvn r2, #0x13
    bl func_020b06dc
    add sp, sp, #0x4c
    ldmia sp!, {r4, r5, pc}
.L_fc:
    ldr r1, _LIT1
    add r2, r2, #0x25
    bl func_020b06dc
    add sp, sp, #0x4c
    ldmia sp!, {r4, r5, pc}
.L_110:
    ldr r1, _LIT2
    add r2, r2, #0x2b
    bl func_020b06dc
    add sp, sp, #0x4c
    ldmia sp!, {r4, r5, pc}
.L_124:
    ldr r1, _LIT3
    add r2, r2, #0x30
    bl func_020b06dc
    add sp, sp, #0x4c
    ldmia sp!, {r4, r5, pc}
.L_138:
    ldr r1, _LIT4
    add r2, r2, #0x32
    bl func_020b06dc
    add sp, sp, #0x4c
    ldmia sp!, {r4, r5, pc}
.L_14c:
    ldr r1, _LIT5
    add r2, r2, #0x32
    bl func_020b06dc
    add sp, sp, #0x4c
    ldmia sp!, {r4, r5, pc}
.L_160:
    ldr r1, _LIT6
    add r2, r2, #0x33
    bl func_020b06dc
    add sp, sp, #0x4c
    ldmia sp!, {r4, r5, pc}
.L_174:
    ldr r1, _LIT7
    add r2, r2, #0x33
    bl func_020b06dc
    add sp, sp, #0x4c
    ldmia sp!, {r4, r5, pc}
.L_188:
    ldr r1, _LIT8
    add r2, r2, #0x33
    bl func_020b06dc
    add sp, sp, #0x4c
    ldmia sp!, {r4, r5, pc}
.L_19c:
    ldr r1, _LIT9
    add r2, r2, #0x34
    bl func_020b06dc
    add sp, sp, #0x4c
    ldmia sp!, {r4, r5, pc}
.L_1b0:
    ldr r1, _LIT10
    add r2, r2, #0x34
    bl func_020b06dc
    add sp, sp, #0x4c
    ldmia sp!, {r4, r5, pc}
.L_1c4:
    ldr r1, _LIT11
    add r2, r2, #0x34
    bl func_020b06dc
    add sp, sp, #0x4c
    ldmia sp!, {r4, r5, pc}
.L_1d8:
    ldr r1, _LIT12
    mov r2, #0x0
    bl func_020b06dc
    add sp, sp, #0x4c
    ldmia sp!, {r4, r5, pc}
.L_1ec:
    ldr r1, _LIT13
    mov r2, #0x0
    bl func_020b06dc
    add sp, sp, #0x4c
    ldmia sp!, {r4, r5, pc}
.L_200:
    ldr r1, _LIT14
    mov r2, #0x0
    bl func_020b06dc
    add sp, sp, #0x4c
    ldmia sp!, {r4, r5, pc}
.L_214:
    ldr r1, _LIT15
    mov r2, #0x0
    bl func_020b06dc
    add sp, sp, #0x4c
    ldmia sp!, {r4, r5, pc}
.L_228:
    ldr r1, _LIT16
    mov r2, #0x1
    bl func_020b06dc
    add sp, sp, #0x4c
    ldmia sp!, {r4, r5, pc}
.L_23c:
    ldr r1, _LIT17
    mov r2, #0x1
    bl func_020b06dc
    add sp, sp, #0x4c
    ldmia sp!, {r4, r5, pc}
.L_250:
    ldr r1, _LIT18
    mov r2, #0x1
    bl func_020b06dc
    add sp, sp, #0x4c
    ldmia sp!, {r4, r5, pc}
.L_264:
    ldr r1, _LIT19
    mov r2, #0x2
    bl func_020b06dc
    add sp, sp, #0x4c
    ldmia sp!, {r4, r5, pc}
.L_278:
    ldr r1, _LIT20
    mov r2, #0x2
    bl func_020b06dc
    add sp, sp, #0x4c
    ldmia sp!, {r4, r5, pc}
.L_28c:
    and r0, r4, #-2147483648
    add r1, r4, r0, lsr #0x1f
    add r0, sp, #0x26
    mov r1, r1, asr #0x1
    bl func_020b0778
    add r1, sp, #0x26
    mov r0, r5
    mov r2, r1
    bl func_020b0558
    tst r4, #0x1
    addeq sp, sp, #0x4c
    ldmeqia sp!, {r4, r5, pc}
    add r3, sp, #0x0
    mov ip, r5
    mov r2, #0x9
.L_2c8:
    ldrh r1, [ip]
    ldrh r0, [ip, #0x2]
    add ip, ip, #0x4
    subs r2, r2, #0x1
    strh r1, [r3]
    strh r0, [r3, #0x2]
    add r3, r3, #0x4
    bne .L_2c8
    ldrh r0, [ip]
    cmp r4, #0x0
    strh r0, [r3]
    add r0, sp, #0x26
    ble .L_30c
    ldr r1, _LIT13
    mov r2, #0x0
    bl func_020b06dc
    b .L_318
.L_30c:
    ldr r1, _LIT11
    mvn r2, #0x0
    bl func_020b06dc
.L_318:
    add r1, sp, #0x0
    add r2, sp, #0x26
    mov r0, r5
    bl func_020b0558
    add sp, sp, #0x4c
    ldmia sp!, {r4, r5, pc}
_LIT0: .word data_02102b48
_LIT1: .word data_02102b78
_LIT2: .word data_02102ba0
_LIT3: .word data_02102bb8
_LIT4: .word data_02102bc8
_LIT5: .word data_02102bd0
_LIT6: .word data_02102bd8
_LIT7: .word data_02102be0
_LIT8: .word data_02102be8
_LIT9: .word data_02102be8+0x4
_LIT10: .word data_02102be8+0x8
_LIT11: .word data_02102be8+0xc
_LIT12: .word data_02102be8+0x10
_LIT13: .word data_02102be8+0x14
_LIT14: .word data_02102be8+0x18
_LIT15: .word data_02102be8+0x1c
_LIT16: .word data_02102be8+0x20
_LIT17: .word data_02102be8+0x24
_LIT18: .word data_02102be8+0x28
_LIT19: .word data_02102be8+0x2c
_LIT20: .word data_02102be8+0x30
