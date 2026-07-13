; func_0206b050 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02101d18
        .extern data_0219ebf0
        .extern func_02054b98
        .extern func_02054d44
        .extern func_02054dfc
        .extern func_02054e18
        .extern func_0206b184
        .extern func_0206eb74
        .extern func_020a9698
        .extern func_020aad04
        .global func_0206b050
        .arm
func_0206b050:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x88
    mov r4, r0
    add r0, r4, #0xc
    mov r1, #0x14
    bl func_0206b184
    ldr r1, _LIT0
    mov r3, r0
    ldr r1, [r1]
    cmp r1, #0x0
    beq .L_38
    add r0, sp, #0x8
    bl func_020aad04
    b .L_48
.L_38:
    ldr r1, _LIT1
    add r0, sp, #0x8
    add r2, r4, #0xc
    bl func_020a9698
.L_48:
    ldr r1, _LIT2
    mov r2, #0x2
    add r0, sp, #0x8
    strb r2, [sp, #0x1]
    strh r1, [sp, #0x2]
    bl func_02054b98
    mvn r1, #0x0
    str r0, [sp, #0x4]
    cmp r0, r1
    bne .L_b4
    add r0, sp, #0x8
    bl func_0206eb74
    cmp r0, #0x0
    addeq sp, sp, #0x88
    moveq r0, #0x2
    ldmeqia sp!, {r4, pc}
    ldr r0, [r0, #0xc]
    add r3, sp, #0x4
    ldr r2, [r0]
    ldrb r1, [r2]
    ldrb r0, [r2, #0x1]
    strb r1, [r3]
    strb r0, [r3, #0x1]
    ldrb r1, [r2, #0x2]
    ldrb r0, [r2, #0x3]
    strb r1, [r3, #0x2]
    strb r0, [r3, #0x3]
.L_b4:
    ldr r0, [r4, #0x4b0]
    mvn r1, #0x0
    cmp r0, r1
    bne .L_f0
    mov r0, #0x2
    mov r1, #0x1
    mov r2, #0x0
    bl func_02054e18
    str r0, [r4, #0x4b0]
    ldr r0, [r4, #0x4b0]
    mvn r1, #0x0
    cmp r0, r1
    addeq sp, sp, #0x88
    moveq r0, #0x1
    ldmeqia sp!, {r4, pc}
.L_f0:
    add r1, sp, #0x0
    mov r2, #0x8
    bl func_02054d44
    cmp r0, #0x0
    addeq sp, sp, #0x88
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r0, [r4, #0x4b0]
    bl func_02054dfc
    mvn r0, #0x0
    str r0, [r4, #0x4b0]
    mov r0, #0x3
    add sp, sp, #0x88
    ldmia sp!, {r4, pc}
_LIT0: .word data_0219ebf0
_LIT1: .word data_02101d18+0x4
_LIT2: .word 0x0000ee70
