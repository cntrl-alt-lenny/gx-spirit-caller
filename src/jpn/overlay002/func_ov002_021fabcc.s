; func_ov002_021fabcc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf09c
        .extern func_ov002_021bcfbc
        .extern func_ov002_021f4994
        .extern func_ov002_021ff410
        .extern func_ov002_0220ad84
        .extern func_ov002_0220b6bc
        .extern func_ov002_0220bbec
        .extern func_ov002_0220cce4
        .extern func_ov002_022576f4
        .global func_ov002_021fabcc
        .arm
func_ov002_021fabcc:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldrh r2, [r5]
    ldr ip, _LIT0
    mov r4, r1
    cmp r2, ip
    bgt .L_50
    bge .L_11c
    ldr r0, _LIT1
    cmp r2, r0
    bgt .L_40
    bge .L_d0
    sub r0, r0, #0x62
    cmp r2, r0
    beq .L_9c
    b .L_168
.L_40:
    ldr r0, _LIT2
    cmp r2, r0
    beq .L_100
    b .L_168
.L_50:
    add r3, ip, #0x73
    cmp r2, r3
    bgt .L_8c
    add r3, ip, #0x72
    cmp r2, r3
    blt .L_7c
    beq .L_144
    add r0, ip, #0x73
    cmp r2, r0
    beq .L_100
    b .L_168
.L_7c:
    add r3, ip, #0x47
    cmp r2, r3
    beq .L_130
    b .L_168
.L_8c:
    ldr r3, _LIT3
    cmp r2, r3
    beq .L_158
    b .L_168
.L_9c:
    ldrh r0, [r5, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bcfbc
    cmp r0, #0x0
    mvneq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    mov r0, r5
    bl func_ov002_022576f4
    cmp r0, #0x0
    bne .L_168
    mvn r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_d0:
    ldrh r2, [r5, #0x2]
    ldr r0, _LIT4
    ldr r1, _LIT5
    mov r2, r2, lsl #0x1f
    mov r2, r2, lsr #0x1f
    and r2, r2, #0x1
    mul r0, r2, r0
    ldr r0, [r1, r0]
    cmp r0, #0x0
    bne .L_168
    mvn r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_100:
    mov r0, r5
    mov r1, r4
    bl func_ov002_0220bbec
    cmp r0, #0x0
    bne .L_168
    mvn r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_11c:
    bl func_ov002_0220ad84
    cmp r0, #0x0
    bne .L_168
    mvn r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_130:
    bl func_ov002_0220b6bc
    cmp r0, #0x0
    bne .L_168
    mvn r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_144:
    bl func_ov002_021ff410
    cmp r0, #0x0
    bne .L_168
    mvn r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_158:
    bl func_ov002_0220cce4
    cmp r0, #0x0
    mvneq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
.L_168:
    mov r0, r5
    mov r1, r4
    bl func_ov002_021f4994
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x0000190a
_LIT1: .word 0x00001445
_LIT2: .word 0x000017cc
_LIT3: .word 0x00001a28
_LIT4: .word 0x00000868
_LIT5: .word data_ov002_022cf09c
