; func_020142b4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern GetSystemWork
        .extern func_0200a26c
        .extern func_020139b4
        .extern func_02019034
        .extern func_020195ec
        .extern func_02019640
        .extern func_02019664
        .extern func_0201b7b4
        .extern func_0201b7e0
        .global func_020142b4
        .arm
func_020142b4:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    bl GetSystemWork
    mov r4, r0
    ldr r0, [r4, #0x8d8]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r0, [r4, #0x920]
    cmp r0, #0x1
    beq .L_890
    cmp r0, #0x2
    beq .L_8f0
    cmp r0, #0x3
    beq .L_9e4
    ldmia sp!, {r3, r4, r5, pc}
.L_890:
    bl func_020139b4
    cmp r0, #0x2
    ldmneia sp!, {r3, r4, r5, pc}
    mov r0, r5
    bl func_0201b7e0
    cmp r0, #0x4
    ldmneia sp!, {r3, r4, r5, pc}
    bl func_02019034
    ldr r1, [r4, #0x8dc]
    add r1, r1, #0x1
    cmp r0, r1
    ldmccia sp!, {r3, r4, r5, pc}
    ldr r1, [r4, #0x900]
    ldr r0, _LIT0
    orr r1, r1, #0x1000000
    str r1, [r4, #0x900]
    str r0, [r5, #0x8]
    ldr r0, [r4, #0x8e0]
    mov r0, r0, lsl #0x1e
    movs r0, r0, lsr #0x1f
    ldmneia sp!, {r3, r4, r5, pc}
    mov r0, #0xb
    bl func_0200a26c
    ldmia sp!, {r3, r4, r5, pc}
.L_8f0:
    ldr r0, [r4, #0x924]
    cmp r0, #0x4
    addls pc, pc, r0, lsl #0x2
    ldmia sp!, {r3, r4, r5, pc}
    ldmia sp!, {r3, r4, r5, pc}
    b .L_914
    b .L_9a0
    b .L_944
    b .L_91c
.L_914:
    mov r0, #0x4
    str r0, [r4, #0x924]
.L_91c:
    bl func_02019664
    cmp r0, #0x6b
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r0, _LIT1
    str r0, [r5, #0x8]
    ldr r0, [r4, #0x8e0]
    bic r0, r0, #0x1
    orr r0, r0, #0x1
    str r0, [r4, #0x8e0]
    ldmia sp!, {r3, r4, r5, pc}
.L_944:
    ldr r0, [r4, #0x8e0]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    ldmneia sp!, {r3, r4, r5, pc}
    bl func_020195ec
    cmp r0, #0x0
    bne .L_994
    ldr r0, _LIT2
    str r0, [r5, #0x8]
    ldr r0, [r4, #0x8e0]
    mov r0, r0, lsl #0x1e
    movs r0, r0, lsr #0x1f
    ldreq r0, [r4, #0x924]
    subeq r0, r0, #0x1
    streq r0, [r4, #0x924]
    bl func_0201b7b4
    ldr r0, [r4, #0x900]
    bic r0, r0, #0x1000000
    str r0, [r4, #0x900]
    ldmia sp!, {r3, r4, r5, pc}
.L_994:
    ldr r0, _LIT3
    str r0, [r5, #0x8]
    ldmia sp!, {r3, r4, r5, pc}
.L_9a0:
    ldr r0, _LIT4
    str r0, [r5, #0x8]
    ldr r0, [r4, #0x8e0]
    mov r0, r0, lsl #0x1e
    movs r0, r0, lsr #0x1f
    bne .L_9c8
    mov r0, #0x2
    str r0, [r4, #0x920]
    mov r0, #0x5
    str r0, [r4, #0x924]
.L_9c8:
    ldr r0, [r4, #0x8e0]
    mov r0, r0, lsl #0x1e
    movs r0, r0, lsr #0x1f
    ldmneia sp!, {r3, r4, r5, pc}
    mov r0, #0x0
    bl func_02019640
    ldmia sp!, {r3, r4, r5, pc}
.L_9e4:
    mov r0, r5
    bl func_0201b7e0
    cmp r0, #0x4
    ldreq r0, _LIT5
    streq r0, [r5, #0x8]
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x00060100
_LIT1: .word 0x00060200
_LIT2: .word 0x00060204
_LIT3: .word 0x00060202
_LIT4: .word 0x00060203
_LIT5: .word 0x00060205
