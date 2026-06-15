; func_02031ebc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02032014
        .global func_02031ebc
        .arm
func_02031ebc:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r1
    ldr r1, [r4]
    mov r5, r0
    cmp r1, #0x0
    ldrne r0, [r4, #0x4]
    strne r0, [r1, #0x4]
    bne .L_30
    ldr r0, [r5, #0x8]
    cmp r0, r4
    ldreq r0, [r4, #0x4]
    streq r0, [r5, #0x8]
.L_30:
    ldr r1, [r4, #0x4]
    cmp r1, #0x0
    ldrne r0, [r4]
    strne r0, [r1]
    bne .L_5c
    adds r0, r5, #0xc
    beq .L_5c
    ldr r0, [r5, #0xc]
    cmp r0, r4
    ldreq r0, [r4]
    streq r0, [r5, #0xc]
.L_5c:
    ldr r0, [r4, #0x10]
    tst r0, #0x1
    bne .L_74
    ldr r1, [r4, #0x1c]
    mov r0, r5
    bl func_02032014
.L_74:
    mov r0, r5
    mov r1, r4
    bl func_02032014
    ldmia sp!, {r3, r4, r5, pc}
