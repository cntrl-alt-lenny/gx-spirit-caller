; func_ov002_0227eba4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cdb98
        .extern data_ov002_022cdba8
        .extern func_ov002_021afff0
        .extern func_ov002_0227e65c
        .global func_ov002_0227eba4
        .arm
func_ov002_0227eba4:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    ldr r4, _LIT0
    mov r6, #0x0
    ldr r1, [r4, #0xc]
    mov r7, r0
    mov r5, r6
    cmp r1, #0x0
    bls .L_338
    ldr r8, _LIT1
.L_304:
    mov r0, r5
    bl func_ov002_0227e65c
    cmp r0, #0x0
    bne .L_324
    ldr r0, [r8]
    mov r0, r0, lsl #0x13
    cmp r7, r0, lsr #0x13
    addne r6, r6, #0x1
.L_324:
    ldr r1, [r4, #0xc]
    add r5, r5, #0x1
    cmp r5, r1
    add r8, r8, #0x4
    bcc .L_304
.L_338:
    cmp r6, #0x0
    bne .L_378
    cmp r1, #0x0
    mov r5, #0x0
    bls .L_3e0
    ldr r4, _LIT0
.L_350:
    mov r0, r5
    bl func_ov002_0227e65c
    cmp r0, #0x0
    moveq r0, r5
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    ldr r0, [r4, #0xc]
    add r5, r5, #0x1
    cmp r5, r0
    bcc .L_350
    b .L_3e0
.L_378:
    mov r0, r6
    bl func_ov002_021afff0
    ldr r8, _LIT0
    mov r4, r0
    ldr r0, [r8, #0xc]
    mov r6, #0x0
    cmp r0, #0x0
    bls .L_3e0
    ldr r5, _LIT1
.L_39c:
    mov r0, r6
    bl func_ov002_0227e65c
    cmp r0, #0x0
    bne .L_3cc
    ldr r0, [r5]
    mov r0, r0, lsl #0x13
    cmp r7, r0, lsr #0x13
    beq .L_3cc
    cmp r4, #0x0
    sub r4, r4, #0x1
    moveq r0, r6
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
.L_3cc:
    ldr r0, [r8, #0xc]
    add r6, r6, #0x1
    cmp r6, r0
    add r5, r5, #0x4
    bcc .L_39c
.L_3e0:
    mvn r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_ov002_022cdb98
_LIT1: .word data_ov002_022cdba8
