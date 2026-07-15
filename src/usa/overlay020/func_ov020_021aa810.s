; func_ov020_021aa810 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0207eb40
        .extern func_0207f84c
        .global func_ov020_021aa810
        .arm
func_ov020_021aa810:
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0xc
    mov r5, r3
    mov r4, r1
    mov r6, r2
    bl func_0207eb40
    mov r1, r0, lsl #0x10
    str r5, [sp]
    mov r3, #0x0
    str r3, [sp, #0x4]
    str r3, [sp, #0x8]
    ldr r0, [r4]
    mov r2, r6
    mov r1, r1, lsr #0x10
    bl func_0207f84c
    cmp r0, #0x0
    beq .L_1c8
    ldr r2, [sp, #0x20]
    ldr r3, [r4]
    cmp r2, #0x0
    blt .L_174
    ldrh r1, [r3, #0x4]
    and r1, r1, #0xc00
    cmp r2, r1, asr #0xa
    beq .L_174
    cmp r0, #0x0
    mov ip, #0x0
    bls .L_174
.L_154:
    ldrh r1, [r3, #0x4]
    add ip, ip, #0x1
    cmp ip, r0
    bic r1, r1, #0xc00
    orr r1, r1, r2, lsl #0xa
    strh r1, [r3, #0x4]
    add r3, r3, #0x8
    bcc .L_154
.L_174:
    ldr r2, [sp, #0x24]
    ldr r3, [r4]
    cmp r2, #0x0
    blt .L_1c8
    ldrh r1, [r3, #0x4]
    and r1, r1, #0xf000
    cmp r2, r1, asr #0xc
    beq .L_1c8
    cmp r0, #0x0
    mov ip, #0x0
    bls .L_1c8
.L_1a0:
    ldrh r1, [r3, #0x4]
    add ip, ip, #0x1
    cmp ip, r0
    bic r1, r1, #0xf000
    strh r1, [r3, #0x4]
    ldrh r1, [r3, #0x4]
    orr r1, r1, r2, lsl #0xc
    strh r1, [r3, #0x4]
    add r3, r3, #0x8
    bcc .L_1a0
.L_1c8:
    ldr r1, [r4]
    add r1, r1, r0, lsl #0x3
    str r1, [r4]
    add sp, sp, #0xc
    ldmia sp!, {r3, r4, r5, r6, pc}
