; func_ov002_0223e080 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce720
        .extern data_ov002_022cf16c
        .global func_ov002_0223e080
        .arm
func_ov002_0223e080:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    cmp r1, #0x5
    addlt r0, r0, #0x8
    addlt lr, r0, r1, lsl #0x1
    blt .L_17c
    ldrh r0, [r0, #0x12]
    ldr r2, _LIT0
    add r0, r0, r1
    sub r0, r0, #0x5
    mov r1, r0, lsr #0x1f
    rsb r0, r1, r0, lsl #0x19
    add r0, r1, r0, ror #0x19
    add lr, r2, r0, lsl #0x1
.L_17c:
    ldrh r5, [lr]
    mov r0, r5, lsl #0x1b
    mov r6, r0, lsr #0x1c
    cmp r6, #0xa
    ldmhiia sp!, {r3, r4, r5, r6, r7, pc}
    mov r0, r5, lsl #0x1f
    mov r2, r0, lsr #0x1f
    ldr r1, _LIT1
    mov r0, #0x14
    ldr r4, _LIT2
    and r2, r2, #0x1
    mla r3, r2, r4, r1
    add r2, r3, #0x30
    mul r0, r6, r0
    ldr r2, [r2, r0]
    mov r3, r5, lsl #0x12
    mov r0, r2, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r2, r2, lsl #0x12
    mov r0, r0, lsl #0x1
    mov ip, r3, lsr #0x17
    add r0, r0, r2, lsr #0x1f
    cmp ip, r0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    mov r2, #0x0
    mov r0, r2
.L_1e4:
    and r3, r2, #0x1
    mla r5, r3, r4, r1
    mov r3, r0
    add r7, r5, #0x30
.L_1f4:
    ldr r6, [r7]
    mov r5, r6, lsl #0x2
    mov r5, r5, lsr #0x18
    mov r6, r6, lsl #0x12
    mov r5, r5, lsl #0x1
    add r5, r5, r6, lsr #0x1f
    cmp ip, r5
    bne .L_250
    ldrh r1, [lr]
    mov r0, r2, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r1, r1, #0x1
    and r0, r0, #0x1
    orr r0, r1, r0
    strh r0, [lr]
    ldrh r1, [lr]
    mov r0, r3, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r1, r1, #0x1e
    mov r0, r0, lsl #0x1c
    orr r0, r1, r0, lsr #0x1b
    strh r0, [lr]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_250:
    add r3, r3, #0x1
    cmp r3, #0xa
    add r7, r7, #0x14
    ble .L_1f4
    add r2, r2, #0x1
    cmp r2, #0x2
    blt .L_1e4
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_ov002_022ce720
_LIT1: .word data_ov002_022cf16c
_LIT2: .word 0x00000868
