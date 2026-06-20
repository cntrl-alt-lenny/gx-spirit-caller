; func_ov002_022bbcb4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd000
        .extern data_ov002_022cd07c
        .extern data_ov002_022d28fc
        .extern func_020a978c
        .extern func_ov002_022b867c
        .extern func_ov002_022bdb88
        .global func_ov002_022bbcb4
        .arm
func_ov002_022bbcb4:
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0x4
    mov r4, r0
    ldr r0, [r4, #0xc60]
    cmp r0, #0x0
    beq .L_28
    cmp r0, #0x1
    cmpne r0, #0x2
    beq .L_198
    b .L_1b0
.L_28:
    add r0, r4, #0xc00
    ldrh r0, [r0, #0x6a]
    add r6, r4, #0xc00
    ldrh r6, [r6, #0x6c]
    mov r0, r0, lsl #0x11
    movs r0, r0, lsr #0x1f
    add r0, r4, #0xc00
    ldrh r0, [r0, #0x6a]
    movne r1, #0x2
    add ip, r4, #0xc00
    mov r0, r0, lsl #0x10
    moveq r1, #0x0
    movs r0, r0, lsr #0x1f
    add r0, r4, #0xc00
    ldrh r0, [r0, #0x6a]
    movne r2, #0x1
    ldrh ip, [ip, #0x6c]
    mov r0, r0, lsl #0x1a
    add lr, r4, #0xc00
    moveq r2, #0x0
    mov r0, r0, lsr #0x1b
    cmp r0, #0xb
    moveq r3, #0x4
    ldrh lr, [lr, #0x6c]
    mov r6, r6, lsl #0x10
    movne r3, #0x0
    movs r6, r6, lsr #0x1f
    movne r6, #0x10
    mov lr, lr, lsl #0x1a
    orr r1, r2, r1
    mov ip, ip, lsl #0x11
    moveq r6, #0x0
    movs ip, ip, lsr #0x1f
    movne ip, #0x20
    orr r1, r3, r1
    mov lr, lr, lsr #0x1b
    moveq ip, #0x0
    cmp lr, #0xb
    moveq lr, #0x40
    movne lr, #0x0
    cmp r0, #0xb
    ldreq r0, [r4, #0xc90]
    orr r1, r6, r1
    addeq r0, r0, #0x1d
    streq r0, [r4, #0xc90]
    add r0, r4, #0x98
    add r0, r0, #0xc00
    orr r1, ip, r1
    str r0, [sp]
    add r0, r4, #0xc00
    orr r6, lr, r1
    ldrh r1, [r0, #0x6c]
    mov r0, r4
    ldr r5, _LIT0
    mov r2, r1, lsl #0x1a
    mov r3, r1, lsl #0x12
    mov ip, r1, lsl #0x1f
    mov r1, ip, lsr #0x1f
    mov r2, r2, lsr #0x1b
    mov r3, r3, lsr #0x18
    bl func_ov002_022b867c
    add r0, r4, #0xc00
    ldrh r0, [r0, #0x6c]
    add r1, r4, #0x8c
    mov r2, r6
    mov r0, r0, lsl #0x1a
    mov r0, r0, lsr #0x1b
    cmp r0, #0xb
    ldr r0, [r4, #0xc9c]
    addeq r0, r0, #0x1d
    addne r0, r0, #0x2
    str r0, [r4, #0xc9c]
    add r0, r4, #0x98
    add r3, r0, #0xc00
    str r3, [sp]
    add r3, r1, #0xc00
    mov r0, r5
    mov r1, #0x49
    bl func_ov002_022bdb88
    add r0, r4, #0x28c
    ldr r2, [r4, #0xc5c]
    ldr r1, _LIT1
    add r0, r0, #0x800
    bl func_020a978c
    add r0, r4, #0x2b4
    ldr r1, _LIT2
    add r0, r0, #0x800
    bl func_020a978c
    mov r0, #0x1
    str r0, [r4, #0xc60]
    mov r0, #0x0
    str r0, [r4, #0xc64]
.L_198:
    mov r0, #0xc
    str r0, [r4, #0xcc8]
    mov r0, #0x0
    add sp, sp, #0x4
    str r0, [r4, #0xc54]
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_1b0:
    ldr r1, [r4, #0xc64]
    mov r0, #0x1
    add r1, r1, #0x1
    str r1, [r4, #0xc64]
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, pc}
_LIT0: .word data_ov002_022d28fc
_LIT1: .word data_ov002_022cd000
_LIT2: .word data_ov002_022cd07c
