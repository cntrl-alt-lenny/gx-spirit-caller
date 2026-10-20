; func_02064dfc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020c3754
        .extern data_02101554
        .extern data_02101578
        .extern func_02054c0c
        .extern func_0206ebe8
        .extern func_020a6d54
        .extern func_020a7368
        .extern Strchr
        .extern func_020ace00
        .global func_02064dfc
        .arm
func_02064dfc:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x104
    movs r8, r0
    mov r7, r1
    mov r6, r2
    beq .L_24
    ldrsb r1, [r8]
    cmp r1, #0x0
    bne .L_30
.L_24:
    mov r5, #0x0
    mov r4, r5
    b .L_15c
.L_30:
    mov r1, #0x3a
    bl Strchr
    movs r4, r0
    moveq r4, #0x0
    beq .L_118
    cmp r4, r8
    moveq r8, #0x0
    moveq r5, r8
    beq .L_90
    sub r9, r4, r8
    cmp r9, #0x100
    blt .L_74
    ldr r0, _LIT0
    ldr r1, _LIT1
    mov r2, #0x0
    mov r3, #0x81
    bl func_020a6d54
.L_74:
    add r0, sp, #0x0
    mov r1, r8
    mov r2, r9
    bl func_020a7368
    add r8, sp, #0x0
    mov r0, #0x0
    strb r0, [r8, r9]
.L_90:
    ldrsb r0, [r4, #0x1]
    add r3, r4, #0x1
    cmp r0, #0x0
    beq .L_e8
    ldr r1, _LIT2
    mov r2, #0x0
.L_a8:
    cmp r0, #0x0
    blt .L_b8
    cmp r0, #0x80
    blt .L_c0
.L_b8:
    mov r0, r2
    b .L_cc
.L_c0:
    mov r0, r0, lsl #0x1
    ldrh r0, [r1, r0]
    and r0, r0, #0x8
.L_cc:
    cmp r0, #0x0
    addeq sp, sp, #0x104
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, pc}
    ldrsb r0, [r3, #0x1]!
    cmp r0, #0x0
    bne .L_a8
.L_e8:
    add r0, r4, #0x1
    bl func_020ace00
    cmp r0, #0x0
    blt .L_104
    ldr r1, _LIT3
    cmp r0, r1
    ble .L_110
.L_104:
    add sp, sp, #0x104
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
.L_110:
    mov r0, r0, lsl #0x10
    mov r4, r0, lsr #0x10
.L_118:
    cmp r8, #0x0
    beq .L_15c
    mov r0, r8
    bl func_02054c0c
    mov r5, r0
    mvn r0, #0x0
    cmp r5, r0
    bne .L_15c
    mov r0, r8
    bl func_0206ebe8
    cmp r0, #0x0
    addeq sp, sp, #0x104
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, pc}
    ldr r0, [r0, #0xc]
    ldr r0, [r0]
    ldr r5, [r0]
.L_15c:
    cmp r7, #0x0
    strne r5, [r7]
    cmp r6, #0x0
    strneh r4, [r6]
    mov r0, #0x1
    add sp, sp, #0x104
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_02101554+0x4
_LIT1: .word data_02101578
_LIT2: .word data_020c3754
_LIT3: .word 0x0000ffff
