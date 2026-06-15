; func_0207ec68 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Fill32
        .extern data_0210249c
        .extern data_021a08f4
        .extern func_020928cc
        .extern func_020940ac
        .global func_0207ec68
        .arm
func_0207ec68:
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, r0
    ldr r0, [r5, #0x14]
    cmp r0, #0x0
    beq .L_240
    ldrh r2, [r5, #0x6]
    ldrh r1, [r5, #0x8]
    mov r3, #0x0
    add r0, r2, #0x1
    cmp r1, r0
    bgt .L_1bc
    ldrh r0, [r5, #0x4]
    cmp r0, r2
    movls r3, #0x1
.L_1bc:
    cmp r3, #0x0
    moveq r4, #0x0
    beq .L_1dc
    ldrh r0, [r5, #0x4]
    sub r0, r2, r0
    add r0, r0, #0x1
    mov r0, r0, lsl #0x10
    mov r4, r0, lsr #0xd
.L_1dc:
    ldr r2, [r5]
    ldr r1, _LIT0
    mov r0, #0x540
    mla r1, r2, r0, r1
    ldrh r0, [r5, #0x4]
    add r2, r1, #0x100
    mov r1, r4
    add r6, r2, r0, lsl #0x3
    mov r0, r6
    bl func_020928cc
    ldr r0, _LIT1
    mvn r1, #0x0
    ldr r0, [r0]
    cmp r0, r1
    beq .L_22c
    mov r1, r6
    mov r3, r4
    mov r2, #0xc0
    bl func_020940ac
    b .L_294
.L_22c:
    mov r1, r6
    mov r2, r4
    mov r0, #0xc0
    bl Fill32
    b .L_294
.L_240:
    ldr r2, [r5]
    ldr r1, _LIT0
    mov r0, #0x540
    mla r1, r2, r0, r1
    ldrh r2, [r5, #0x4]
    ldrh r0, [r5, #0x6]
    add r1, r1, #0x100
    add r3, r1, r2, lsl #0x3
    sub r0, r0, r2
    add r0, r0, #0x1
    mov r0, r0, lsl #0x10
    movs r2, r0, lsr #0x10
    mov r0, #0x0
    beq .L_294
    mov r1, #0xc0
.L_27c:
    add r0, r0, #0x1
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    cmp r0, r2
    strh r1, [r3], #0x8
    bcc .L_27c
.L_294:
    ldrh r0, [r5, #0x4]
    strh r0, [r5, #0x8]
    ldrh r0, [r5, #0xa]
    strh r0, [r5, #0xe]
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_021a08f4
_LIT1: .word data_0210249c
